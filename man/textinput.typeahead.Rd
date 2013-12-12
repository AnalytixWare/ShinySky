\name{textInput.typeahead}
\alias{textInput.typeahead}
\title{textinput.typeahead}
\usage{
  textInput.typeahead(id, placeholder, local, valueKey,
    tokens, template, limit = 20)
}
\arguments{
  \item{id}{The id of the field}

  \item{placeholder}{The placeholder text. It is shown in
  the text input before any input has occured}

  \item{local}{A data.frame containing all the information
  you want to make available to typeahead to display in the
  dropdown. You can use any of the variable in the dataset
  via the template argument}

  \item{tokens}{A list whose length equal to nrow(local)
  where each element is array of string tokens. Typing the
  tokens will select the correponding rows}

  \item{valueKey}{The element that acts as the value key in
  the dataset usually an unique identifier of the row}

  \item{limit}{An integer of the upper limit on how many
  hits to show in the typeahead dropdown}

  \item{template}{A hogan template on how to show the
  content e.g. '<p> {{name}} </p>' where name is one of the
  variables in local}
}
\description{
  A simple typeahead text input component
}
\seealso{
  Other ShinySky.elements: \code{\link{actionButton}},
  \code{\link{shinyalert}}, \code{\link{showshinyalert}}
}

