## restart before installing from github
.rs.restartR()

## install the latest version from github so it will be used on shinyapps.io
devtools::install_github("radiant-rstats/radiant.data")
devtools::install_github("radiant-rstats/radiant.design")
devtools::install_github("radiant-rstats/radiant.basics")
devtools::install_github("radiant-rstats/radiant.model")
devtools::install_github("radiant-rstats/radiant.multivariate")
devtools::install_github("radiant-rstats/radiant")

## by listing the call to the radiant library it will get picked up as a dependency
library(radiant)
