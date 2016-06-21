#' Launch Radiant in the default browser
#'
#' @details See \url{http://radiant-rstats.github.io/docs} for documentation and tutorials
#'
#' @export
radiant <- function() {
  if (!"package:radiant" %in% search())
    if (!require(radiant)) stop("Calling radiant start function but radiant is not installed.")
  runApp(system.file("app", package = "radiant"), launch.browser = TRUE)
}
