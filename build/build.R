setwd(rstudioapi::getActiveProject())
curr <- getwd()
pkg <- basename(curr)

## building radiant packages for mac and windows
# dev <- FALSE
# if (isTRUE(dev)) {
#   devprompt <- readline(prompt = paste0("Are you sure you want to build a development version y/n: "))
#   if (grepl("[nN]", devprompt)) {
#     stop("Set 'dev' to FALSE")
#   }
# }

## building package for mac and windows
rv <- R.Version()
rv <- paste(rv$major, substr(rv$minor, 1, 1), sep = ".")

rvprompt <- readline(prompt = paste0("Running for R version: ", rv, ". Is that what you wanted y/n: "))
if (grepl("[nN]", rvprompt)) stop("Change R-version")

dirsrc <- "../minicran/src/contrib"

if (rv < "3.4") {
  dirmac <- fs::path("../minicran/bin/macosx/mavericks/contrib", rv)
} else if (rv > "3.6") {
  dirmac <- c(
    fs::path("../minicran/bin/macosx/big-sur-x86_64/contrib", rv),
    fs::path("../minicran/bin/macosx/big-sur-arm64/contrib", rv),
    fs::path("../minicran/bin/macosx/contrib", rv)
  )
} else {
  dirmac <- fs::path("../minicran/bin/macosx/el-capitan/contrib", rv)
}

dirwin <- fs::path("../minicran/bin/windows/contrib", rv)

if (!file.exists(dirsrc)) dir.create(dirsrc, recursive = TRUE)
sapply(dirmac, function(x) if (!file.exists(x)) dir.create(x, recursive = TRUE))
if (!file.exists(dirwin)) dir.create(dirwin, recursive = TRUE)

## delete older version of radiant
rem_old <- function(app) {
  unlink(paste0(dirsrc, "/", app, "_*"))
  sapply(dirmac, function(x) unlink(paste0(x, "/", app, "_*")))
  unlink(paste0(dirwin, "/", app, "_*"))
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

sapply(apps, rem_old)

dir2set <- file.path(rstudioapi::getActiveProject(), "..")
system(paste0(Sys.which("R"), " -e \"setwd('", dir2set, "'); source('radiant/build/build_mac.R')\""))

win <- readline(prompt = "Did you build on Windows? y/n: ")
if (grepl("[yY]", win)) {
  fl <- list.files(pattern = "*.zip", path = "~/Dropbox/r-packages", full.names = TRUE)
  for (f in fl) {
    file.copy(f, "~/gh/")
  }

  ## move packages to radiant_miniCRAN
  ## must build packages on Windows first
  setwd(file.path(rstudioapi::getActiveProject()))
  sapply(list.files("..", pattern = "*.tar.gz", full.names = TRUE), file.copy, dirsrc)
  unlink("../*.tar.gz")
  unlink("~/Dropbox/r-packages/*.tar.gz")
  sapply(list.files("..", pattern = "*.tgz", full.names = TRUE), file.copy, dirmac[1])
  sapply(list.files("..", pattern = "*.tgz", full.names = TRUE), file.copy, dirmac[2])
  unlink("../*.tgz")
  sapply(list.files("..", pattern = "*.zip", full.names = TRUE), file.copy, dirwin)
  unlink("../*.zip")
  unlink("~/Dropbox/r-packages/*.zip") # cleanup

  for (d in dirmac) {
    tools::write_PACKAGES(d, type = "mac.binary")
  }
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

# testing
# remove.packages(c("radiant.data", "radiant.model", "radiant", "radiant.multivariate", "radiant.basics", "radiant.design", "dplyr"))
# options(repos=c(RSM = "https://radiant-rstats.github.io/minicran"))
# install.packages("radiant.update")
# install.packages("radiant.update", type = "binary")
# radiant.update::radiant.update()
