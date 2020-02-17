## sourcing from radiant.data
options(radiant.path.data = system.file(package = "radiant.data"))
source(file.path(getOption("radiant.path.data"), "app/global.R"), encoding = getOption("radiant.encoding", default = "UTF-8"), local = TRUE)

if (getOption("radiant.development", default = FALSE)) {
  ifelse(grepl("radiant", getwd()) && file.exists("../../inst"), "..", system.file(package = "radiant")) %>%
    options(radiant.path = .)
}

options(radiant.path.design = system.file(package = "radiant.design"))
options(radiant.path.basics = system.file(package = "radiant.basics"))
options(radiant.path.model = system.file(package = "radiant.model"))
options(radiant.path.multivariate = system.file(package = "radiant.multivariate"))

# sourcing from radiant base, note that path is set in base/global.R
# source(file.path(getOption("radiant.path.data"), "app/global.R"), encoding = getOption("radiant.encoding", default = "UTF-8"), local = TRUE)

## setting path for figures in help files
addResourcePath("figures_design", file.path(getOption("radiant.path.design"), "app/tools/help/figures/"))
addResourcePath("figures_basics", file.path(getOption("radiant.path.basics"), "app/tools/help/figures/"))
addResourcePath("figures_model", file.path(getOption("radiant.path.model"), "app/tools/help/figures/"))
addResourcePath("figures_multivariate", file.path(getOption("radiant.path.multivariate"), "app/tools/help/figures/"))

## setting path for www resources
addResourcePath("www_design", file.path(getOption("radiant.path.design"), "app/www/"))
addResourcePath("www_basics", file.path(getOption("radiant.path.basics"), "app/www/"))
addResourcePath("www_model", file.path(getOption("radiant.path.model"), "app/www/"))
addResourcePath("www_multivariate", file.path(getOption("radiant.path.multivariate"), "app/www/"))

## loading url information
source(file.path(getOption("radiant.path.design"), "app/init.R"), encoding = getOption("radiant.encoding"), local = TRUE)
source(file.path(getOption("radiant.path.basics"), "app/init.R"), encoding = getOption("radiant.encoding"), local = TRUE)
source(file.path(getOption("radiant.path.model"), "app/init.R"), encoding = getOption("radiant.encoding"), local = TRUE)
source(file.path(getOption("radiant.path.multivariate"), "app/init.R"), encoding = getOption("radiant.encoding"), local = TRUE)
options(radiant.url.patterns = make_url_patterns())

if (!"package:radiant" %in% search() &&
  isTRUE(getOption("radiant.development")) &&
  getOption("radiant.path") == "..") {
  options(radiant.from.package = FALSE)
} else {
  options(radiant.from.package = TRUE)
}

## to use an alternative set of .rda files with data.frames as the default adapt and
## un-comment the line below
## note that "data/" here points to inst/app/data in the radiant directory but can
## be any (full) path on a server
# options(radiant.init.data = list.files(path = "data/", full.names = TRUE))
