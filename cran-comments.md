## Resubmission

This is a resubmission. In this version I have:

* removed the vignette to eliminate the "Package has a VignetteBuilder field but no prebuilt vignette index" note
* added tests to avoid "checking for code which exercises the package ... WARNING No examples, no tests, no vignettes" warning

## Previous cran-comments

This is a resubmission. In this version I have:

* Removed the offending URL.
* Used single quotes for R package names in the Description
* I did various searches online and, as far as I can tell, I am following the appropriate devtools process (FYI I'm using devtools 1.12.0) and (re-)building and knitting the vignette during the build process works fine. Could you perhaps provide additional guidance about how one might even fix "Package has a VignetteBuilder field but no prebuilt vignette index."? Should the submission contain an INDEX file? If so, could you point to an example? Would it be appropriate to make a pdf of the vignette and submit that?
* If no additional guidance is available I will remove the vignette as the same document is available at the following link:
https://radiant-rstats.github.io/docs/programming.html. However, that will lead to the warning "checking for code which exercises the package ... WARNING No examples, no tests, no vignettes". As previously stated "Radiant is an rstudio addin and a shiny app. The UI code is in inst/app and must be tested interactively. The code in R/ is for running and updating the application and is only used in interactive sessions. In sum, testing must be done by the package maintainer and the end-user. The analysis code used as part of Radiant is in the packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate that I recently submitted to CRAN and is tested there." Please advice. Thanks.



## Resubmission

This is a resubmission. In this version I have:

* I was already using R 3.3.1 for the previous submission and (re-)building and knitting the vignette works fine. I did various searches online and, as far as I can tell, I am following the appropriate devtools process. If the message still shows up I must not fully understand the pre-built index issue. FYI I'm using devtools 1.12.0.
* Changed the Description field so it does not start with the package name
* Radiant is an rstudio addin and a shiny app. The UI code is in inst/app and must be tested interactively. The code in R/ is for running and updating the application and is only used in interactive sessions. In sum, testing must be done by the package maintainer and the end-user. The analysis code used as part of Radiant is in the packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate that I recently submitted to CRAN and is tested there.

## Test environments
* local OS X install, R 3.3.1
* local Windows install, R 3.3.1
* ubuntu 12.04 (on travis-ci), R 3.3.1
* win-builder (devel and release)

## R CMD check results
There were no ERRORs.

There was 1 NOTE: New submission. This package was archived.
