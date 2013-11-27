#' shinyalert
#' 
#' Creates an shinyalert 
#' 
#' @param id Specifies the alert id that will be used to access the
#'   
#' @family ShinySky elements
#' 
#' @seealso shinyalert
#'   
#' @export
shinyalert <- function(id) {
	tagList(
		singleton(tags$head(tags$script()))
		,HTML('<div id="importDataAlert" class="shinyalert alert alert-success hide fade"  data-alert="alert"></div>'))
}

#' showShinyAlert
#' 
#' Used in server.R. Show an alert placed in ui.R with shinyalert
#' 
#' @param id Specifies the alert id that will be used to access the
#' @param HTMLtext The HTML you want displayed in the text
#' @param styleclass The styling class of the alert--options are primary, info, 
#'   success ,warning, ,danger ,inverse ,link
#'   
#' @family ShinySky elements
#'   
#' @seealso shinyalert
#'   
#' @export
showShinyAlert <- function(id,HTMLtext,session,styleclass="success") {
  alert.css.style = paste("alert",styleclass,sep="-")
  session$sendCustomMessage("shinyalerthandler",list(id=id,HTMLtext = HTMLtext,alert.css.style = alert.css.style))
}