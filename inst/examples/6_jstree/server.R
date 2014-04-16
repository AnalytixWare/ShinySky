options(shiny.trace = F)  # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output, session) {
    # jstree
    observe({
        showshinyalert(session, "alert_jstree1", paste0("You selected these items in the tree: ", 
            paste0(input$jstree1, collapse = ", ")))
    })
}) 
