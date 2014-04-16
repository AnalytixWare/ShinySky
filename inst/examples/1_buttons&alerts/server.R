options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    # actionButtons
    observe({
        if (input$id_blank == 0) 
            return()
        showshinyalert(session,"shinyalert1", paste("You have clicked", "blank"))
    })
    observe({
        if (input$id_primary == 0) 
            return()
        showshinyalert(session,"shinyalert1", paste("You have clicked", "primary"),            styleclass = "primary")
    })
    observe({
        if (input$id_info == 0) 
            return()
        showshinyalert(session, "shinyalert1", paste("You have clicked", "info"), styleclass = "info")
    })
    observe({
        if (input$id_success == 0) 
            return()
        showshinyalert(session,"shinyalert1", paste("You have clicked", "success"), styleclass = "success")
    })
    observe({
        if (input$id_warning == 0) 
            return()
        showshinyalert(session, "shinyalert1", paste("You have clicked", "warning"),             styleclass = "warning")
    })
    observe({
        if (input$id_danger == 0) 
            return()
        showshinyalert(session, "shinyalert1", paste("You have clicked", "danger", "<button type='button' class='btn btn-danger'>Danger</button>"), 
            styleclass = "danger")
    })
    observe({
        if (input$id_inverse == 0) 
            return()
        showshinyalert(session, "shinyalert1", paste("You have clicked", "inverse"),  
            styleclass = "inverse")
    })
    observe({
        if (input$id_link == 0) 
            return()
        showshinyalert(session, "shinyalert1", paste("You have clicked", "link"), styleclass = "link")
    })
    observe({
        if (input$id_inverse2 == 0) 
            return()
        showshinyalert(session, "shinyalert1", paste("You have clicked", "inverse2"), styleclass = "inverse")
    })
    observe({
        if (input$id_warning2 == 0) 
            return()
        showshinyalert(session, "shinyalert1", paste("You have clicked", "warning2"), styleclass = "warning")
    })
    
    # eventsButtons
    observe({
        if(is.null(input$id_double_click_event)) {
          return()
        }
        print(input$id_double_click_event)
        if (input$id_double_click_event$event == "dblclick") {
            showshinyalert(session,"shinyalert2", "You have double clicked! Event button can handle doubleclicks")
        } else if (input$id_double_click_event$event == "mouseenter") {
            showshinyalert(session,"shinyalert2", "You came in! Single click won't change me", 
                styleclass = "info")
        }
        # updateSelectInput(session,'select2Input1',choices=c('a','b','c'),selected=c('c','b'))
    })
}) 
