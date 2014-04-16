library(shiny)
library(shinysky)

# Define UI for miles per gallon application
shinyUI(basicPage(  
  headerPanel("ShinySky Examples - hotable"),  br(), br(),
  h4("Handsontable Input/Output"),
  div(class="well container-fluid", 
    div(class="row-fluid"
    ,hotable("hotable1")
  )
)
)
)