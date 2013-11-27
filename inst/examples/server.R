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
    showshinyalert("shinyalert1",paste("You have clicked","danger"),session,styleclass="danger")
  })
  observe({
    if(input$id_inverse==0) return()
  	showshinyalert("shinyalert1",paste("You have clicked","inverse"),session,styleclass="inverse")
  })
  observe({
    if(input$id_link==0) return()
    showshinyalert("shinyalert1",paste("You have clicked","link"),session,styleclass="link")
  })
})