#' jstree.obj
#' 
#' Creates a jstree object to be passed to jstree for creating a tree view
#' 
#' @param id The id used to refer to the jstree
#'   
#' @export
jstree.obj <- function(id, tree) {
    tagList(        
        singleton(tags$head(tags$link(href = "shinysky/jstree/dist/themes/default/style.min.css", rel = "stylesheet"))),
        singleton(tags$head(tags$script(src = "shinysky/jstree/dist/jstree.min.js"))),
        tags$script(sprintf("$(function() {$('#%s').jstree()",id)),
        div(id = id, class = "ss-jstree")
        )   
}

#' jstree
#' 
#' Creates a jstree
#' 
#' @param id The id used to refer to the jstree
#'   
#' @export
jstree <- function(id, tree) {
    tagList(        
        singleton(tags$head(tags$link(href = "shinysky/jstree/dist/themes/default/style.min.css", rel = "stylesheet"))),
        singleton(tags$head(tags$script(src = "shinysky/jstree/dist/jstree.min.js"))),
        tags$script(sprintf("$(function() {$('#%s').jstree()",id)),
        div(id = id, class = "ss-jstree")
        )   
}