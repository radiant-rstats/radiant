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
sapply(apps, update_app, mess = "Cleanup", git = TRUE, github = TRUE)

## build for mac
build_app <- function(app) {
	devtools::build(file.path("..",app))
	devtools::build(file.path("..",app), binary = TRUE)
}
sapply(apps, build_app)

## build for packages ahead of CRAN
non_cran <- function(app) {
	devtools::install(file.path("..",app))
	devtools::build(file.path("..",app))
	devtools::build(file.path("..",app), binary = TRUE)
}
apps <- c("shiny","DT","DiagrammeR", "NeuralNetTools")
sapply(apps, build_app)

