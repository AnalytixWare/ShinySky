\name{select2Input}
\alias{select2Input}
\title{select2 Input}
\usage{
select2Input(inputId, ...)
}
\arguments{
  \item{inputId}{Input variable to assign the control's
  value to}

  \item{label}{Display label for the control}

  \item{choices}{List of values to select from. If elements
  of the list are named then that name rather than the
  value is displayed to the user.}

  \item{selected}{Name of initially selected item (or
  multiple names if \code{multiple = TRUE}). If not
  specified then defaults to the first item for
  single-select lists and no items for multiple select
  lists.}

  \item{multiple}{Is selection of multiple items allowed?}
}
\value{
A select list control that can be added to a UI
definition.#'
}
\description{
The select2 input. The inputs parameters are the same as
selectInput
}
\examples{
select2Input("variable", "Variable:",
            c("Cylinders" = "cyl",
              "Transmission" = "am",
              "Gears" = "gear"),multiple=TRUE)
}
\seealso{
Other ShinySky.elements: \code{\link{actionButton}};
\code{\link{shinyalert}}; \code{\link{showshinyalert}};
\code{\link{textInput.typeahead}}
}

