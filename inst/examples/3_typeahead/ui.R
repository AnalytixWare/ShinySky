library(shiny)
library(shinysky)


# Define UI for miles per gallon application
shinyUI(basicPage(  
  headerPanel("ShinySky Examples - Typeahead"),  br(), br(),
 
  h4("Typeahead Text Input ")
  ,div(class="row-fluid ", div(class="well container-fluid",     
    div(class="container span3",
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
  )
)
)