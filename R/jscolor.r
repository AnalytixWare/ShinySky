#' jscolorInput
#' 
#' Creates a jscolor picker input
#' 
#' @param id The id used to refer to the table input$id or output$id
#'   
#' @export
jscolorInput <- function(id) {
    tagList(        
        singleton(tags$head(tags$script(src = "shinysky/ss-jscolor.js"))),
        singleton(tags$head(tags$script(src = "shinysky/jscolor/jscolor.js"))),
        tags$input(id = id, class = "color shiny-bound-input", onchange = sprintf("$('#%s').trigger('afterChange')",id)),
        tags$script(sprintf("$('#%s').trigger('afterChange')",id))
    )
}