# devtools::install_github('hadley/devtools')
library(devtools)
document(roclets = c('rd', 'collate', 'namespace'))

build('../radiant.data')
build('../radiant.data', binary = TRUE)

# devtools::install('~/gh/DT')
# packageVersion("DT")
# build('../DT')
# build('../DT', binary = TRUE)

# install('../shiny')
# build('../shiny')
# build('../shiny', binary = TRUE)
