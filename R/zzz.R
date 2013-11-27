.onLoad <- function(libname, pkgname) {
  require(shiny)
  addResourcePath("shinysky",system.file("www",package="shinysky"))
}

.onAttach <- function(libname, pkgname) {
  require(shiny)
  #addResourcePath("shinysky",system.file("www",package="shinysky"))
}