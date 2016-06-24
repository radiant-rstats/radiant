library(devtools)
library(magrittr)
setwd("~/gh/radiant.data")
document(roclets = c('rd', 'collate', 'namespace'))

system("git add --all .")
system("git commit -m 'Update [ci skip]'")
system("git push")

devtools::install_github("radiant-rstats/radiant")
devtools::install_github("radiant-rstats/radiant.data")
devtools::install_github("radiant-rstats/radiant.design")
devtools::install_github("radiant-rstats/radiant.basics")
devtools::install_github("radiant-rstats/radiant.model")
devtools::install_github("radiant-rstats/radiant.multivariate")

devtools::install_github("rstudio/shinyapps")
library(shinyapps)
fpath <- "~/gh/radiant/inst/app"
setwd(fpath)

# for (file in list.files("../../../shinyapps/R", pattern = "\\.(r|R)$", full.names = TRUE))
  # source(file, local = TRUE)

# source("../../build/deployapp.R", local = TRUE)

shinyapps::deployApp(account = "vnijs", launch.browser = FALSE, lint = FALSE)
shinyapps::deployApp(account = "vnijs")

## in case of problems
shinyapps::showLogs(entries=1000)
