#' showShinyAlert
#' 
#' Creates an action button whose value is initially zero, and increments by one
#' each time it is pressed.
#' 
#' @param id Specifies the alert id that will be used to access the
#' @param HTMLtext The HTML you want displayed in the text
#' @param styleclass The styling class of the alert--options are primary, info, 
#'   success ,warning, ,danger ,inverse ,link
#'   
#' @family shinysky elements
#'   
#' @export
showShinyAlert <- function(id,HTMLtext,session,styleclass="success") {
  alert.css.style = paste("alert",styleclass,sep="-")
  session$sendCustomMessage("shinyalerthandler",list(id=id,HTMLtext = HTMLtext,alert.css.style = alert.css.style))
}
