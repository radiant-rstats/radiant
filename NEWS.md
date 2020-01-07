# radiant 1.3.1.0

* Added launch option that only shows a URL. Convenient for VSCode to lauch Radiant in an external browser
* Using `polycor::hetcor` to calculate measures of correlation between numeric and categorical variables
* Using `patchwork` to combine multiple plots 

# radiant 1.2.0.0

* Documentation updates
* Upgrade dependency to shiny 1.4.0
* Improved handling of fractions in radiant.design, radiant.basics, and radiant.model
* Improved button refresh code when relevant inputs are changed by the user

# radiant 1.1.0.0

* Numerous small code changes to support enhanced auto-completion, tooltips, and annotations in shinyAce 0.4.1

# radiant 0.9.9.0

* Option to pass additional arguments to `shiny::runApp` when starting radiant such as the port to use. For example, radiant::radiant("https://github.com/radiant-rstats/docs/raw/gh-pages/examples/demo-dvd-rnd.state.rda", port = 8080) 
* Load a state file on startup by providing a (relative) file path or a url. For example, radiant::radiant("https://github.com/radiant-rstats/docs/raw/gh-pages/examples/demo-dvd-rnd.state.rda") 
* Update dependencies and convert all package data to tibbles

# radiant 0.9.6.0

* Remove `rstudioapi`, `psych`, and `AlgDesign` as a direct imports

# radiant 0.9.5.0

## Major changes

* When using radiant with Rstudio Viewer or in an Rstudio Window, loading and saving data through _Data > Manage_ generates R-code the user can add to _Report > Rmd_ or _Report > R_. Clicking the `Show R-code` checkbox displays the R-code used to load or save the current dataset
* Added `load_clip` and `save_clip` to load and save data to the clipboard on Windows and macOS
* Various changes to the code to accommodate the use of `shiny::makeReactiveBinding`. The advantage is that the code generated for _Report > Rmd_ and _Report > R_ will no longer have to use `r_data` to store and access data. This means that code generated and used in the Radiant browser interface will be directly usable without the browser interface as well.
* Improved auto completion in _Report > Rmd_ and _Report > R_

# radiant 0.9.2.0

## Major changes

* `Esitmate model` buttons update when model input changes so the user know to re-estimate the model
* Upload and download data using the Rstudio file browser. Allows using relative paths to files (e.g., data or images inside an Rstudio project)
* Moved `update_radiant` function to a separate package. The new function is radiant.update::radiant.update() and can be installed using:

install.packages("radiant.update", repos = "https://radiant-rstats.github.io/minicran/")

## Minor changes

* Addins option to start app in Rstudio window

# radiant 0.9.0.0

## Minor changes

* Addins to launch in default browser or Rstudio viewer
* Improved `update_radiant` function for Windows and Mac
* Suppress package start-up messages
* Show Rstudio project information in navbar if available
* Option to start Radiant in Browser or Rstudio Viewer
* Applied `styler` to code

# radiant 0.8.7.4

## Minor changes

* Upgraded tidyr dependency to 0.7
* Upgraded dplyr dependency to 0.7.1

# radiant VERSION 0.8.2

## Minor changes
Updated dependency requirements for radiant menus contained in packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate. See the NEWS.md files for those packages for additional information about changes.

# radiant VERSION 0.8.1

## Minor changes

* Added a check to see if radiant::update_radiant() is running in Rstudio 
* Updated dependency requirements for radiant menus contained in packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate. See the NEWS.md files for those packages for additional information about changes.
