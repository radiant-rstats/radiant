## Update applications
curr <- getwd()
update_app <- function(app, mess = "Update [ci skip]", git = FALSE, github = FALSE) {
  cat("========================================\n")
  cat("Working on app:", app)
  cat("\n========================================\n")
  setwd(file.path(curr, app))
  devtools::document(roclets = c("rd", "collate", "namespace"))
  devtools::install(dependencies = FALSE)
  if (git) {
    system("git add --all .")
    system(paste0("git commit -m '", mess, "'"))
  }
  if (github) system("git push")
  invisible()
}

apps <- c(
  "shinyAce",
  "shinyFiles",
  "gitgadget",
  "radiant.data",
  "radiant.design",
  "radiant.basics",
  "radiant.model",
  "radiant.multivariate",
  "radiant.update",
  "radiant"
)

sapply(apps, update_app, mess = "CRAN", git = TRUE, github = TRUE)

## build for packages ahead of CRAN
# apps <- c("shinyAce", "rstudioapi", apps)

## build for mac
setwd(curr)
build_app <- function(app) {
  f <- devtools::build(file.path(curr, app))
  system(paste0("R CMD INSTALL --build ", f))
}
sapply(apps, build_app)
setwd(curr)
