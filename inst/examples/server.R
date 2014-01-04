options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    # actionButtons
    observe({
        if (input$id_blank == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "blank"), session)
    })
    observe({
        if (input$id_primary == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "primary"), session, 
            styleclass = "primary")
    })
    observe({
        if (input$id_info == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "info"), session, styleclass = "info")
    })
    observe({
        if (input$id_success == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "success"), session, 
            styleclass = "success")
    })
    observe({
        if (input$id_warning == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "warning"), session, 
            styleclass = "warning")
    })
    observe({
        if (input$id_danger == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "danger", "<button type='button' class='btn btn-danger'>Danger</button>"), 
            session, styleclass = "danger")
    })
    observe({
        if (input$id_inverse == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "inverse"), session, 
            styleclass = "inverse")
    })
    observe({
        if (input$id_link == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "link"), session, styleclass = "link")
    })
    observe({
        if (input$id_inverse2 == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "inverse2"), session, 
            styleclass = "inverse")
    })
    observe({
        if (input$id_warning2 == 0) 
            return()
        showshinyalert("shinyalert1", paste("You have clicked", "warning2"), session, 
            styleclass = "warning")
    })
    
    # eventsButtons
    observe({
        print(input$id_double_click_event)
        if (input$id_double_click_event$event == "dblclick") {
            showshinyalert("shinyalert2", "You have double clicked! Event button can handle doubleclicks", 
                session)
        } else if (input$id_double_click_event$event == "mouseenter") {
            showshinyalert("shinyalert2", "You came in! Single click won't change me", 
                session, styleclass = "info")
        }
        # updateSelectInput(session,'select2Input1',choices=c('a','b','c'),selected=c('c','b'))
    })
    
    # typeahead
    observe({
        input$thti
        showshinyalert("shinyalert3", sprintf("Typeahead Text Input Value: '%s'", input$thti), 
            session, "error")
    })
    
    # select2
    observe({
        if (input$updateselect2 == 0) 
            return()
        
        updateSelect2Input(session, "select2Input1", choices = c("d", "e", "f"), selected = c("f", 
            "d"), label = "hello")
        updateSelectInput(session, "select2Input2", choices = c("d", "e", "f"), selected = c("f", 
            "d"), label = "hello")
        updateSelectInput(session, "select2Input3", choices = c("d", "e", "f"), selected = "f", 
            label = "hello")
    })
    
    observe({
        showshinyalert("shinyalert4", paste(input$select2Input1, collapse = ","), session, 
            "info")
    })
    
    observe({
        showshinyalert("shinyalert5", paste(input$select2Input2, collapse = ","), session, 
            "info")
    })
    
    observe({
        showshinyalert("shinyalert6", paste(input$select2Input3, collapse = ","), session, 
            "info")
    })
    
    output$plot1 <- renderPlot({
        if (input$busyBtn == 0) 
            return()
        Sys.sleep(3)
        hist(rnorm(10^3))
    })
}) 
