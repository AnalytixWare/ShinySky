#' run.shinysky.example 
#'
#' @export
run.shinysky.example <- function() {
    shiny::runApp(system.file("examples", package = "shinysky"))
} 
