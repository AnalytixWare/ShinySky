library(shiny)

# Define UI for miles per gallon application
shinyUI(basicPage(
  
  # Application title
  headerPanel("ShinySky Examples"),  
  actionButton("id_blank","blank"),
  actionButton("id_primary","primary",styleclass="primary"),
  actionButton("id_info","info",styleclass="info"),
  actionButton("id_success","success",styleclass="success"),
  actionButton("id_warning","warning",styleclass="warning"),
  actionButton("id_danger","danger",styleclass="danger"),
  actionButton("id_inverse","inverse",styleclass="inverse"),
  actionButton("id_link","link",styleclass="link"),
  shiny::helpText("Click any button to show an alert"),
  shinyalert("shinyalert1")
))