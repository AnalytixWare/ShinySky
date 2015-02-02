#' @import shiny
.onLoad <- function(libname, pkgname) {
    addResourcePath("shinysky", system.file("www", package = "shinysky"))
}