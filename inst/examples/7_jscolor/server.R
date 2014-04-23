options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    # jscolor
    observe({
        showshinyalert(session, "alert_jscolorInput1", paste0("You selected this color: ", 
            input$jscolorInput1))
    })
}) 
