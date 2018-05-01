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
      # ref = "MRB",
      dependencies = FALSE
    )
  }
)
devtools::install_github("rstudio/rstudioapi", force = TRUE)
devtools::install_github("rstudio/httpuv", force = TRUE)
devtools::install_github("rstudio/shiny", force = TRUE)
devtools::install_github("trestletech/shinyAce", force = TRUE)

## to install the release version
packages <- c(
  "radiant.data", "radiant.design", "radiant.basics",
  "radiant.model", "radiant.multivariate", "radiant",
  "shiny", "httpuv", "later", "rstudioapi"
)
# packages <- c(
#   "radiant.data", "radiant.design", "radiant.basics",
#   "radiant.model", "radiant.multivariate", "radiant"
# )
ret <- sapply(
  packages,
  install.packages,
  repos = c(
    "https://radiant-rstats.github.io/minicran/dev/",
    "https://radiant-rstats.github.io/minicran/"
  )
)

## by listing the call to the radiant library it will get picked up as a dependency
library(radiant)
