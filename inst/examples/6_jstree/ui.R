library(shiny)
library(shinysky)

nav = list(
  "Branch"=list("twig"=list("leafOnTwigA","leafOnTwigB" ),"leafOnBranch"),
  "Topleaf"
)


# Define UI for miles per gallon application
shinyUI(basicPage(  
  headerPanel("ShinySky Examples - jstree"),  br(), br(),
  h4("Treeview (based on jstree)"),
  div(class="well container-fluid", 
    div(class = "row-fluid",
    div(class="row-fluid", 
      div(class="span2",
        jstree("jstree1",jstree.obj(nav))
      )
      ,div(class="span10", shinyalert("alert_jstree1"))
    )
  )
  )
))