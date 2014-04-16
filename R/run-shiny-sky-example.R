#' run.shinysky.example 
#'
#' @export
run.shinysky.example <- function(example = c("0_all","1_buttons&alerts","2_select2","3_typeahead","4_busyIndicator","5_hotable","6_jstree")) {
	tryCatch({
		example <- match.arg(example)
		shiny::runApp(file.path(system.file("examples", package = "shinysky"),example), display.mode = "showcase")
	}, error = function(e) {
		print(paste("Valid Examples are", paste(dir(system.file("examples", package = "shinysky")),collapse=", ")))
	})
} 