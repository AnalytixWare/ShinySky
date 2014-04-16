options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    #busyIndicator
    output$plot1 <- renderPlot({
        if (input$busyBtn == 0) 
            return()
        Sys.sleep(3)
        hist(rnorm(10^3))
    })
}) 
