ShinySky
========

Various UI widgets/components used by AnalytixWare's flaghship product e.g. alerts, styled buttons

![alt text](https://github.com/AnalytixWare/ShinySky/blob/master/screenshots/7.png?raw=true "Examples")


# Install
```s
install.packages("devtools")#if not alrady installed
devtools::install_github("ShinySky","AnalytixWare")
require(shinysky)
shinysky::run.shinysky.example()
```


# Usage

```s
require(shinysky)
```

##Action Buttons
```s
actionButton(inputId, label, styleclass = yourStyle)
```

Specify the style with the  styleclass argument. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 

##Alerts

### ui.R
```s
shinyalert(id, click.hide = TRUE, auto.close.after = NULL)
```

In the past clicking on the alert will hide it. Setting click.hide = FALSE can prevent this behaviour
The auto.close.after can take a number and will close the alert after this many seconds.

Simply provide an id. The alert will be hidden until you show it using _showshinyalert_ in server.R

### server.R
```s
showshinyalert(session,id,HTMLtext,styleclass)
```

Put some valid HTML in HTMLtext. Here you can specify the style you want using the styleclass parameter. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 

##Select2
The below will create a multiple select2 with "a", "b", "c" as choices
```s
select2Input("select2Input1","This is a multiple select2Input",choices=c("a","b","c"),selected=c("b","a"))
```

###Video Demo
<a href="http://www.youtube.com/watch?feature=player_embedded&v=9T4F-j76Vf0
" target="_blank"><img src="http://img.youtube.com/vi/9T4F-j76Vf0/0.jpg" 
alt="Video Demo" width="240" height="180" border="10" /></a>

##Typeahead Text Input
```s
textInput.typeahead(
    id="thti"
    ,placeholder="type 'name' or '2'"
    ,local=data.frame(name=c("name1","name2"),info=c("info1","info2"))
    ,valueKey = "name"
    ,tokens=c(1,2)
    ,template = HTML("<p class='repo-language'>{{info}}</p> <p class='repo-name'>{{name}}</p> <p class='repo-description'>You need to learn more CSS to customize this further</p>")
  )
```

##Busy Indicator
###ui.R

```s
busyIndicator(wait = 1000)
```

Here the wait determines how long to wait before showing the buys indicator. The default is wait=1000, which is one second. This is to prevent short computation triggering the busyIndicator.

##Events Buttons

```s
eventsButton(inputId, label, events = c("dblclick"))
```

This button will invalidate (dirty) upon the events. The event does not have to be a "click", in fact the default is dblclick. You can specify multiple events. For a list of event types See: http://api.jquery.com/category/events/mouse-events/

#Handsontable Input/Output
###ui.R

```s
hotable("hotable1")
```

This will create a handsontable which you can output using 

```s
output$hotable1 <- renderHotable({...})
```

###server.R

```s
something <- reactive({
	hot.to.df(input$hotable1) # this will convert your input into a data.frame
})
```

#jsTree
###ui.R

```s
jstree("jstree1",with(tags,ul(li("empty_folder"),li("folder1",ul(li("file1"),li("file2"))))))
```

###server.R
```s
observe({
	print(paste0(input$jstree1,collapse=", "))
})

```

#jscolorInput
##ui.R

```s
jscolorInput("jscolorInput1")
```

![alt text](https://github.com/AnalytixWare/ShinySky/blob/master/screenshots/jscolor.png?raw=true "jscolorInput")

# Example

```s
shinysky::run.shinysky.example()
```

or to run individual examples. You can use for example

```s
n = "2"
shinysky::run.shinysky.example(n)
```


# Install
To istall a github package you need the `devtools` package installed.  If you do not have the `devtools` package installed, run this first
```s
install.packages(devtools)
```

If you already have the `devtools` package installed, simply run

```s
devtools::install_github("shinysky","analytixware")
```


