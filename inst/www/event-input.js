var eventInputBinding = new Shiny.InputBinding();
$.extend(eventInputBinding, {
  find: function(scope) {
    return $(scope).find(".shinysky-eventinput");
  },
  getValue: function(el) {
    var elem = $(el)
    return {
      event: elem.data("shinysky-last-event"),
      event_count: elem.data("shinysky-event-count")
      //,tot_event_count: elem.data("shinysky-tot-event-count")
    }
  },
  subscribe: function(el, callback) {
    //figure out the events being monitored
    var elem = $(el)
    events = elem.data("shinysky-monitored-events").split(" ") //e.g. ["click", "dblclick", "hover"]

    events.map(function(x) {
      $(el).on(x + ".shinysky-eventinput", function(e) {
        // some code here to change the tags
        $(el).data("shinysky-last-event", x)
        $(el).data("shinysky-event-count", parseInt($(el).data("shinysky-event-count")) + 1)
        callback();
      });
    })
  },
  unsubscribe: function(el) {
    $(el).off(".shinysky-eventinput");
  }
});

Shiny.inputBindings.register(eventInputBinding);