#' hot.to.df
#' 
#' Converts the table data passed from the client-side into a data.frame
#' 
#' @param b The input$hotable_id value.
#' @importFrom plyr ldply
#' @export
hot.to.df <- function(b) {
    # if theres is no data
    if (length(b$data) == 0) {
        return()
    }
        
    col.names <- unlist(b$colHeaders)
    
    i = 0
    f <- function(x) {
        i <<- i + 1
        #
        null.pos <- sapply(x,is.null)
        
        x[null.pos] <- NA
        
        xx <- data.frame(x, stringsAsFactors = F)
        colnames(xx) <- col.names
        xx
    }
    
    bb <- plyr::ldply(b$data, f)
    colnames(bb) <- col.names
    bb
}


#' hotable
#' 
#' Creates a hotable (handsontable)
#' 
#' @param id The id used to refer to the table input$id or output$id
#' @importFrom shiny tagList singleton tags div
#' @export
hotable <- function(id) {
    shiny::tagList(        
        shiny::singleton(shiny::tags$head(shiny::tags$link(href = "shinysky/handsontable/0.10.3/jquery.handsontable.full.css", rel = "stylesheet"))),
        shiny::singleton(shiny::tags$head(shiny::tags$script(src = "shinysky/handsontable/0.10.3/jquery.handsontable.full.js"))),
        shiny::singleton(shiny::tags$head(shiny::tags$script(src = "shinysky/hotable.js"))),
        shiny::div(id = id, class = "hotable")
        )
}

#' renderHotable
#' 
#' Renders the hotable.
#' 
#' @param expr The computation that leads to an output
#' @param env The R environment in which to create the dataset
#' @param quoted Pass to the exprToFunction
#' @param options Pass to the exprToFunction
#' @param readOnly A vector of TRUE/FALSE values to indicate which of the 
#'   columns should be read-only.
#' 
#' @examples 
#' 
#' \dontrun{
#' # these example will only run inside a shiny app
#' 
#' ### ui.R
#' #' hotable("hotable1")
#' #This will create a handsontable which you can output using 
#' output$hotable1 <- renderHotable({...})
#' 
#' ### server.R
#' something <- reactive({
#'     hot.to.df(input$hotable1) # this will convert your input into a data.frame
#' })
#' }
#' 
#' @export
renderHotable <- function(expr, env = parent.frame(), quoted = FALSE, 
    options = NULL, readOnly = TRUE) {
    func <- shiny::exprToFunction(expr, env, quoted)
    
    function() {
        df <- func()  # the dataframe returned        
        if (is.null(df)) {
            return()
        }
        if (nrow(df) == 0) {
            return()
        } 
            
        json <- NULL
        json$colHeaders <- colnames(df)
        columns <- NULL
        types <- sapply(df, typeof)

        l <- length(types)

        readOnly <- rep(readOnly,length.out = l)

        for (i in 1:l) {
            if (i == 1) {
                columns[[i]] <- list(readOnly = readOnly[i])
            } else if (types[i] == "double") {
                columns[[i]] <- list(type = "numeric", format = "0,0.00", readOnly = readOnly[i])
            } else if (types[i] == "logical") {
                columns[[i]] <- list(type = "checkbox", readOnly = readOnly[i])
            } else {
                columns[[i]] <- list(readOnly = readOnly[i])
            }
        }
        json$columns <- columns

        json$data <- df

        json
    }
} 
