library(shiny)
library(shinysky)

# Define UI for miles per gallon application
shinyUI(basicPage(
  
  # Application title
  headerPanel("ShinySky Examples"),  
  actionButton("id_blank","blank",size="large"),
  actionButton("id_primary","primary",styleclass="primary",size="mini"),
  actionButton("id_info","info",styleclass="info",size="small"),
  actionButton("id_success","success",styleclass="success",icon = "ok"),
  actionButton("id_warning","warning",styleclass="warning",icon="plus"),
  actionButton("id_danger","danger",styleclass="danger"),
  actionButton("id_inverse","inverse",styleclass="inverse"),
  actionButton("id_link","link",styleclass="link"),
  eventsButton("id_double_click_event","Double click me!",styleclass="danger",events=c("dblclick","mouseenter")),
  shiny::helpText("Click any button to show an alert"),
  shinyalert("shinyalert1"),
  br(),
  div(class="row",
    div(class="well span4","Buttons that fill a block",
      actionButton("id_inverse2","inverse2",styleclass="inverse",block=T),
      actionButton("id_warning2","warning2",styleclass="warning",block=T)))
  ,h3("Typeahead Text Input")
  ,textinput.typeahead(
    id="thti"
    ,placeholder="type 'name' or '2'"
    ,local=data.frame(name=c("name1","name2"),info=c("info1","info2"))
    ,valueKey = "name"
    ,tokens=c(1,2)
    ,template = HTML("<p class='repo-language'>{{info}}</p> <p class='repo-name'>{{name}}</p> <p class='repo-description'>You need to learn more CSS to customize this further</p>")
  )
  ,shiny::helpText("Type 'name' or '2' to see the features. ")
  ,shinyalert("shinyalert2")
  ,h2("Source Code")
  ,tags$script(src="https://gist.github.com/xiaodaigh/7707701.js")
))