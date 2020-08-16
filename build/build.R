setwd(rstudioapi::getActiveProject())
curr <- getwd()
pkg <- basename(curr)

## building radiant packages for mac and windows
dev <- FALSE

if (isTRUE(dev)) {
  devprompt <- readline(prompt = paste0("Are you sure you want to build a developement version y/n: "))
  if (grepl("[nN]", devprompt)) {
    stop("Set 'dev' to FALSE")
  }
}

rv <- R.Version()
rv <- paste(rv$major, substr(rv$minor, 1, 1), sep = ".")

rvprompt <- readline(prompt = paste0("Running for R version: ", rv, ". Is that what you wanted y/n: "))
if (grepl("[nN]", rvprompt)) stop("Change R-version")

dirsrc <- "../minicran/src/contrib"

if (rv < "3.4") {
  dirmac <- fs::path("../minicran/bin/macosx/mavericks/contrib", rv)
} else if (rv > "3.6") {
  dirmac <- fs::path("../minicran/bin/macosx/contrib", rv)
} else {
  dirmac <- fs::path("../minicran/bin/macosx/el-capitan/contrib", rv)
}

dirwin <- file.path("../minicran/bin/windows/contrib", rv)

if (!file.exists(dirsrc)) dir.create(dirsrc, recursive = TRUE)
if (!file.exists(dirmac)) dir.create(dirmac, recursive = TRUE)
if (!file.exists(dirwin)) dir.create(dirwin, recursive = TRUE)

## delete older version of radiant
rem_old <- function(app) {
  unlink(paste0(dirsrc, "/", app, "_*"))
  unlink(paste0(dirmac, "/", app, "_*"))
  unlink(paste0(dirwin, "/", app, "_*"))
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

sapply(apps, rem_old)

## why do you need to install all these packages?
# sapply(apps, function(x) devtools::install(pkg = paste0("../", x), upgrade = "never"))
# sapply(apps, function(x) devtools::install(pkg = x, upgrade = "never"))

dir2set <- file.path(rstudioapi::getActiveProject(), "..")
system(paste0(Sys.which("R"), " -e \"setwd('", dir2set, "'); source('radiant/build/build_mac.R')\""))

win <- readline(prompt = "Did you build on Windows? y/n: ")
if (grepl("[yY]", win)) {

  ## move packages to radiant_miniCRAN
  ## must build packages on Windows first
  setwd(file.path(rstudioapi::getActiveProject()))
  sapply(list.files("..", pattern = "*.tar.gz", full.names = TRUE), file.copy, dirsrc)
  unlink("../*.tar.gz")
  sapply(list.files("..", pattern = "*.tgz", full.names = TRUE), file.copy, dirsrc)
  unlink("../*.tgz")
  sapply(list.files("..", pattern = "*.zip", full.names = TRUE), file.copy, dirsrc)
  unlink("../*.zip")

  tools::write_PACKAGES(dirmac, type = "mac.binary")
  tools::write_PACKAGES(dirwin, type = "win.binary")
  tools::write_PACKAGES(dirsrc, type = "source")

  # commit to repo
  setwd(file.path(rstudioapi::getActiveProject(), "../minicran"))
  system("git add --all .")
  mess <- paste0("radiant package updates: ", format(Sys.Date(), format = "%m-%d-%Y"))
  system(paste0("git commit -m '", mess, "'"))
  system("git push")
  setwd(rstudioapi::getActiveProject())
}
