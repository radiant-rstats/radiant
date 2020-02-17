## install the latest version from github so it will be used on shinyapps.io
packages <- paste0("radiant-rstats/", c(
  "radiant.data", "radiant.design", "radiant.basics",
  "radiant.model", "radiant.multivariate", "radiant"
))

packages <- c(packages, "trestletech/shinyAce", "vnijs/DiagrammeR")

## Use the code below to install the development version
if (!require(remotes)) {
  install.packages("remotes")
}
ret <- sapply(
  packages,
  function(p) {
    remotes::install_github(
      p,
      dependencies = FALSE,
      upgrade = "never"
    )
  }
)

install.packages(c("shinyFiles", "htmltools"), repo = "https://cloud.r-project.org/")

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
library(htmltools)

