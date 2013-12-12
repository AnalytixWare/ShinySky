popover_instruction <- function(id, content) {
    tagList(singleton(tags$head(tags$script(src = "bootstrap-tooltip.js"))), 
        singleton(tags$head(tags$script(src = "bootstrap-popover.js"))), 
        HTML(paste("\n    \n      <a id = \"", id, "\" href=\"#\" class=\"btn\" data-toggle=\"popover\" \n      title=\"Instructions\" \n      data-content=\"", 
            content, "\" data-original-title=\"A Title\"><i class=\" icon-info-sign\"></i> Instructions</a>\n      <script> $(\"#", 
            id, "\").popover({placement:\"bottom\"}) </script>\n        ", 
            sep = "")))
} 
