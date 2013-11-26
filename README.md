ShinySky
========

Various UI widgets/components used by AnalytixWare's flaghship product e.g. alerts, styled buttons

# Install
install.packages("devtools")

devtools::install_github("ShinySky","AnalytixWare")

# Usage

##Action Buttons

_actionButton(inputId, label, style = yourStyle)_

Here you can specify the style you want using the style parameter. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link"

# Example

https://gist.github.com/xiaodaigh/7012930

shiny::runGist("7012930")
