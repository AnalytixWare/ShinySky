#' Buttons including Action Buttons and Event Buttons
#' 
#' Creates an action button whose value is initially zero, and increments by one
#' each time it is pressed.
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'   value.
#' @param label The contents of the button--usually a text label, but you could 
#'   also use any other HTML, like an image.
#' @param styleclass The Bootstrap styling class of the button--options are 
#'   primary, info, success, warning, danger, inverse, link or blank
#' @param size The size of the button--options are large, small, mini
#' @param block Whehter the button should fill the block
#' @param icon Display an icon for the button
#' @param icon.library Specify an icon set to use 
#'   \url{http://www.fontawesome.io/icons} or 
#'   \url{http://getbootstrap.com/2.3.2/base-css.html#icons}
#' @param css.class Any additional CSS class one wishes to add to the action 
#'   button
#' @param ... Other argument to feed into shiny::actionButton
#'   
#' @family ShinySky elements
#'   
#'   
#' @export
actionButton <- function(inputId, label, styleclass = "", size = "", 
    block = F, icon = NULL, icon.library = c("bootstrap", "font awesome"),  css.class = "", ...) {
    if (styleclass %in% c("primary", "info", "success", "warning", 
        "danger", "inverse", "link")) {
        btn.css.class <- paste("btn", styleclass, sep = "-")
    } else btn.css.class = ""
    
    if (size %in% c("large", "small", "mini")) {
        btn.size.class <- paste("btn", size, sep = "-")
    } else btn.size.class = ""
    
    if (block) {
        btn.block = "btn-block"
    } else btn.block = ""
    
    if (!is.null(icon)) {
        if( !(icon.library[1] %in% c("font awesome", "bootstrap")) ){
          icon.set = "bootstrap"
        }else{
          icon.set = icon.library[1]
        }
        set = switch(icon.set,
                     "font awesome" = "fa fa-",
                     "bootstrap" = "icon-")
        icon.code <- HTML(paste0("<i class='", set, icon, "'></i>"))
    } else icon.code = ""
    
    tags$button(id = inputId, type = "button", class = paste("btn action-button", 
        btn.css.class, btn.size.class, btn.block, css.class, collapse = " "), 
        icon.code, label, ...)
} 
