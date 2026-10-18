## First submission

RidgeLRGLH implements ridge-regularized largest root tests for
high-dimensional general linear hypotheses and common-covariance double
Wishart problems. It accompanies Haoran Li's article accepted by the Annals
of Statistics, with public preprint doi:10.48550/arXiv.2504.15510.

## Local test environment

* macOS Tahoe 26.6, Apple Silicon
* R 4.6.1 (2026-06-24)
* R CMD check --as-cran

## Check results

0 errors | 0 warnings | 2 notes

* New submission.
* Local HTML validation is skipped because the installed HTML Tidy is too
  old and the optional V8 package is unavailable. Rd files, HTML generation,
  PDF manual, examples, tests and vignette checks pass.

There are no reverse dependencies. Package code does not access the network,
modify user files, or launch external processes. Documentation describes the
asymptotic nature and finite-sample limitations of the calibration.

## Windows R-devel (Win-builder)

* Windows Server 2022 x64, x86_64-w64-mingw32
* R Under development (unstable), 2026-10-17 r90697 ucrt
* Source archive: RidgeLRGLH_0.1.0.tar.gz (original Win-builder upload)
* 0 errors | 0 warnings | 1 note

The incoming-feasibility note reports a new submission and flags "Widom"
as possibly misspelled. "Widom" is a proper surname in the name of the
Tracy-Widom distribution and is spelled correctly.
All examples, regression tests, vignette rebuilding, PDF manual and HTML
manual checks passed.

Windows R-release results have not yet been received or reviewed.
