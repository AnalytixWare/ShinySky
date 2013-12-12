ShinySky
========

Various UI widgets/components used by AnalytixWare's flaghship product e.g. alerts, styled buttons

![alt text](https://github.com/AnalytixWare/ShinySky/blob/master/screenshots/4.png?raw=true "Examples")


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
```
shinyalert(id)
```

Simply provide an id. The alert will be hidden until you show it using _showshinyalert_ in server.R

### server.R
```
showshinyalert(id,HTMLtext,session,styleclass)
```

Put some valid HTML in HTMLtext. Here you can specify the style you want using the styleclass parameter. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 

##Typeahead Text Input
```
textinput.typeahead(
    id="thti"
    ,placeholder="type 'name' or '2'"
    ,local=data.frame(name=c("name1","name2"),info=c("info1","info2"))
    ,valueKey = "name"
    ,tokens=c(1,2)
    ,template = HTML("<p class='repo-language'>{{info}}</p> <p class='repo-name'>{{name}}</p> <p class='repo-description'>You need to learn more CSS to customize this further</p>")
  )
```
##Events Buttons

_eventsButton(inputId, label, events = c("dblclick"))_

This button will invalidate (dirty) upon the events. The event does not have to be a "click", in fact the default is dblclick. You can specify multiple events. For a list of event types See: http://api.jquery.com/category/events/mouse-events/

# Example

```
shinysky::run.shinysky.example()
```

# Github

https://github.com/AnalytixWare/ShinySky

