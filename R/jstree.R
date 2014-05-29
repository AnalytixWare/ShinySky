#' jstree.obj
#' 
#' Creates a jstree object to be passed to jstree for creating a tree view
#' 
#' @param id The id used to refer to the jstree
#' @param addLevelClass Add a class attribute "level_n" to each node, where n is the tree level (depth) of each node, starting with top level = 0.  Useful with conditionalPanel, css and jQuery.
#' @param level The current tree level for this node, to be passed into the recursive calls. Default = 0 (top level). Not intended for the user; used only in the recursion.
#' @export
jstree.obj = 
function (x, addLevelClass=TRUE, level=0)
{
  handle <- function(ind, theList, level) {
    name <- names(theList)[[ind]]
    if (!is.null(name)) {
      a <- tags$li(list(name, 
		jstree.obj(theList[[ind]], 
                        addLevelClass=addLevelClass,
			level=level+1
	)))
    }
    else {
      a <- tags$li(theList[[ind]])
    }
    ### This line is added to shinysky:::jstree.obj
    a <- tagAppendAttributes(a, class=paste0("level_", level))
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
