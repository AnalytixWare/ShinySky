library(shiny)
library(shinysky)


shinyUI(basicPage(  
  headerPanel("ShinySky Examples - select2"),  br(), br(),

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
  )
)
)