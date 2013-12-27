#' select2 Input
#' 
#' The select2 input. The inputs parameters are the same as selectInput
#' 
#' @param inputId Input variable to assign the control's value to
#' @param label Display label for the control
#' @param choices List of values to select from. If elements of the list are 
#' named then that name rather than the value is displayed to the user.
#' @param selected Name of initially selected item (or multiple names if
#' \code{multiple = TRUE}). If not specified then defaults to the first item
#' for single-select lists and no items for multiple select lists.
#' @param multiple Is selection of multiple items allowed?
#' @return A select list control that can be added to a UI definition.#'   
#' @family ShinySky elements
#' @examples  
#' select2Input("variable", "Variable:",
#'             c("Cylinders" = "cyl",
#'               "Transmission" = "am",
#'               "Gears" = "gear"),multiple=TRUE)   
#' @export
select2Input <- function(inputId, ...) {
  # if(multiple) {
  # 	multiple <- "true"
  # } else multiple <- "false"
  tagList(
    singleton(tags$head(tags$link(href="shinysky/select2/select2.css",rel="stylesheet",type="text/css"))),
    singleton(tags$head(tags$script(src="shinysky/select2/select2.js"))),
    selectInput(inputId,...),
    tags$script(sprintf("$(function() { $('#%s').select2({width:'resolve'}); });",inputId))
  )
}

#' Create a select list input control
#' 
#' Create a select list that can be used to choose a single or
#' multiple items from a list of values.
#' 
#' @param inputId Input variable to assign the control's value to
#' @param label Display label for the control
#' @param choices List of values to select from. If elements of the list are 
#' named then that name rather than the value is displayed to the user.
#' @param selected Name of initially selected item (or multiple names if
#' \code{multiple = TRUE}). If not specified then defaults to the first item
#' for single-select lists and no items for multiple select lists.
#' @param multiple Is selection of multiple items allowed?
#' @return A select list control that can be added to a UI definition.
#' 
#' @family input elements
#' @seealso \code{\link{updateSelectInput}}
#'
#' @examples
#' selectInput("variable", "Variable:",
#'             c("Cylinders" = "cyl",
#'               "Transmission" = "am",
#'               "Gears" = "gear"))
#' @export