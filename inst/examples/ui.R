library(shiny)
library(shinysky)

# Define UI for miles per gallon application
shinyUI(basicPage(
  # Application title
  headerPanel("ShinySky Examples"),  
  div(class="row-fluid span12",h4("ActionButtons")),
  div(class="row-fluid well span12",
  	div(class="container span3",
	  actionButton("id_blank","blank",size="large"),
	  actionButton("id_primary","primary",styleclass="primary",size="mini"),
	  actionButton("id_info","info",styleclass="info",size="small"),
	  actionButton("id_success","success",styleclass="success",icon = "ok"),
	  actionButton("id_warning","warning",styleclass="warning",icon="plus"),
	  actionButton("id_danger","danger",styleclass="danger"),
	  actionButton("id_inverse","inverse",styleclass="inverse"),
	  actionButton("id_link","link",styleclass="link")	  
  		),
   	div(class="well span3","Buttons that fill a block",
   		actionButton("id_inverse2","inverse2",styleclass="inverse",block=T),
   		actionButton("id_warning2","warning2",styleclass="warning",block=T)),
  	div(class="container-fluid span6",
  		shiny::helpText("Click any button to show an alert"),
  		shinyalert("shinyalert1")
	)),

  	div(class="row-fluid span12",h4("EventsButtons")),
  	div(class="row-fluid well span12",
	  	div(classs="container-fluid span3",
	  		eventsButton("id_double_click_event","Double click me!",styleclass="danger",events=c("dblclick","mouseenter"))
	  	),
  		div(class="container-fluid span9",
  			shinyalert("shinyalert2"))
  		)
  ,h4("Typeahead Text Input ",class="span12")
  ,div(class="row-fluid span12 well",
  	 div(class="container-fluid span2",
	  	 textInput.typeahead(
	    	id="thti"
	    	,placeholder="type 'name' or '2'"
	    	,local=data.frame(name=c("name1","name2"),info=c("info1","info2"))
	    	,valueKey = "name"
	    	,tokens=c(1,2)
	    	,template = HTML("<p class='repo-language'>{{info}}</p> <p class='repo-name'>{{name}}</p> <p class='repo-description'>You need to learn more CSS to customize this further</p>")
		  )
  	 ),
  	 div(class="container-fluid span10"
  	 	,shiny::helpText("Type 'name' or '2' to see the features. ")
  	 	,shinyalert("shinyalert3")
  	 )
  )
  ,h4("Select2 ",class="span12")
  ,div(class="row-fluid span12 well",
       div(class="container-fluid span2",
         select2Input("select2Input1","This is a multiple select2Input",choices=c("a","b","c"),selected=c("a","c"),multiple=TRUE)
       ),
       div(class="container-fluid span10"
           ,shiny::helpText("Select2Input ")
           ,shinyalert("shinyalert4")
       )
  )
  ,div(class="container-fluid span12"
  	,h3("Source Code")
  	,tags$script(src="https://gist.github.com/xiaodaigh/7707701.js")
  	)
))
