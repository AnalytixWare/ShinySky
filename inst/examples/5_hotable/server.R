options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    #hotable
    output$hotable1 <- renderHotable({
      head(iris)
    }, readOnly = FALSE)
    
    observe({
      df <- hot.to.df(input$hotable1)
      print(head(df))
    })
}) 
