ShinySky
========

Various UI widgets/components used by AnalytixWare's flaghship product e.g. alerts, styled buttons

![alt text](https://github.com/AnalytixWare/ShinySky/blob/master/screenshots/1.png?raw=true "Examples")


# Install

```
install.packages("devtools")#if not alrady installed
devtools::install_github("ShinySky","AnalytixWare")
require(shinysky)
shinysky::run.shinysky.example()
```


# Usage

```
require(shinysky)
```

##Action Buttons

_actionButton(inputId, label, styleclass = yourStyle)_

Here you can specify the style you want using the style parameter. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 

##Alerts

### ui.R
_shinyalert(id)_

Simply provide an id. The alert will be hidden until you show it using _showshinyalert_ in server.R

### server.R
_showshinyalert(id,HTMLtext,session,styleclass)_

Put some valid HTML in HTMLtext. Here you can specify the style you want using the styleclass parameter. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 


# Example

```
shinysky::run.shinysky.example()
```

# Github

https://github.com/AnalytixWare/ShinySky
