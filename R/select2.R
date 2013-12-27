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
#'   
#' @return A select list control that can be added to a UI definition.#'
#'   
#' @family ShinySky elements
#'    
#' @export
select2Input <- function(inputId,label, choices = NULL,selected = NULL,...) {
  multiple <- ifelse(multiple,"true","false")
  tags.choices <- paste0('"',paste0(choices,collapse='","'),'"')
  tagList(
    singleton(tags$head(tags$link(href="shinysky/select2/select2.css",rel="stylesheet",type="text/css"))),
    singleton(tags$head(tags$script(src="shinysky/select2/select2.js"))),
    tags$input(id = inputId,value=paste0(selected,collapse=","),...,label),
    tags$script(sprintf("$(function() { $('#%s').select2({width:'resolve',tags:[%s],multiple:'%s'})})",inputId,tags.choices,multiple))
  )
}