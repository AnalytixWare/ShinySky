library(shiny)
library(shinysky)

# Define UI for miles per gallon application
shinyUI(basicPage(  
  headerPanel("ShinySky Examples - Busy Indicator"),  br(), br(),
  
  h4("Busy Indicator")
  ,busyIndicator(wait = 0)
  ,actionButton("busyBtn","Show busyInidcator")
  ,plotOutput("plot1")
  )
)
