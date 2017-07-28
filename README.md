ShinySky
========

Various UI widgets/components used by AnalytixWare's flaghship product e.g. alerts, styled buttons

![alt text](/screenshots/7.png?raw=true "Examples")


# Install
```r
if (require(devtools)) install.packages("devtools")#if not already installed
devtools::install_github("AnalytixWare/ShinySky")
library(shinysky)
shinysky::run.shinysky.example()
```

# Usage

```r
library(shinysky)
```

## Action Buttons
```r
actionButton(inputId, label, styleclass = yourStyle)
```

Specify the style with the  styleclass argument. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 

## Alerts

### ui.R
```r
shinyalert(id, click.hide = TRUE, auto.close.after = NULL)
```

In the past clicking on the alert will hide it. Setting click.hide = FALSE can prevent this behaviour
The auto.close.after can take a number and will close the alert after this many seconds.

Simply provide an id. The alert will be hidden until you show it using _showshinyalert_ in server.R

### server.R
```r
showshinyalert(session,id,HTMLtext,styleclass)
```

Put some valid HTML in HTMLtext. Here you can specify the style you want using the styleclass parameter. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 

## Select2
The below will create a multiple select2 with "a", "b", "c" as choices
```r
select2Input("select2Input1","This is a multiple select2Input",choices=c("a","b","c"),selected=c("b","a"))
```

### Video Demo
<a href="http://www.youtube.com/watch?feature=player_embedded&v=9T4F-j76Vf0
" target="_blank"><img src="http://img.youtube.com/vi/9T4F-j76Vf0/0.jpg" 
alt="Video Demo" width="240" height="180" border="10" /></a>

## Typeahead Text Input
```r
textInput.typeahead(
    id="thti"
    ,placeholder="type 'name' or '2'"
    ,local=data.frame(name=c("name1","name2"),info=c("info1","info2"))
    ,valueKey = "name"
    ,tokens=c(1,2)
    ,template = HTML("<p class='repo-language'>{{info}}</p> <p class='repo-name'>{{name}}</p> <p class='repo-description'>You need to learn more CSS to customize this further</p>")
  )
```

## Busy Indicator
### ui.R

```r
busyIndicator(wait = 1000)
```

Here the wait determines how long to wait before showing the buys indicator. The default is wait=1000, which is one second. This is to prevent short computation triggering the busyIndicator.

## Events Buttons

```r
eventsButton(inputId, label, events = c("dblclick"))
```

This button will invalidate (dirty) upon the events. The event does not have to be a "click", in fact the default is dblclick. You can specify multiple events. For a list of event types See: http://api.jquery.com/category/events/mouse-events/

# Handsontable Input/Output
### ui.R

```r
hotable("hotable1")
```

This will create a handsontable which you can output using 

```r
output$hotable1 <- renderHotable({...})
```

### server.R

```r
something <- reactive({
	hot.to.df(input$hotable1) # this will convert your input into a data.frame
})
```
