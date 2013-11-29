library(shiny)

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
  div(class="well span4","Buttons that fill a block",
    actionButton("id_inverse2","inverse2",styleclass="inverse",block=T),
    actionButton("id_warning2","warning2",styleclass="warning",block=T))
))