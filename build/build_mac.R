## Update applications
update_app <- function(app, mess = "Update [ci skip]", git = FALSE, github = FALSE) {
  cat("========================================\n")
  cat("Working on app:", app)
  cat("\n========================================\n")
	setwd(file.path("~/gh/",app))
	devtools::document(roclets = c('rd', 'collate', 'namespace'))
	devtools::install(dependencies = FALSE)
	if (git) {
		system("git add --all .")
		system(paste0("git commit -m '",mess,"'"))
	}
	if (github) system("git push")
	invisible()
}

apps <- c("radiant.data","radiant.design","radiant.basics", "radiant.model",
          "radiant.multivariate","radiant")

sapply(apps, update_app, mess = "update", git = TRUE, github = TRUE)
# sapply(apps, update_app, git = FALSE, github = FALSE)

## build for mac
path <- "~/gh"
curr <- getwd(); setwd(path)
build_app <- function(app) {
	# devtools::build(file.path("..",app))
	# devtools::build(file.path("..",app), binary = TRUE)
	f <- devtools::build(file.path(path, app))
	system(paste0("R CMD INSTALL --build ", f))
}
sapply(apps, build_app)
setwd(curr)

## build for packages ahead of CRAN
# non_cran <- function(app) {
# 	devtools::install(file.path("..",app))
# 	devtools::build(file.path("..",app))
# 	devtools::build(file.path("..",app), binary = TRUE)
# }
#
# ncapps <- c("shiny","DT","DiagrammeR", "NeuralNetTools")
# sapply(ncapps, build_app)
