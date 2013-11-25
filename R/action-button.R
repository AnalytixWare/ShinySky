#' Action button
#' 
#' Creates an action button whose value is initially zero, and increments by one
#' each time it is pressed.
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'   value.
#' @param label The contents of the button--usually a text label, but you could 
#'   also use any other HTML, like an image.
#' @param btn.style The styling class of the button--options are primary, info, 
#'   success ,warning, ,danger ,inverse ,link
#' @param css.class Any additional CSS class one wishes to add to the action 
#'   button e.g btn-large
#'   
#' @family input elements
#'   
#' @export
actionButton <- function(inputId, label, btn.style = "" , css.class = "") {
  if ( btn.style %in% c("primary","info","success","warning","danger","inverse","link")) {
    btn.css.class <- paste("btn",btn.style,sep="-")
  } else btn.css.class = ""
  
  tags$button(id=inputId, type="button", class=paste("btn action-button",btn.css.class,css.class,collapse=" "), label)
}