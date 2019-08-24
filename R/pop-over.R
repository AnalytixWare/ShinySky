popover_instruction <- function(id, content) {
    shiny::tagList(shiny::singleton(shiny::tags$head(shiny::tags$script(src = "bootstrap-tooltip.js"))), 
        shiny::singleton(shiny::tags$head(shiny::tags$script(src = "bootstrap-popover.js"))), 
        shiny::HTML(paste("\n    \n      <a id = \"", id, "\" href=\"#\" class=\"btn\" data-toggle=\"popover\" \n      title=\"Instructions\" \n      data-content=\"", 
            content, "\" data-original-title=\"A Title\"><i class=\" icon-info-sign\"></i> Instructions</a>\n      <script> $(\"#", 
            id, "\").popover({placement:\"bottom\"}) </script>\n        ", 
            sep = "")))
} 
