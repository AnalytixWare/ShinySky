library(shiny)
library(shinysky)


shinyUI(basicPage(headerPanel("ShinySky Examples"),  br(),
  tabsetPanel(selected = "Action Buttons",
    tabPanel("Action Buttons",
  
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
))
  ,tabPanel("Select2",
  h4("Select2")
  ,div(class="row-fluid ",
  div(class="well container-fluid"   ,  
    div(class="container span3",
           select2Input("select2Input1","This is a multiple select2Input. The items are re-arrangeable",
                        choices=c("a","b","c"),
                        selected=c("b","a"))
         ),
         div(class="container span3"
             ,helpText("Select2Input")
             ,actionButton("updateselect2","Update")
             ,shinyalert("shinyalert4")
         ),
         div(class="container span3",
           select2Input("select2Input2","This is a multiple select2Input type = select. The items are NOT re-arrangeable",
                        choices=c("a","b","c"),selected=c("b","a"),
                        type="select",multiple=TRUE)
         ),
         div(class="container span3"
             ,helpText("Select2Input2")
             ,shinyalert("shinyalert5")
         )
        ,     div(class="container span3",
           select2Input("select2Input3","This is a multiple select2Input type = select",choices=c("a","b","c"),selected=c("b","a"),type="select")
         ),
         div(class="container span3"
             ,helpText("Select2Input2")
             ,shinyalert("shinyalert6")
         ))
  ))
      
  ,tabPanel("Typeahead",
  h4("Typeahead Text Input ")
  ,div(class="row-fluid ", div(class="well container-fluid",     div(class="container span3",
      helpText("Type 'name' or '2' to see the features. "),
       textInput.typeahead(
        id="thti"
        ,placeholder="type 'name' or '2'"
        ,local=data.frame(name=c("name1","name2"),info=c("info1","info2"))
        ,valueKey = "name"
        ,tokens=c(1,2)
        ,template = HTML("<p class='repo-language'>{{info}}</p> <p class='repo-name'>{{name}}</p> <p class='repo-description'>You need to learn more CSS to customize this further</p>")
      ),
      actionButton("update_typeahead_btn","Update Typeahead", styleclass= "primary")
     ),
     div(class="container span9"
       ,shinyalert("shinyalert3")
     ))
  ))

,tabPanel("EventsButtons"
  ,h4("EventsButtons")
    ,div(class="row-fluid",
      div(class="container-fluid well",div(class="container span2",
              eventsButton("id_double_click_event","Double click me!",styleclass="danger",events=c("dblclick","mouseenter"))
            ),
            div(class="container span10",
              shinyalert("shinyalert2")
              ))
      ))
,tabPanel("Handsontable"
    ,h4("Handsontable Input/Output")
  ,div(class="well container-fluid"
    ,hotable("hotable1")
  ))


  ,tabPanel("Busy Indicator",
    h4("Busy Indicator")
  ,busyIndicator("Calculation In progress",wait = 0)
  ,actionButton("busyBtn","Show busyInidcator")
  ,plotOutput("plot1")
  )

))
)