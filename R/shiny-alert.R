#' shinyalert
#' 
#' Creates an shinyalert. The show and hide functions are used in server.R. Show
#' an alert placed in ui.R with shinyalert
#' 
#' @param id Specifies the alert id that will be used to access the
#' @param click.hide If TRUE then clicking on the alert will hide it. Defaults to TRUE
#' @param auto.close.after After this many seconds auto close the alert
#'   
#' @family ShinySky elements
#' 
#' @seealso shinyalert
#' 
#' @importFrom shiny tagList singleton tags HTML
#' @examples 
#' 
#' # ui.R
#' 
#' shinyalert("id", click.hide = TRUE, auto.close.after = NULL)
#' 
#' # close after one second
#' # and clicking doesn't hide it
#' shinyalert("id", click.hide = FALSE, auto.close.after = 1)
#' 
#' @export
shinyalert <- function(id, click.hide = TRUE, auto.close.after = NULL) {
    shiny::tagList(shiny::singleton(shiny::tags$head(shiny::tags$script(src = "shinysky/shinyalert.js"))), 
        shiny::HTML(paste0("<div id=\"", id, "\" class=\"shinyalert alert fade\" data-alert=\"alert\" click-hide=\"",as.character(click.hide),"\" data-auto-close-after ='",auto.close.after,"'></div>")))
}

#' showshinyalert
#' 
#' Used in server.R. Show an alert placed in ui.R with shinyalert
#' @param session The Shiny session specified in shinyServer(function(input, output, session) {...}). 
#' @param HTMLtext The HTML you want displayed in the text
#' @param styleclass The styling class of the alert--options are primary, info, 
#'   success ,warning, ,danger ,inverse ,link
#'   
#' @family ShinySky elements
#' @rdname shinyalert
#' @seealso shinyalert
#'   
#' @export
showshinyalert <- function(session, id, HTMLtext, styleclass = "success") {
    alert.css.style = paste("alert", styleclass, sep = "-")
    session$sendCustomMessage("shinyalerthandler", list(id = id, HTMLtext = HTMLtext, alert.css.style = alert.css.style, show=TRUE))
}


#' hideshinyalert
#' 
#' 
#' @family ShinySky elements
#'
#' @rdname shinyalert
#' @seealso shinyalert
#'   
#' @export
hideshinyalert <- function(session, id) {
  session$sendCustomMessage("shinyalerthandler", list(id = id, show=FALSE))
}