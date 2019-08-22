#' Run shinysky example shinyapp
#'
#' @importFrom shiny runApp
#' 
#' @examples 
#' 
#' # simply run it to show a Shiny app
#' 
#' if(interactive()) {
#'   shiny::run.shinysky.example()
#' }
#' 
#' 
#' @export
run.shinysky.example <- function() {
		shiny::runApp(file.path(system.file("examples", package = "shinysky")), display.mode = "showcase")
} 