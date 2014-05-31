#' jstree.obj
#' 
#' Creates a jstree object to be passed to jstree for creating a tree view
#' 
#' @param id The id used to refer to the jstree
#' @param addLevelClass Add a class attribute "treedepth_n" to each node, where n is the tree level (depth) of each node, starting with top level = 1.  Useful with conditionalPanel, css and jQuery.
#' @param addIndex Add an attrbute "index" to each node, a string containing the path from the top, in concatenated ind values. 
#' @param level The current tree level for this node, to be passed into the recursive calls. Default = 0 (top level). Not intended for the user; used only in the recursion.
#' @param index A string containing the path from the top, in concatenated ind values.  Not intended for the user; used only in the recursion.
#' @export
jstree.obj <- function (x, addLevelClass=TRUE, addIndex=TRUE, level=0, index="1") 
{
  handle <- function(ind, theList, level) {
    name <- names(theList)[[ind]]
    if (!is.null(name)) {
      level=level+1
      index = paste0(index, "_", ind)
      a <- tags$li(list(name, 
                        myjstree.obj(theList[[ind]], 
                                     addLevelClass=addLevelClass,
                                     addIndex=addIndex,
                                     level=level,
                                     index=index
                        )))
    }
    else {
      a <- tags$li(theList[[ind]])
    }
    if(addLevelClass)
      a <- tagAppendAttributes(a, class=paste0("treedepth_", level))
    if(addIndex)
      a <- tagAppendAttributes(a, index=index)
    return(a)
  }
  if (is.list(x)) {
    ind <- seq(1:length(x))
    res <- lapply(ind, handle, x, level=level)
    return(tags$ul(res))
  }
  else {
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
