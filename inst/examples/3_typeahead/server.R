options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    # typeahead
    observe({
        input$thti
        showshinyalert(session, "shinyalert3", sprintf("Typeahead Text Input Value: '%s'", 
            input$thti), "error")
    })
    
    # typeahead
    observe({
        if (input$update_typeahead_btn == 0) {
            return()
        }
        dataset <- data.frame(firstname = c("ZJ", "Mitchell"), lastname = c("Dai", "Joblin"))
        valueKey <- "lastname"
        tokens <- c("zd", "mj", dataset$firstname)
        template <- HTML("First Name: <em>{{firstname}}</em> Last Name: <em>{{lastname}}</em>")
        updateTextInput.typeahead(session, "thti", dataset, valueKey, tokens, template, 
            placeholder = "type 'm' or 'z' to see the updated table")
    })
}) 
