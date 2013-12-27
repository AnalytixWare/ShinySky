\name{actionButton}
\alias{actionButton}
\title{Action button}
\usage{
actionButton(inputId, label, styleclass = "", size = "", block = F,
  icon = NULL, css.class = "", ...)
}
\arguments{
  \item{inputId}{Specifies the input slot that will be used
  to access the value.}

  \item{label}{The contents of the button--usually a text
  label, but you could also use any other HTML, like an
  image.}

  \item{styleclass}{The Bootstrap styling class of the
  button--options are primary, info, success, warning,
  danger, inverse, link or blank}

  \item{size}{The size of the button--options are large,
  small, mini}

  \item{block}{Whehter the button should fill the block}

  \item{icon}{Display an icon for the button
  \url{http://getbootstrap.com/2.3.2/base-css.html#icons}}

  \item{css.class}{Any additional CSS class one wishes to
  add to the action button}
}
\description{
Creates an action button whose value is initially zero, and
increments by one each time it is pressed.
}
\seealso{
Other ShinySky.elements: \code{\link{select2Input}};
\code{\link{shinyalert}}; \code{\link{showshinyalert}};
\code{\link{textInput.typeahead}}
}

