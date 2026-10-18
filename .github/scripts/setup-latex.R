# TinyTeX's platform selection can be incorrect in prebuilt R packages.
# Select the official macOS bundle explicitly and keep it inside the runner.
packages <- c("geometry", "hyperref", "amsmath", "fancyvrb", "grfext")
if (identical(Sys.info()[["sysname"]], "Darwin")) {
    archive <- tempfile(fileext = ".tar.xz")
    download.file(
        "https://github.com/rstudio/tinytex-releases/releases/download/daily/TinyTeX-1-darwin.tar.xz",
        archive, mode = "wb")
    root <- file.path(Sys.getenv("RUNNER_TEMP", unset = tempdir()), "ridgelrglh-tex")
    dir.create(root, recursive = TRUE, showWarnings = FALSE)
    untar(archive, exdir = root)
    unlink(archive)
    bins <- list.dirs(root, recursive = TRUE, full.names = TRUE)
    bins <- bins[file.exists(file.path(bins, "pdflatex"))]
    if (length(bins) != 1L) stop("Cannot locate the macOS TinyTeX binaries")
    Sys.setenv(PATH = paste(bins, Sys.getenv("PATH"), sep = .Platform$path.sep))
    status <- system2(file.path(bins, "tlmgr"),
        c("option", "repository", "https://mirror.ctan.org/systems/texlive/tlnet"))
    if (status != 0L) stop("Cannot configure the TeX package repository")
    status <- system2(file.path(bins, "tlmgr"), c("install", packages))
    if (status != 0L) stop("Cannot install required LaTeX packages")
} else {
    tinytex::install_tinytex()
    status <- tinytex::tlmgr_install(packages)
    if (status != 0L) stop("Cannot install required LaTeX packages")
    bins <- list.dirs(file.path(tinytex::tinytex_root(), "bin"),
                      full.names = TRUE, recursive = FALSE)
    Sys.setenv(PATH = paste(c(bins, Sys.getenv("PATH")), collapse = .Platform$path.sep))
}
if (!nzchar(Sys.which("pdflatex"))) stop("pdflatex is not on PATH")
if (system2("pdflatex", "--version") != 0L) stop("pdflatex cannot execute")
cat(paste(bins, collapse = "\n"), "\n",
    file = Sys.getenv("GITHUB_PATH"), append = TRUE, sep = "")
