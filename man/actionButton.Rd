\name{actionButton}
\alias{actionButton}
\title{Action button}
\usage{
  actionButton(inputId, label, btn.style = "",
    css.class = "")
}
\arguments{
  \item{inputId}{Specifies the input slot that will be used
  to access the value.}

  \item{label}{The contents of the button--usually a text
  label, but you could also use any other HTML, like an
  image.}

  \item{btn.style}{The styling class of the button--options
  are primary, info, success ,warning, ,danger ,inverse
  ,link}

  \item{css.class}{Any additional CSS class one wishes to
  add to the action button e.g btn-large}
}
\description{
  Creates an action button whose value is initially zero,
  and increments by one each time it is pressed.
}
\seealso{
  Other res: \code{\link{showShinyAlert}}
}

