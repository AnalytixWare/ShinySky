#' run.shinysky.example 
#'
#' @export
run.shinysky.example <- function(example.id = c("0_all","1_buttons&alerts","2_select2","3_typeahead","4_busyIndicator","5_hotable","6_jstree")) {
	example.id <- match.arg(example.id)
	shiny::runApp(file.path(system.file("examples", package = "shinysky"),example.id), display.mode = "showcase")
} 