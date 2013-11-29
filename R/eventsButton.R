#' eventsButton
#' 
#' A button that responds to events click, doubleclick, hover etc. It's built on
#' top of actionButton and eventInput
#' 
#' @param inputId the id of the function.
#' @param label The displayed text
#' @param events A sequence of events that will invalidate the button
#'   
#' @export
eventsButton <- function(inputId, label , events=c("dblclick"),...) {	
  
	b <- actionButton(inputId,label,...,css.class = "shinysky-eventinput", 
		"data-shinysky-event-count" = 0, "data-shinysky-last-event"="",
		"data-shinysky-monitored-events" = paste(events,collapse=" ",...)
		)
  return(tagList(singleton(tags$script(src="shinysky/event-input.js")),b))
}
