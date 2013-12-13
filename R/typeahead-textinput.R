#' textinput.typeahead
#' 
#' A simple typeahead text input component
#' 
#' @import RJSONIO
#' @param id The id of the field
#' @param placeholder The placeholder text. It is shown in the text input before
#'   any input has occured
#' @param local A data.frame containing all the information you want to make 
#'   available to typeahead to display in the dropdown. You can use any of the 
#'   variable in the dataset via the template argument
#' @param tokens A list whose length equal to nrow(local) where each element is 
#'   array of string tokens. Typing the tokens will select the correponding rows
#' @param valueKey The element that acts as the value key in the dataset usually
#'   an unique identifier of the row
#' @param limit An integer of the upper limit on how many hits to show in the 
#'   typeahead dropdown
#' @param template A hogan template on how to show the content e.g. '<p> 
#'   {{name}} </p>' where name is one of the variables in local
#'   
#' @family ShinySky elements
#' @export
textinput.typeahead <- function(id,placeholder,local, valueKey, tokens,template,limit = 20) {
  tagList(
      singleton(tags$head(tags$script(src = "shinysky/typeahead/typeahead.min.js")))
    , singleton(tags$head(tags$script(src = "shinysky/typeahead/hogan.js")))
    , singleton(tags$head(tags$script(src = "shinysky/typeahead/textinput-typeahead.js")))
    , singleton(tags$head(tags$link(rel="stylesheet",href="shinysky/typeahead/example.css")))
    , HTML(sprintf('<input data-name="%s" type="text" value="" class="input typeahead" placeholder="%s" autocomplete="off" spellcheck="false" style="margin: 0 auto;"/>',id,placeholder))
    , tags$script(HTML(sprintf('update_typeahead("%s",%s,"%s",%s,"%s",%s)',id,toJSON(local),valueKey,toJSON(as.character(tokens)),HTML(template),limit)))
    )
  
}

# #' update.textinput.typeahead
# #' 
# #' short description
# #' 
# #' @param parm1
# #'   
# #' @return {4:description of what is returned}
# updateVarsTypeAhead <- function(id, data) {
#   update_textInput_typeahead
#   
#   session$sendCustomMessage(type = "typeahead_vars", list(id = id, 
#                                                           dataset = data, tokens_camelcase = tokens_camelcase, tokens_underscore = tokens_underscore))
# }