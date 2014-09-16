#' jstree.obj
#' 
#' Creates a jstree object to be passed to jstree for creating a tree view
#' 
#' @param id The id used to refer to the jstree
#' @param addDepthClass Add a class attribute "treedepth_n" to each node, where n is the tree depth (depth) of each node, starting with top depth = 1.  Useful with conditionalPanel, css and jQuery.
#' @param addIndex Add an attrbute "index" to each node, a string containing the path from the top, in concatenated ind values. 
#' @param depth The current tree depth for this node, to be passed into the recursive calls. Default = 0 (top depth). Not intended for the user; used only in the recursion.
#' @param index A string containing the path from the top, in concatenated ind values.  Not intended for the user; used only in the recursion.
#' @export
jstree.obj <- function (x, addDepthClass=TRUE, addIndex=TRUE, depth=0, index="1") 
{
  handle <- function(ind, theList, depth) {
    name <- names(theList)[[ind]]
    if (!is.null(name)) {
      depth=depth+1
      index = paste0(index, "_", ind)
      a <- tags$li(list(name, 
                        myjstree.obj(theList[[ind]], 
                                     addDepthClass=addDepthClass,
                                     addIndex=addIndex,
                                     depth=depth,
                                     index=index
                        )))
    }
    else {
      a <- tags$li(theList[[ind]])
    }
    if(addDepthClass)
      a <- tagAppendAttributes(a, class=paste0("treedepth_", depth))
    if(addIndex)
      a <- tagAppendAttributes(a, index=index)
    return(a)
  }
  if (is.list(x)) {
    ind <- seq(1:length(x))
    res <- lapply(ind, handle, x, depth=depth)
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
