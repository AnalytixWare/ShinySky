options(shiny.trace=F) # cahnge to T for trace
require(shiny)
require(shinysky)

shinyServer(function(input, output,session) { 
  observe({
    if(input$id_blank==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","blank"),session)
  })
  observe({
    if(input$id_primary==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","primary"),session,styleclass="primary")
  })
  observe({
    if(input$id_info==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","info"),session,styleclass="info")
  })
  observe({
    if(input$id_success==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","success"),session,styleclass="success")
  })
  observe({
    if(input$id_warning==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","warning"),session,styleclass="warning")
  })
  observe({
    if(input$id_danger==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","danger","<button type='button' class='btn btn-danger'>Danger</button>"),session,styleclass="danger")
  })
  observe({
    if(input$id_inverse==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","inverse"),session,styleclass="inverse")
  })
  observe({
    if(input$id_link==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","link"),session,styleclass="link")
  })
  
  # eventsButtons
  observe({
    print(input$id_double_click_event)
    if(input$id_double_click_event$event=="dblclick") {
      showshinyalert("shinyalert1","You have double clicked! Event button can handle doubleclicks",session)
    } else if(input$id_double_click_event$event=="mouseenter") {
      showshinyalert("shinyalert1","You came in! Single click won't change me",session,styleclass="info")
    }
  })
})