#' @import shiny
#' @importFrom shiny addResourcePath
.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath("shinysky", system.file("www", package = "shinysky"))
}