#' busyIndicator
#' 
#' A busy indicator
#' 
#' @param text The text to show
#' @param img An anitmated gif
#' @param wait The amount of time to wait before showing the busy indicator. The
#'   default is 1000 which is 1 second.
#'   
#' @export
busyIndicator <- function(text = "Calculation in progress..",img = "shinysky/busyIndicator/ajaxloaderq.gif", wait=1000) {
	tagList(
  		singleton(tags$head(
    		tags$link(rel="stylesheet", type="text/css",href="shinysky/busyIndicator/busyIndicator.css")
  			))
  		,div(class="shinysky-busy-indicator",p(text),img(src=img))
  		,tags$script(sprintf(
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