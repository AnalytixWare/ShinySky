#' jstree.obj
#' 
#' Creates a jstree object to be passed to jstree for creating a tree view
#' 
#' @param id The id used to refer to the jstree
#'   
#' @export
jstree.obj <- function(x) {  
  handle <- function(ind, theList) { 
    name<-names(theList)[[ind]]
    if(!is.null(name)){
      a<- tags$li(list(name, jstree.obj(theList[[ind]])) )
    } else{
      a <- tags$li(theList[[ind]])
    }
    return(a)
  }
  if(is.list(x)) {
    ind <- seq(1:length(x))
    res<- lapply(ind,handle,x)
    return(tags$ul(res))
  } else {
    x
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
        div(id = id, class = "ss-jstree", tree.list)
        )   
}