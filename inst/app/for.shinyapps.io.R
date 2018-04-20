## restart before installing from github
# rstudioapi::restartSession()

## install the latest version from github so it will be used on shinyapps.io
packages <- c("radiant.data", "radiant.design", "radiant.basics", "radiant.model", "radiant.multivariate", "radiant")
## Use the code below to install the development version
# install.packages("devtools")
sapply(
  packages,
  function(p) devtools::install_github(paste0("radiant-rstats/", p), ref = "MRB", dependencies = FALSE)
)
devtools::install_github("rstudio/rstudioapi", force = TRUE)
devtools::install_github("rstudio/httpuv", force = TRUE)
devtools::install_github("rstudio/shiny", force = TRUE)
devtools::install_github("trestletech/shinyAce", force = TRUE)

## by listing the call to the radiant library it will get picked up as a dependency
library(radiant)
