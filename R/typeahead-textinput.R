#' textinput.typeahead
#' 
#' A simple typeahead text input component
#' 
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
textInput.typeahead <- function(id,placeholder,local, valueKey, tokens,template,limit = 20) {
  tagList(
      singleton(tags$head(tags$script(src = "shinysky/typeahead/typeahead.min.js")))
    , singleton(tags$head(tags$script(src = "shinysky/typeahead/hogan.js")))
    , singleton(tags$head(tags$script(src = "shinysky/typeahead/textInput-typeahead.js")))
    , singleton(tags$head(tags$link(rel="stylesheet",href="shinysky/typeahead/example.css")))
    , HTML(sprintf('<input data-name="%s" type="text" value="" class="input typeahead" placeholder="%s" autocomplete="off" spellcheck="false" style="margin: 0 auto;"/>',id,placeholder))
    , tags$script(HTML(sprintf('update_typeahead("%s",%s,"%s",%s,"%s",%s)',id,toJSON(local),valueKey,toJSON(as.character(tokens)),HTML(template),limit)))
    )
  
}

#' updateTextInput.typeahead
#' 
#' Update textInput.typeahead
#' @param session The Shiny sessoin specified in shinyServer(function(input, output, session) {...}).  
#' @param dataset The data.frame to render
#' @rdname textInput.typeahead
#'
#' @export
updateTextInput.typeahead <- function(session,id, dataset, valueKey, tokens, template, limit = 20, placeholder = "") {    
  session$sendCustomMessage(type = "update_textInput_typeahead", list(id = id, dataset = dataset, valueKey = valueKey, tokens = tokens, template = template, limit = limit, placeholder = placeholder))
}