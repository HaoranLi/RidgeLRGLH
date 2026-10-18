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

Windows and R-devel checks should be added before submitting this text.
