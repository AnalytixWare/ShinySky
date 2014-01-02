ShinySky
========

Various UI widgets/components used by AnalytixWare's flaghship product e.g. alerts, styled buttons

![alt text](https://github.com/AnalytixWare/ShinySky/blob/master/screenshots/6.png?raw=true "Examples")


# Install
<div style="overflow:auto;"><div class="geshifilter"><pre class="r geshifilter-R" style="font-family:monospace;"><a href="http://inside-r.org/r-doc/utils/install.packages"><span style="color: #003399; font-weight: bold;">install.packages</span></a><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;devtools&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #666666; font-style: italic;">#if not alrady installed</span>
devtools<span style="">::</span>install_github<span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;ShinySky&quot;</span><span style="color: #339933;">,</span><span style="color: #0000ff;">&quot;AnalytixWare&quot;</span><span style="color: #009900;">&#41;</span>
<a href="http://inside-r.org/r-doc/base/require"><span style="color: #003399; font-weight: bold;">require</span></a><span style="color: #009900;">&#40;</span>shinysky<span style="color: #009900;">&#41;</span>
shinysky<span style="">::</span>run.shinysky.example<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span></pre></div></div><p><a href="http://www.inside-r.org/pretty-r" title="Created by Pretty R at inside-R.org">Created by Pretty R at inside-R.org</a></p>


# Usage

```
require(shinysky)
```

##Action Buttons

_actionButton(inputId, label, styleclass = yourStyle)_

Specify the style with the  styleclass argument. The possible styles are "primary", "info", "success", "warning", "danger", "inverse", "link", "" 

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

##Select2
The below will createa  multiple select2 with "a", "b", "c" as choices
<div style="overflow:auto;"><div class="geshifilter"><pre class="r geshifilter-R" style="font-family:monospace;">select2Input<span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;select2Input1&quot;</span><span style="color: #339933;">,</span><span style="color: #0000ff;">&quot;This is a multiple select2Input&quot;</span><span style="color: #339933;">,</span>choices=<a href="http://inside-r.org/r-doc/base/c"><span style="color: #003399; font-weight: bold;">c</span></a><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;a&quot;</span><span style="color: #339933;">,</span><span style="color: #0000ff;">&quot;b&quot;</span><span style="color: #339933;">,</span><span style="color: #0000ff;">&quot;c&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">,</span>selected=<a href="http://inside-r.org/r-doc/base/c"><span style="color: #003399; font-weight: bold;">c</span></a><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;b&quot;</span><span style="color: #339933;">,</span><span style="color: #0000ff;">&quot;a&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span></pre></div></div><p><a href="http://www.inside-r.org/pretty-r" title="Created by Pretty R at inside-R.org">Created by Pretty R at inside-R.org</a></p>

##Typeahead Text Input
<div style="overflow:auto;"><div class="geshifilter"><pre class="r geshifilter-R" style="font-family:monospace;">textInput.typeahead<span style="color: #009900;">&#40;</span>
    id=<span style="color: #0000ff;">&quot;thti&quot;</span>
    <span style="color: #339933;">,</span>placeholder=<span style="color: #0000ff;">&quot;type 'name' or '2'&quot;</span>
    <span style="color: #339933;">,</span><a href="http://inside-r.org/r-doc/base/local"><span style="color: #003399; font-weight: bold;">local</span></a>=<a href="http://inside-r.org/r-doc/base/data.frame"><span style="color: #003399; font-weight: bold;">data.frame</span></a><span style="color: #009900;">&#40;</span>name=<a href="http://inside-r.org/r-doc/base/c"><span style="color: #003399; font-weight: bold;">c</span></a><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;name1&quot;</span><span style="color: #339933;">,</span><span style="color: #0000ff;">&quot;name2&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">,</span>info=<a href="http://inside-r.org/r-doc/base/c"><span style="color: #003399; font-weight: bold;">c</span></a><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;info1&quot;</span><span style="color: #339933;">,</span><span style="color: #0000ff;">&quot;info2&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span>
    <span style="color: #339933;">,</span>valueKey = <span style="color: #0000ff;">&quot;name&quot;</span>
    <span style="color: #339933;">,</span>tokens=<a href="http://inside-r.org/r-doc/base/c"><span style="color: #003399; font-weight: bold;">c</span></a><span style="color: #009900;">&#40;</span><span style="color: #cc66cc;">1</span><span style="color: #339933;">,</span><span style="color: #cc66cc;">2</span><span style="color: #009900;">&#41;</span>
    <span style="color: #339933;">,</span>template = HTML<span style="color: #009900;">&#40;</span><span style="color: #0000ff;">&quot;&lt;p class='repo-language'&gt;{{info}}&lt;/p&gt; &lt;p class='repo-name'&gt;{{name}}&lt;/p&gt; &lt;p class='repo-description'&gt;You need to learn more CSS to customize this further&lt;/p&gt;&quot;</span><span style="color: #009900;">&#41;</span>
  <span style="color: #009900;">&#41;</span></pre></div></div><p><a href="http://www.inside-r.org/pretty-r" title="Created by Pretty R at inside-R.org">Created by Pretty R at inside-R.org</a></p>

##Events Buttons

_eventsButton(inputId, label, events = c("dblclick"))_

This button will invalidate (dirty) upon the events. The event does not have to be a "click", in fact the default is dblclick. You can specify multiple events. For a list of event types See: http://api.jquery.com/category/events/mouse-events/

# Example

```
shinysky::run.shinysky.example()
```

# Github

https://github.com/AnalytixWare/ShinySky

