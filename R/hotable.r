#' hot.to.df
#'
#' @export
hot.to.df <- function(b) {
    # if theres is no data
    if (length(b$data) == 0) 
        return() 
    
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
    
    bb <- ldply(b$data, f)
    colnames(bb) <- col.names
    bb
}


#' hotable
#'
#' @export
hotable <- function(id) {
    tagList(        
        singleton(tags$head(tags$link(href = "shinysky/handsontable/0.10.3/jquery.handsontable.full.css", rel = "stylesheet"))),
        singleton(tags$head(tags$script(src = "shinysky/handsontable/0.10.3/jquery.handsontable.full.js"))),
        singleton(tags$head(tags$script(src = "shinysky/hotable.js"))),
        div(id = id, class = "hotable")
        )
    
}

#' renderHotable
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
