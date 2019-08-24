wrap <- function(str,with = '"') {
  paste0(with,str,with)
}

#' select2 Input
#' 
#' The select2 input
#' 
#' @param inputId Input variable to assign the control's value to
#' @param label Display label for the control
#' @param choices List of values to select from. If elements of the list are 
#'   named then that name rather than the value is displayed to the user.
#' @param selected Name of initially selected item (or multiple names if 
#'   \code{multiple = TRUE}). If not specified then defaults to the first item 
#'   for single-select lists and no items for multiple select lists.
#' @param type The two valid options are input and select. The input type is 
#'   similar to a text input and it can remember the order of selection. The
#'   select is based on the <select> tags in HTML and is not ordinal hence the
#'   order in which you specify the selection is not being taken into account,
#'   however it's input parameters are compatible with selectInput and you can
#'   use updateSelectInput to update its contents.
#' @param drag.and.drop Allow drag and drop or not
#' @param ... Other arguments to pass into shiny::selectInput
#'   
#' @return A select list control that can be added to a UI definition.#'
#'   
#' @family ShinySky elements
#' 
#' @examples 
#' 
#' ## ui.r
#' select2Input("select2Input1",
#'   "This is a multiple select2Input",
#'    choices=c("a","b","c"),
#'    selected=c("b","a"))
#' 
#' @export
select2Input <- function(inputId,label, choices = NULL,selected = NULL, type=c("input","select"),drag.and.drop = FALSE,...) {
 	type <- match.arg(type)
  	tags.choices <- wrap(paste0(choices,collapse='","'))
  	if (type == "input") {
	    shiny::tagList(
	    	includeSelect2(),
	    	shiny::tags$p(label),
	      	shiny::tags$input(id = inputId,value=paste0(selected,collapse=","),class="shinysky-select2Input",...),
	      	shiny::tags$script(sprintf("$(function() { $('#%s').select2({width:'resolve',tags:[%s]})})",inputId,tags.choices)),
	      	shiny::tags$script(sprintf('$(function() {
				$("#%s").select2("container").find("ul.select2-choices").sortable({
    				containment: "parent",
    				start: function() { $("#%s").select2("onSortStart"); },
    				update: function() { $("#%s").select2("onSortEnd"); }
					});})',inputId,inputId,inputId))
	    	)
	} else if (type == "select") {
		shiny::tagList(
			includeSelect2(),
			selectInput(inputId,label,choices,selected,...),
	      	shiny::tags$script(sprintf("$(function() { $('#%s').select2({width:'resolve'})})",inputId))
	      	)
	}
}

#' includeSelect2
#' 
#' Some code to include css and js for includeSelect2. This is provide so that 
#' the user can have access to select2 even if they only use it in the dynamic 
#' UI
#' 
#' @return `includeSelect2` returns the HTML to include the Javascripot and CSS of select2.js
#' @rdname select2Input
#' @export
includeSelect2 <- function(drag.and.drop = FALSE) {
  shiny::tagList(
  	shiny::singleton(shiny::tags$head(shiny::tags$link(href="shinysky/select2/select2.css",rel="stylesheet",type="text/css")))
    ,shiny::singleton(shiny::tags$head(shiny::tags$script(src="shinysky/select2/select2.js")))
    ,shiny::singleton(shiny::tags$head(shiny::tags$script(src="shinysky/jquery-sortable/js/jquery-ui-1.10.3.custom.min.js")))
    ,shiny::singleton(shiny::tags$head(shiny::tags$script(src="shinysky/select2Input.js")))
    )
}

#' updateSelect2Input
#' 
#' Update select2Input
#' 
#' @param session The Shiny session
#' @rdname select2Input
#' @export
updateSelect2Input <- function(session ,inputId,label,choices = NULL,selected = NULL) {
	session$sendCustomMessage(type = "updateShinySkySelect2", list(id=inputId,choices =choices,selected =selected,label=label))
}
