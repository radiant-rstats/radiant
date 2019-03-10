## restart before installing from github
# rstudioapi::restartSession()

## install the latest version from github so it will be used on shinyapps.io
packages <- c(
  "radiant.data", "radiant.design", "radiant.basics",
  "radiant.model", "radiant.multivariate", "radiant"
)
## Use the code below to install the development version
if (!require(devtools)) {
  install.packages("devtools")
}
ret <- sapply(
  packages,
  function(p) {
    devtools::install_github(
      paste0("radiant-rstats/", p),
      dependencies = FALSE
    )
  }
)

# devtools::install_github("rstudio/rstudioapi")
# devtools::install_github("rstudio/DT")
# devtools::install_github("trestletech/shinyAce")
# devtools::install_github("thomasp85/shinyFiles")
install.packages(c("rstudioapi", "DT", "shinyAce", "shinyFiles"))

## to install the release version
# packages <- c(
#   "radiant.data", "radiant.design", "radiant.basics",
#   "radiant.model", "radiant.multivariate", "radiant",
#   "shiny", "httpuv", "later", "rstudioapi"
# )

# packages <- c(
#   "radiant.data", "radiant.design", "radiant.basics",
#   "radiant.model", "radiant.multivariate", "radiant"
# )
# ret <- sapply(
#   packages,
#   install.packages,
#   repos = c(
#     "https://radiant-rstats.github.io/minicran/dev/",
#     "https://radiant-rstats.github.io/minicran/"
#   )
# )

## by listing the call to the radiant library it will get picked up as a dependency
# library(radiant)

library(radiant.data)
library(radiant.design)
library(radiant.basics)
library(radiant.model)
library(radiant.multivariate)
library(rstudioapi)
library(shinyAce)
library(shinyFiles)
library(DT)

