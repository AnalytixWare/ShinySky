% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select2.R
\name{select2Input}
\alias{select2Input}
\alias{includeSelect2}
\alias{updateSelect2Input}
\title{select2 Input}
\usage{
select2Input(inputId, label, choices = NULL, selected = NULL,
  type = c("input", "select"), drag.and.drop = FALSE, ...)

includeSelect2(drag.and.drop = FALSE)

updateSelect2Input(session, inputId, label, choices = NULL,
  selected = NULL)
}
\arguments{
\item{inputId}{Input variable to assign the control's value to}

\item{label}{Display label for the control}

\item{choices}{List of values to select from. If elements of the list are 
named then that name rather than the value is displayed to the user.}

\item{selected}{Name of initially selected item (or multiple names if 
\code{multiple = TRUE}). If not specified then defaults to the first item 
for single-select lists and no items for multiple select lists.}

\item{type}{The two valid options are input and select. The input type is 
similar to a text input and it can remember the order of selection. The
select is based on the <select> tags in HTML and is not ordinal hence the
order in which you specify the selection is not being taken into account,
however it's input parameters are compatible with selectInput and you can
use updateSelectInput to update its contents.}

\item{drag.and.drop}{Allow drag and drop or not}

\item{...}{Other arguments to pass into shiny::selectInput}

\item{session}{The Shiny session}
}
\value{
A select list control that can be added to a UI definition.#'

`includeSelect2` returns the HTML to include the Javascripot and CSS of select2.js
}
\description{
The select2 input

Some code to include css and js for includeSelect2. This is provide so that 
the user can have access to select2 even if they only use it in the dynamic 
UI

Update select2Input
}
\examples{

## ui.r
select2Input("select2Input1",
  "This is a multiple select2Input",
   choices=c("a","b","c"),
   selected=c("b","a"))

}
\seealso{
Other ShinySky elements: \code{\link{actionButton}},
  \code{\link{shinyalert}},
  \code{\link{textInput.typeahead}}
}
\concept{ShinySky elements}
