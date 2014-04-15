#' jstree.obj
#' 
#' Creates a jstree object to be passed to jstree for creating a tree view
#' 
#' @param id The id used to refer to the jstree
#'   
#' @export
jstree.obj <- function(tree.list) {
   if(is.list(tree.list)) {
    res <- lapply(tree.list,jstree.obj)
    return(tags$ul(res))
   } else {
    return(tags$li(tree.list))
   }
}

#' jstree
#' 
#' Creates a jstree
#' 
#' @param id The id used to refer to the jstree
#'   
#' @export
jstree <- function(id, tree.list) {
    tagList(        
        singleton(tags$head(tags$link(href = "shinysky/jstree/dist/themes/default/style.min.css", rel = "stylesheet"))),
        singleton(tags$head(tags$script(src = "shinysky/jstree/dist/jstree.min.js"))),
        singleton(tags$head(tags$script(src = "shinysky/ss-jstree.js"))),
        tags$script(sprintf("$(function() {$('#%s').jstree()})",id)),
        #div(id = id, class = "ss-jstree",jstree.obj(tree.list))
        div(id = id, class = "ss-jstree", tree.list)
        )   
}