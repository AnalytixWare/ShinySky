\name{showshinyalert}
\alias{showshinyalert}
\title{showshinyalert}
\usage{
showshinyalert(session, id, HTMLtext, styleclass = "success")
}
\arguments{
  \item{id}{Specifies the alert id that will be used to
  access the}

  \item{HTMLtext}{The HTML you want displayed in the text}

  \item{styleclass}{The styling class of the alert--options
  are primary, info, success ,warning, ,danger ,inverse
  ,link}
}
\description{
Used in server.R. Show an alert placed in ui.R with
shinyalert
}
\seealso{
shinyalert hideshinyalert

Other ShinySky.elements: \code{\link{actionButton}};
\code{\link{select2Input}}; \code{\link{shinyalert}};
\code{\link{textInput.typeahead}}
}

