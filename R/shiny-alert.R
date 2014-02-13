#' shinyalert
#' 
#' Creates an shinyalert 
#' 
#' @param id Specifies the alert id that will be used to access the
#' @param click.hide If TRUE then clicking on the alert will hide it. Defaults to TRUE
#'   
#' @family ShinySky elements
#' 
#' @seealso shinyalert
#'   
#' @export
shinyalert <- function(id, click.hide = TRUE) {
    tagList(singleton(tags$head(tags$script(src = "shinysky/shinyalert.js"))), 
        HTML(paste0("<div id=\"", id, "\" class=\"shinyalert alert hide fade\"  data-alert=\"alert\" click-hide=\"",as.character(click.hide),"\"></div>")))
}

#' showshinyalert
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
#'   
#' @export
showshinyalert <- function(id, HTMLtext, session, styleclass = "success") {
    alert.css.style = paste("alert", styleclass, sep = "-")
    session$sendCustomMessage("shinyalerthandler", list(id = id, 
        HTMLtext = HTMLtext, alert.css.style = alert.css.style))
} 
