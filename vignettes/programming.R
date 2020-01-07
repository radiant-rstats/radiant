## ----r_setup, include = FALSE-----------------------------------------------------------------------------------------------------------------------
library(radiant)
knitr::opts_chunk$set(
  comment = NA, 
  cache = FALSE, 
  message = FALSE, 
  warning = FALSE,
  dpi = 144
)
options(width = 150)

## ----single_mean_price, fig.height = 3, fig.width = 5-----------------------------------------------------------------------------------------------
library(radiant)
data(diamonds, envir = environment())
result <- single_mean(diamonds, "price")
summary(result)
plot(result)

## ----scatter, fig.height = 4, fig.width = 5---------------------------------------------------------------------------------------------------------
visualize(
  diamonds, 
  xvar = "carat", 
  yvar = "price", 
  type = "scatter",
  facet_row = "clarity", 
  color = "clarity", 
  labs = labs(title = "Diamond Prices ($)"),
  custom = FALSE
) 

## ----single_mean_mpg, fig.height = 3, fig.width = 5-------------------------------------------------------------------------------------------------
result <- single_mean(
  mtcars, 
  var = "mpg", 
  comp_value = 20, 
  alternative = "greater"
)
summary(result)
plot(result, plots = "hist")

## ----compare_means_diamonds, fig.height = 5, fig.width = 4------------------------------------------------------------------------------------------
result <- compare_means(
  diamonds, 
  var1 = "clarity", 
  var2 = "price", 
  adjust = "bonf"
)
summary(result)
plot(result, plots = c("bar", "density"))

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------
#  ## start radiant in Rstudio, load the example data, then click the power
#  ## icon in the navigation bar and click on Stop
#  radiant::radiant()

## ----compare_means_salary, fig.height = 3, fig.width = 4--------------------------------------------------------------------------------------------
result <- compare_means(salary, var1 = "rank", var2 = "salary")
summary(result)
plot(result)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
result <- regress(diamonds, rvar = "price", evar = c("carat","clarity"))
summary(result, sum_check = "confint")
pred <- predict(result, pred_cmd = "carat = 1:10")
print(pred, n = 10)

## ----regress_coeff, fig.width = 6, fig.height = 4---------------------------------------------------------------------------------------------------
plot(result, plots = "coef")

## ----regress_dashboard, fig.width = 5, fig.height = 7-----------------------------------------------------------------------------------------------
plot(result, plots = "dashboard", lines = "line", nrobs = 100)

## ----hclus, fig.width = 4, fig.height = 5-----------------------------------------------------------------------------------------------------------
## run hierarchical cluster analysis on the shopping data, variables v1 through v6
result <- hclus(shopping, "v1:v6")

## summary - not much here - plots are more important
summary(result)

## check the help file on how to plot results from hierarchical cluster
## analysis default plots
## it looks like there is a big jump in overall within-cluster
## heterogeneity in the step from 3 to 2 segments
plot(result)

## ----dendro, fig.width = 4, fig.height = 5----------------------------------------------------------------------------------------------------------
## show the dendrogram with cutoff at 0.05
plot(result, plots = "dendro", cutoff = 0.05)

## ----kclus, fig.width = 5, fig.height = 6-----------------------------------------------------------------------------------------------------------
## plots created above suggest 3 clusters may be  most appropriate
## use kclus to create the clusters
## generate output and store cluster membership
result <- kclus(shopping, vars = "v1:v6", nr_clus = 3)
summary(result)
plot(result, plots = c("density", "bar"))
shopping <- store(shopping, result, name = "clus")

## was the data really changed?
head(shopping)

