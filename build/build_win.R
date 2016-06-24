# run this separately on mac and windows
# install.packages("devtools")
library(devtools)
document(roclets = c('rd', 'collate', 'namespace'))

# install('../shiny')
# build('../shiny', binary = TRUE)

# install('../DT')
# build('../DT', binary = TRUE)

build('../radiant.data', binary = TRUE)

setwd('../')
rfile <- Sys.glob("*zip")
setwd('radiant.data')
