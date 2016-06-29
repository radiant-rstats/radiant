apps <- c("radiant.data","radiant.design","radiant.basics", "radiant.model",
          "radiant.multivariate","radiant")

## build for mac
# build_app <- function(app) {
# 	devtools::install(file.path("..",app))
# 	devtools::build(file.path("..",app), binary = TRUE)
# }

path <- "Z:/Desktop/GitHub"
#curr <- getwd(); setwd(path)
build_app <- function(app) {
	f <- devtools::build(file.path(path, app))
	system(paste0("R CMD INSTALL --build ", f))
}
sapply(apps, build_app)
#setwd(curr)

## build for packages ahead of CRAN
# non_cran <- function(app) {
# 	devtools::install(file.path("..",app))
# 	devtools::build(file.path("..",app), binary = TRUE)
# }
# ncapps <- c("shiny","DT","DiagrammeR", "NeuralNetTools")
# sapply(ncapps, build_app)
