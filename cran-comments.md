## Resubmission

This is a resubmission. In this version I have fixed several bugs and added several new features (see NEWS.md for details).

## Test environments

* local OS X install, R 3.6.3
* ubuntu "trusty" (on travis-ci), R release and devel
* win-builder (devel)

## R CMD check results

There were no ERRORs, WARNINGs, or NOTEs. 

# Previous cran-comments

## Resubmission

This is a resubmission. In this version I have updated dependencies to address an issue with building a vignette brought to my attention by an email from Prof Ripley (see email below). I believe the problem is related an issue in radiant.multivariate after recent changes to dplyr (0.8.1).

radiant now requires radiant.multivariate >= 0.9.9.1 and should build the vignette correctly without excissive memory consumption

## Test environments

* local OS X install, R 3.6.0
* local Windows install, R 3.6.0
* ubuntu "trusty" (on travis-ci), R release and devel
* win-builder

## R CMD check results

There were no ERRORs, WARNINGs, or NOTEs. 


Date: Wed, May 15, 2019 at 12:43 AM
Subject: CRAN package radiant
To: Vincent Nijs <radiant@rady.ucsd.edu>
Cc: CRAN <CRAN@r-project.org>


See https://cran.r-project.org/web/checks/check_results_radiant.html .

This is using a ridiculous amount of RAM for its vignettes: on a larger 
machine I saw a peak allocation of 313Gb, 260 of which was in memory.

Please correct ASAP (using a maximum of 5GB) and before May 22 to safely 
retain the package on CRAN.  Meanwhile we will exclude checking the 
vignettes.

-- 
Brian D. Ripley,                  ripley@stats.ox.ac.uk
Emeritus Professor of Applied Statistics, University of Oxford


# Previous cran-comments

## Resubmission

This is a resubmission. In this version I have fixed several bugs and added several new features (see NEWS.md for details).

## Test environments

* local OS X install, R 3.5.2
* local Windows install, R 3.5.2
* ubuntu "trusty" (on travis-ci), R release and devel
* win-builder

## R CMD check results

There were no ERRORs, WARNINGs, or NOTEs. 

## Resubmission

radiant was recently archived and removed from CRAN. Uwe Ligges confirmed that multiple emails were sent to my radiant@rady.ucsd.edu email address but, unfortunately, I cannot find any such emails in my inbox. I hope you will accept radiant as a resubmission.

## Test environments

* local OS X install, R 3.5.1
* local Windows install, R 3.5.1
* Ubuntu "trusty" (on travis-ci), R oldrel, release, and devel
* win-builder

## R CMD check results

There were no ERRORs, WARNINGs, or NOTEs. 

## Resubmission

This is a resubmission. In this version I have fixed several bugs and added several new features (see NEWS.md for details).

radiant depends on all radiant.* packages. From the last time I submitted updates to CRAN I seem to recall Uwe Ligges suggested I submit all radiant packages to be updated at the same time. I hope my recollection is correct and that this is indeed the preferred approach that will minimize workload for CRAN.

## Test environments

* local OS X install, R 3.5.0
* local Windows install, R 3.5.0
* ubuntu "trusty" (on travis-ci), R release and devel
* win-builder

## R CMD check results

There were no ERRORs, WARNINGs, or NOTEs. 

## Previous cran-comments

## Resubmission

This is a resubmission (0.8.0). In this version I have updated all dependencies to the `radiant.*` packages and fixed notes shown at https://cran.rstudio.com/web/checks/check_results_radiant.html. 

Please note that this version addresses the reverse dependency check warnings from radiant.data for the `radiant.*` packages. Deprecating the `*_each` commands used in the 0.6.0 versions of the `radiant.*` packages is related to the deprecation of the `*_each` functions in dplyr.

## Test environments

* local OS X install, R 3.4
* local Windows install, R 3.4
* ubuntu 14.04 (on travis-ci), R 3.3.3 and R-dev
* win-builder (release)

## R CMD check results

There were no ERRORs or WARNINGs. There was one NOTE about possibly mis-spelled words ("Analytics" and "analytics"). The spelling is correct however. 

## Resubmission

This is a resubmission. In this version I have tried to make all requested changes as follows:

"You still refer to multiple help pages on Github, e.g. https://radiant-rstats.github.io/docs/radiant.multivariate.pdf."

* There are no more links to GitHub in the vignette

"You refer to local files (at least "/docs/data/code.html") that will not exist on your users' systems."

* There are no references to files that are not on the user's system in the vignette

"You still have no examples in your help pages."

* I have added examples to the help pages. Please note, however, that they are set to 'dontrun' because the functions exported in the radiant package should not be run as a part of automated testing.

I apologize if I missed something or did not provided the expected changes. I'm happy to fix or change whatever is required.

## Previous cran-comments

## Resubmission

This is a resubmission. In this version I have:

* Fixed the links in the vignette. Thanks!
* Radiant is a shiny app and all help associated with its sub-packages (e.g., radiant.data) is available when your run the app (see inst/app/tools/help in 'radiant.data' for its source markdown files). Having access to these help files through the user interface is more convenient than through R or Rstudio help because you also see it directly in the browser. See https://youtu.be/9qAQio9Hb7k?t=53 for an illustration. Note that users have access to these help files even if they are offline (i.e., they are part of the radiant packages).
* I still have links to the _Report_ and _Code_ page on github in the vignette. These are not function manuals but illustrate how to use the shiny user interface.
* For reference, maybe it is useful to mention that the structure of the radiant package is somewhat similar to the recently released 'tidyverse' package that pools functionality across several packages
* I now show `help(package = radiant.data)` rather than the github links to the manuals. I hope that is what you were looking for
* There are no examples because the package is an rstudio addin and a shiny app. The UI code is in inst/app and must be tested interactively. The code in R/ is for running and updating the application and is only used in interactive sessions. In sum, testing, including examples, must be done by the package maintainer and the end-user. The analysis code used as part of the different Radiant menu's is in the packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate that I recently submitted to CRAN and is tested there.

## Previous cran-comments

## Resubmission

This is a resubmission. In this version I have:

* added a vignette to document the package

## Previous cran-comments

## Resubmission

* I was already using R 3.3.1 for the previous submissions and (re-)building and knitting the vignette worked fine. I did various searches online and, as far as I can tell, I followed the appropriate devtools process. The message continued to show up however. I asked for additional guidance but didn't receive any and so I decided to remove the vignette to avoid wasting more CRAN time. Also, the text that was in the vignette is also available on the Radiant documentation site at the following link: https://radiant-rstats.github.io/docs/programming.html
* Radiant is an rstudio addin and a shiny app. The UI code is in inst/app and must be tested interactively. The code in R/ is for running and updating the application and is only used in interactive sessions. In sum, testing, including examples, must be done by the package maintainer and the end-user. The analysis code used as part of the different Radiant menu's is in the packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate that I recently submitted to CRAN and is tested there.

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
