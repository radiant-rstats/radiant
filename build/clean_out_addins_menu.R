apps <- c(
  "radiant.data", "radiant.design", "radiant.basics", "radiant.model",
  "radiant.multivariate", "radiant.update", "radiant"
)

## build for mac
build_app <- function(app) {
  f <- devtools::build(file.path("../", app))
  system(paste0("R CMD INSTALL --build ", f))
}
sapply(apps, build_app)
