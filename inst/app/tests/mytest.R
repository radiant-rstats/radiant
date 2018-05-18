app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$uploadFile(uploadfile = "bbb.rds") # <-- This should be the path to the file, relative to the app's tests/ directory
app$setInputs(tabs_data = "Pivot")
app$setInputs(pvt_cvars = "gender")
app$setInputs(pvt_normalize = "total")
app$setInputs(pvt_perc = TRUE)
app$setInputs(pvt_run = "click")
# Input 'pivotr_rows_current' was set, but doesn't have an input binding.
# Input 'pivotr_rows_all' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(pvt_cvars = character(0))
app$setInputs(pvt_cvars = "state")
app$setInputs(pvt_perc = FALSE)
# Input 'pivotr_rows_current' was set, but doesn't have an input binding.
# Input 'pivotr_rows_all' was set, but doesn't have an input binding.
# Input 'pivotr_rows_current' was set, but doesn't have an input binding.
# Input 'pivotr_rows_all' was set, but doesn't have an input binding.
# Input 'pivotr_rows_current' was set, but doesn't have an input binding.
# Input 'pivotr_rows_all' was set, but doesn't have an input binding.
app$setInputs(pvt_normalize = "None")
# Input 'pivotr_rows_current' was set, but doesn't have an input binding.
# Input 'pivotr_rows_all' was set, but doesn't have an input binding.
# Input 'pivotr_rows_current' was set, but doesn't have an input binding.
# Input 'pivotr_rows_all' was set, but doesn't have an input binding.
# Input 'pivotr_rows_current' was set, but doesn't have an input binding.
# Input 'pivotr_rows_all' was set, but doesn't have an input binding.
# Input 'pivotr_search_columns' was set, but doesn't have an input binding.
app$snapshot()
