#' Launch radiant in the default browser
#'
#' @description Launch radiant in the default web browser
#' @details See \url{https://radiant-rstats.github.io/docs} for documentation and tutorials
#'
#' @param state Path to state file to load
#' @param ... additional arguments to pass to shiny::runApp (e.g, port = 8080)
#'
#' @importFrom radiant.data launch
#'
#' @examples
#' \dontrun{
#' radiant()
#' radiant("https://github.com/radiant-rstats/docs/raw/gh-pages/examples/demo-dvd-rnd.state.rda")
#' }
#' @export
radiant <- function(state, ...) radiant.data::launch(package = "radiant", run = "browser", state, ...)

#' Launch radiant in an Rstudio window
#'
#' @param state Path to state file to load
#' @param ... additional arguments to pass to shiny::runApp (e.g, port = 8080)
#'
#' @details See \url{https://radiant-rstats.github.io/docs} for documentation and tutorials
#'
#' @importFrom radiant.data launch
#'
#' @examples
#' \dontrun{
#' radiant_window()
#' }
#' @export
radiant_window <- function(state, ...) radiant.data::launch(package = "radiant", run = "window", state, ...)

#' Launch radiant in the Rstudio viewer
#'
#' @details See \url{https://radiant-rstats.github.io/docs} for documentation and tutorials
#'
#' @param state Path to state file to load
#' @param ... additional arguments to pass to shiny::runApp (e.g, port = 8080)
#'
#' @importFrom radiant.data launch
#'
#' @examples
#' \dontrun{
#' radiant_viewer()
#' }
#' @export
radiant_viewer <- function(state, ...) radiant.data::launch(package = "radiant", run = "viewer", state, ...)

#' Start radiant but do not open a browser
#'
#' @param state Path to statefile to load
#' @param ... additional arguments to pass to shiny::runApp (e.g, port = 8080)
#'
#' @examples
#' \dontrun{
#' radiant_url()
#' }
#' @export
radiant_url <- function(state, ...) radiant.data::launch(package = "radiant", run = FALSE, state, ...)

#' Create a launcher and updater for Windows (.bat)
#'
#' @details On Windows a file named 'radiant.bat' and one named 'update_radiant.bat' will be put on the desktop. Double-click the file to launch the specified Radiant app or update Radiant to the latest version
#'
#' @param app App to run when the desktop icon is double-clicked ("analytics", "marketing", "quant", or "base"). Default is "analytics"
#'
#' @examples
#' \dontrun{
#' radiant::win_launcher()
#' }
#'
#' @export
win_launcher <- function(app = c("radiant", "radiant.data", "radiant.design", "radiant.basics", "radiant.model", "radiant.multivariate")) {
  if (!interactive()) stop("This function can only be used in an interactive R session")

  if (Sys.info()["sysname"] != "Windows") {
    return(message("This function is for Windows only. For Mac use the mac_launcher() function"))
  }

  answ <- readline("Do you want to create shortcuts for Radiant on your Desktop? (y/n) ")
  if (substr(answ, 1, 1) %in% c("y", "Y")) {
    local_dir <- Sys.getenv("R_LIBS_USER")
    if (!file.exists(local_dir)) dir.create(local_dir, recursive = TRUE)

    pt <- file.path(Sys.getenv("HOME"), "Desktop")
    if (!file.exists(pt)) {
      pt <- file.path(Sys.getenv("USERPROFILE"), "Desktop", fsep = "\\")
    }

    if (!file.exists(pt)) {
      pt <- Sys.getenv("HOME")
      message(paste0("The launcher function was unable to find your Desktop. The launcher and update files/icons will be put in the directory: ", pt))
    }

    pt <- normalizePath(pt, winslash = "/")

    fn1 <- file.path(pt, "radiant.bat")
    launch_string <- paste0("\"", Sys.which("R"), "\" -e \"if (!require(radiant)) { install.packages('radiant', repos = 'https://radiant-rstats.github.io/minicran/', type = 'binary') }; library(radiant); shiny::runApp(system.file('app', package='", app[1], "'), port = 4444, launch.browser = TRUE)\"")
    cat(launch_string, file = fn1, sep = "\n")
    Sys.chmod(fn1, mode = "0755")

    fn2 <- file.path(pt, "update_radiant.bat")
    launch_string <- paste0("\"", Sys.which("R"), "\" -e \"unlink('~/.radiant.sessions/*.rds', force = TRUE); install.packages('radiant', repos = 'https://radiant-rstats.github.io/minicran/', type = 'binary'); suppressWarnings(update.packages(lib.loc = .libPaths()[1], repos = 'https://radiant-rstats.github.io/minicran', ask = FALSE, type = 'binary'))\"\npause(1000)")
    cat(launch_string, file = fn2, sep = "\n")
    Sys.chmod(fn2, mode = "0755")

    if (file.exists(fn1) && file.exists(fn2)) {
      message("Done! Look for a file named radiant.bat on your desktop. Double-click it to start Radiant in your default browser. There is also a file called update_radiant.bat you can double click to update the version of Radiant on your computer.\n")
    } else {
      message("Something went wrong. No shortcuts were created.")
    }
  } else {
    message("No shortcuts were created.\n")
  }
}

#' Create a launcher and updater for Mac (.command)
#'
#' @details On Mac a file named 'radiant.command' and one named 'update_radiant.command' will be put on the desktop. Double-click the file to launch the specified Radiant app or update Radiant to the latest version
#'
#' @param app App to run when the desktop icon is double-clicked ("analytics", "marketing", "quant", or "base"). Default is "analytics"
#'
#' @examples
#' \dontrun{
#' radiant::mac_launcher()
#' }
#'
#' @export
mac_launcher <- function(app = c("radiant", "radiant.data", "radiant.design", "radiant.basics", "radiant.model", "radiant.multivariate")) {
  if (!interactive()) stop("This function can only be used in an interactive R session")

  if (Sys.info()["sysname"] != "Darwin") {
    return(message("This function is for Mac only. For windows use the win_launcher() function"))
  }

  answ <- readline("Do you want to create shortcuts for Radiant on your Desktop? (y/n) ")
  if (substr(answ, 1, 1) %in% c("y", "Y")) {
    local_dir <- Sys.getenv("R_LIBS_USER")
    if (!file.exists(local_dir)) dir.create(local_dir, recursive = TRUE)

    fn1 <- paste0("/Users/", Sys.getenv("USER"), "/Desktop/radiant.command")
    launch_string <- paste0("#!/usr/bin/env Rscript\nif (!require(radiant)) {\n  install.packages('radiant', repos = 'https://radiant-rstats.github.io/minicran/', type = 'binary')\n}\n\nlibrary(radiant)\nshiny::runApp(system.file('app', package='", app[1], "'), port = 4444, launch.browser = TRUE)\n")
    cat(launch_string, file = fn1, sep = "\n")
    Sys.chmod(fn1, mode = "0755")

    fn2 <- paste0("/Users/", Sys.getenv("USER"), "/Desktop/update_radiant.command")
    launch_string <- paste0("#!/usr/bin/env Rscript\nunlink('~/.radiant.sessions/*.rds', force = TRUE)\ninstall.packages('radiant', repos = 'https://radiant-rstats.github.io/minicran/', type = 'binary')\nsuppressWarnings(update.packages(lib.loc = .libPaths()[1], repos = 'https://radiant-rstats.github.io/minicran', ask = FALSE, type = 'binary'))\nSys.sleep(1000)")
    cat(launch_string, file = fn2, sep = "\n")
    Sys.chmod(fn2, mode = "0755")

    if (file.exists(fn1) && file.exists(fn2)) {
      message("Done! Look for a file named radiant.command  on your desktop. Double-click it to start Radiant in your default browser. There is also a file called update_radiant.command you can double click to update the version of Radiant on your computer.\n")
    } else {
      message("Something went wrong. No shortcuts were created.")
    }
  } else {
    message("No shortcuts were created.\n")
  }
}

#' Create a launcher and updater for Linux (.sh)
#'
#' @details On Linux a file named 'radiant.sh' and one named 'update_radiant.sh' will be put on the desktop. Double-click the file to launch the specified Radiant app or update Radiant to the latest version
#'
#' @param app App to run when the desktop icon is double-clicked ("analytics", "marketing", "quant", or "base"). Default is "analytics"
#'
#' @examples
#' \dontrun{
#' radiant::lin_launcher("radiant")
#' }
#'
#' @export
lin_launcher <- function(app = c("radiant", "radiant.data", "radiant.design", "radiant.basics", "radiant.model", "radiant.multivariate")) {
  if (!interactive()) stop("This function can only be used in an interactive R session")

  if (Sys.info()["sysname"] != "Linux") {
    return(message("This function is for Linux only. For windows use the win_launcher() function and for mac use the mac_launcher() function"))
  }

  answ <- readline("Do you want to create shortcuts for Radiant on your Desktop? (y/n) ")
  if (substr(answ, 1, 1) %in% c("y", "Y")) {
    local_dir <- Sys.getenv("R_LIBS_USER")
    if (!file.exists(local_dir)) dir.create(local_dir, recursive = TRUE)

    fn1 <- paste0(Sys.getenv("HOME"), "/Desktop/radiant.sh")
    launch_string <- paste0("#!/usr/bin/env Rscript\nif (!require(radiant)) {\n  install.packages('radiant', repos = 'https://radiant-rstats.github.io/minicran/')\n}\n\nlibrary(radiant)\nshiny::runApp(system.file('app', package='", app[1], "'), port = 4444, launch.browser = TRUE)\n")
    cat(launch_string, file = fn1, sep = "\n")
    Sys.chmod(fn1, mode = "0755")

    fn2 <- paste0(Sys.getenv("HOME"), "/Desktop/update_radiant.sh")
    launch_string <- paste0("#!/usr/bin/env Rscript\nunlink('~/.radiant.sessions/*.rds', force = TRUE)\ninstall.packages('radiant', repos = 'https://radiant-rstats.github.io/minicran/')\nsuppressWarnings(update.packages(lib.loc = .libPaths()[1], repos = 'https://radiant-rstats.github.io/minicran', ask = FALSE))\nSys.sleep(1000)")
    cat(launch_string, file = fn2, sep = "\n")
    Sys.chmod(fn2, mode = "0755")

    if (file.exists(fn1) && file.exists(fn2)) {
      message("Done! Look for a file named radiant.sh on your desktop. Double-click it to start Radiant in your default browser. There is also a file called update_radiant.sh you can double click to update the version of Radiant on your computer.\n\nIf the .sh files are opened in a text editor when you double-click them go to File Manager > Edit > Preferences > Behavior and click 'Run executable text files when they are opened'.")
    } else {
      message("Something went wrong. No shortcuts were created.")
    }
  } else {
    message("No shortcuts were created.\n")
  }
}

#' Create a launcher on the desktop for Windows (.bat), Mac (.command), or Linux (.sh)
#'
#' @details On Windows/Mac/Linux a file named radiant.bat/radiant.command/radiant.sh will be put on the desktop. Double-click the file to launch the specified Radiant app
#'
#' @seealso \code{\link{win_launcher}} to create a shortcut on Windows
#' @seealso \code{\link{mac_launcher}} to create a shortcut on Mac
#' @seealso \code{\link{lin_launcher}} to create a shortcut on Linux
#'
#' @param app App to run when the desktop icon is double-clicked ("analytics", "marketing", "quant", or "base"). Default is "analytics"
#'
#' @examples
#' \dontrun{
#' radiant::launcher("radiant.model")
#' }
#'
#' @export
launcher <- function(app = c("radiant", "radiant.data", "radiant.design", "radiant.basics", "radiant.model", "radiant.multivariate")) {
  os <- Sys.info()["sysname"]
  if (os == "Darwin") {
    mac_launcher(app[1])
  } else if (os == "Windows") {
    win_launcher(app[1])
  } else if (os == "Linux") {
    lin_launcher(app[1])
  } else {
    return(message("This function is not available for your platform."))
  }
}
