## restart before installing from github
# .rs.restartR()

## install the latest version from github so it will be used on shinyapps.io
devtools::install_github("radiant-rstats/radiant.data", force = TRUE)
devtools::install_github("radiant-rstats/radiant.design", force = TRUE)
devtools::install_github("radiant-rstats/radiant.basics", force = TRUE)
devtools::install_github("radiant-rstats/radiant.model", force = TRUE)
devtools::install_github("radiant-rstats/radiant.multivariate", force = TRUE)
devtools::install_github("radiant-rstats/radiant", force = TRUE)
# devtools::install_github("rstudio/rstudioapi", force = TRUE)
# devtools::install_github("rstudio/shiny", force = TRUE)

## last pre-dplyr 0.7.1 release
# devtools::install_github("radiant-rstats/radiant.data@v0.8.6", force = TRUE)
# devtools::install_github("radiant-rstats/radiant.design@v0.8.1")
# devtools::install_github("radiant-rstats/radiant.basics@v0.8.3")
# devtools::install_github("radiant-rstats/radiant.model@v0.8.3")
# devtools::install_github("radiant-rstats/radiant.multivariate@v0.8.2")
# devtools::install_github("radiant-rstats/radiant@v0.8.2")
# devtools::install_github("tidyverse/dplyr@v0.5.0")

## by listing the call to the radiant library it will get picked up as a dependency
library(radiant)
