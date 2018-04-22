# CHANGES IN radiant 0.9.3

* Various changes to the code to accomodate the use of `shiny::makeReactiveBinding`. The advantage is that the code generated for _Report > Rmd_ and _Report > R_ will no longer have to use `r_data` to store and access data. This means that code generated and used in the Radiant browser interface will be directly usable without the browser interface as well.
* Improved auto completion in _Report > Rmd_ and _Report > R_

# CHANGES IN radiant 0.9.2

* `Esitmate model` buttons update when model input changes so the user know to re-estimate the model
* Addins option to start app in Rstudio window
* Upload and download data using the Rstudio file browser. Allows using relative paths to files (e.g., data or images inside an Rstudio project)
* Moved `update_radiant` function to a separate package. The new function is radiant.update::radiant.update() and can be installed using:

install.packages("radiant.update", repos = "https://radiant-rstats.github.io/minicran/")

# CHANGES IN radiant 0.9.0

* Addins to launch in default browser or Rstudio viewer
* Improved `update_radiant` function for Windows and Mac
* Suppress package start-up messages
* Show Rstudio project information in navbar if available
* Option to start Radiant in Browser or Rstudio Viewer
* Applied `styler` to code

# CHANGES IN radiant 0.8.7.4

* Upgraded tidyr dependency to 0.7

# CHANGES IN radiant 0.8.7.1

* Upgraded dplyr dependency to 0.7.1

# CHANGES IN radiant VERSION 0.8.2

Updated dependency requirements for radiant menus contained in packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate. See the NEWS.md files for those packages for additional information about changes.

# CHANGES IN radiant VERSION 0.8.1

- Added a check to see if radiant::update_radiant() is running in Rstudio

# CHANGES IN radiant VERSION 0.8.0

Updated dependency requirements for radiant menus contained in packages radiant.data, radiant.design, radiant.basics, radiant.model, and radiant.multivariate. See the NEWS.md files for those packages for additional information about changes.
