#' eventsButton
#' 
#' A button that responds to events click, doubleclick, hover etc. It's built on
#' top of actionButton and eventInput
#' 
#' @param events A sequence of events that will invalidate the button
#'   \url{http://getbootstrap.com/2.3.2/base-css.html#icons}
#' @rdname actionButton
#' @export
eventsButton <- function(..., events = c("dblclick")) {
    
    b <- actionButton(..., css.class = "shinysky-eventinput", 
        `data-shinysky-event-count` = 0, `data-shinysky-last-event` = "", 
        `data-shinysky-monitored-events` = paste(events, collapse = " "))
    return(tagList(singleton(tags$script(src = "shinysky/event-input.js")), 
        b))
} 
