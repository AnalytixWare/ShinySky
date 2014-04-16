library(shiny)
library(shinysky)

shinyUI(basicPage(  
  headerPanel("ShinySky Examples - Buttons and Alerts"),  br(), br(),
  div(class="row-fluid",h4("ActionButtons")),
  div(class="row-fluid",
  div(class="well container-fluid" , div(class="container span3",
        actionButton("id_blank","blank",size="large"),
        actionButton("id_primary","primary",styleclass="primary",size="mini"),
        actionButton("id_info","info",styleclass="info",size="small"),
        actionButton("id_success","success",styleclass="success",icon = "ok"),
        actionButton("id_warning","warning",styleclass="warning",icon="plus"),
        actionButton("id_danger","danger",styleclass="danger"),
        actionButton("id_inverse","inverse",styleclass="inverse"),
        actionButton("id_link","link",styleclass="link")    
        ),
       div(class=" span3","Buttons that fill a block",
         actionButton("id_inverse2","inverse2",styleclass="inverse",block=T),
         actionButton("id_warning2","warning2",styleclass="warning",block=T)),
      div(class="container-fluid span6", 
        shiny::helpText("Click any button to show an alert. The alert will automatically close after 5 seconds"),
        shinyalert("shinyalert1", FALSE,auto.close.after = 5)
    )
  )
)
 ,h4("EventsButtons")
    ,div(class="row-fluid",
      div(class="container-fluid well",div(class="container span2",
              eventsButton("id_double_click_event","Double click me!",styleclass="danger",events=c("dblclick","mouseenter"))
            ),
            div(class="container span10",
              shinyalert("shinyalert2")
              ))
      )
)
)