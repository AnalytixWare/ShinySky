#' @import shiny
.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath("shinysky", system.file("www", package = "shinysky"))
}