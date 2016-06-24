# based on https://gist.github.com/mages/1544009
setwd("~/gh/radiant/inst/quant/tools/help")
list.files("figures")
unlink("figures/*.png")
list.files("figures")
cat("--", file="figures/place_holder.txt")

filenames <- list.files(pattern="\\.(md|Rmd)$")
for ( f in filenames ){
  org <- readLines(f)
  changed <- gsub( "figures_quant/",  "http://vnijs.github.io/radiant/quant/figures_quant/", org )
#   changed <- gsub( "http://vnijs.github.io/radiant/marketing/figures_quant/",  "http://vnijs.github.io/radiant/quant/figures_quant/", org )
  cat(changed, file=f, sep="\n")
}

setwd("~/gh/radiant/inst/marketing/tools/help")
list.files("figures")
unlink("figures/*.png")
list.files("figures")
cat("--", file="figures/place_holder.txt")

filenames <- list.files(pattern="\\.(md|Rmd)$")
for ( f in filenames ){
  org <- readLines(f)
  changed <- gsub( "figures_marketing/",  "http://vnijs.github.io/radiant/marketing/figures_marketing/", org )
  cat(changed, file=f, sep="\n")
}
