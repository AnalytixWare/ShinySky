#' busyIndicator
#' 
#' A busy indicator
#' 
#' @param text The text to show
#' @param img An animated gif
#' @param wait The amount of time to wait before showing the busy indicator. The
#'   default is 1000 which is 1 second.
#'
#' @examples
#' # add the following to the ui.R
#' # this will show a one second busy indicator
#' busyIndicator(wait = 1000)
#' 
#' @export
busyIndicator <- function(text = "Calculation in progress..",img = "shinysky/busyIndicator/ajaxloaderq.gif", wait=1000) {
	shiny::tagList(
  		shiny::singleton(shiny::tags$head(
  		  shiny::tags$link(rel="stylesheet", type="text/css",href="shinysky/busyIndicator/busyIndicator.css")
  			))
  		,shiny::div(class="shinysky-busy-indicator",p(text),img(src=img))
  		,shiny::tags$script(sprintf(
  		"	setInterval(function(){
  		 	 if ($('html').hasClass('shiny-busy')) {
  		    setTimeout(function() {
  		      if ($('html').hasClass('shiny-busy')) {
  		        $('div.shinysky-busy-indicator').show()
  		      }
  		    }, %d)  		    
  		  } else {
  		    $('div.shinysky-busy-indicator').hide()
  		  }
  		},100)
  		",wait)
  			)
	)	
}