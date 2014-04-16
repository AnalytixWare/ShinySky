options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    # select2
    observe({
        if (input$updateselect2 == 0) {
            return()
        }
        
        updateSelect2Input(session, "select2Input1", choices = c("d", "e", "f"), selected = c("f", 
            "d"), label = "hello")
        # updateSelectInput(session, 'select2Input2', choices = c('d', 'e', 'f'), selected =
        # c('f', 'd'), label = 'hello') updateSelectInput(session, 'select2Input3', choices
        # = c('d', 'e', 'f'), selected = 'f', label = 'hello')
    })
    
    observe({
        showshinyalert(session, "shinyalert4", paste(input$select2Input1, collapse = ","), 
            "info")
    })
    
    observe({
        showshinyalert(session, "shinyalert5", paste(input$select2Input2, collapse = ","), 
            "info")
    })
    
    observe({
        showshinyalert(session, "shinyalert6", paste(input$select2Input3, collapse = ","), 
            "info")
    })
}) 
