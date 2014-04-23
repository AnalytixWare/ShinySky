library(shiny)
library(shinysky)

shinyUI(basicPage(
	headerPanel("ShinySky Examples - jscolor"), 
	br(), br(), 
	h4("jscolor Picker (see www.jscolor.com)"), 
    div(class = "well container-fluid", 
    	div(class = "row-fluid", 
    		div(class = "row-fluid", 
        		div(class = "span3", jscolorInput("jscolorInput1")), 
        		div(class = "span9", shinyalert("alert_jscolorInput1")
	        	)
	        )
	    )
	 )
))