.onLoad <- function(libname, pkgname) {
    #require(shiny)
    #require(RJSONIO)
    addResourcePath("shinysky", system.file("www", package = "shinysky"))
}

.onAttach <- function(libname, pkgname) {
    #require(shiny)    
} 
