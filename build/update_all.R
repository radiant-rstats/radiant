library(devtools)
library(magrittr)
setwd("~/gh/radiant.data")
document(roclets = c('rd', 'collate', 'namespace'))

system("git add --all .")
system("git commit -m 'Update [ci skip]'")
system("git push")

# devtools::install_github("radiant-rstats/radiant.data")
# devtools::install_github("rstudio/shiny")
# devtools::install_github("rstudio/DT")

# devtools::install_github("rstudio/shinyapps")
# library(shinyapps)
# fpath <- "~/gh/radiant.data/inst/app"
# setwd(fpath)
#
# for (file in list.files("../../../shinyapps/R", pattern = "\\.(r|R)$", full.names = TRUE))
#   source(file, local = TRUE)
#
# source("../../build/deployapp.R", local = TRUE)
#
# deployApp(account = "vnijs", launch.browser = FALSE, lint = FALSE)

setwd("~/gh/radiant.data/")
system("sh build/build_mac_win.sh")

## in case of problems
# shinyapps::showLogs(entries=1000)

## for major pull problems
# git fetch --all
# git reset --hard origin/master
# rm(list = ls())
