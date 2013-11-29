
eventButton <- function(inputId, label , events=c("dblclick","click"),...) {
	#actionButtonBase <- actionButton(inputId,label,...,css.class = HTML('shinysky-eventinput" data-shinysky-event-count = "0" data-shinysky-last-event=""'))
	actionButtonBase <- actionButton(inputId,label,...,css.class = "shinysky-eventinput", 
		"data-shinysky-event-count" = 0,"data-shinysky-tot-event-count" = 0, "data-shinysky-last-event"="",
		"data-shinysky-monitored-events" = paste(events,collapse=" ",...)
		)
}
