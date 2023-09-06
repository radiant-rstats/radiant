## build for windows
rv <- R.Version()
rv <- paste0(rv$major, ".", strsplit(rv$minor, ".", fixed = TRUE)[[1]][1])

rvprompt <- readline(prompt = paste0("Running for R version: ", rv, ". Is that what you wanted y/n: "))
if (grepl("[nN]", rvprompt)) {
  stop("Change R-version using Rstudio > Tools > Global Options > Rversion")
}
apps <- c(
  "radiant.data",
  "radiant.design",
  "radiant.basics",
  "radiant.model",
  "radiant.multivariate",
  "radiant.update",
  "radiant"
)

sapply(apps, function(x) devtools::install(pkg = paste0("../", x), upgrade = "never"))

path <- normalizePath(file.path(rstudioapi::getActiveProject(), ".."), winslash = "/")
curr <- setwd(path)
build_app <- function(app) {
  f <- devtools::build(file.path(".", app), binary = TRUE)
}
sapply(apps, build_app)
setwd(curr)

fl <- list.files(pattern = "*.zip", path = "../", full.names = TRUE)
for (f in fl) {
  print(glue::glue("Copying: {f}"))
  file.copy(f, "C:/Users/vnijs/Dropbox/r-packages/", overwrite = TRUE)
  unlink(f)
}


## testing
remove.packages(c("radiant.data", "radiant.model", "radiant", "radiant.basics", "radiant.design", "radiant.multivariate"))
options(repos = c(RSM = "https://radiant-rstats.github.io/minicran"))
install.packages("radiant.update")
# install.packages("radiant.data", type = "binary")
radiant.update::radiant.update()
