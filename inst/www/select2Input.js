var select2InputBinding = new Shiny.InputBinding();
$.extend(select2InputBinding, {
  find: function(scope) {
    return $(scope).find(".shinysky-select2Input");
  },
  getValue: function(el) {
    var elem = $(el)
    return elem.select2("val")
  },
  subscribe: function(el, callback) {
    //figure_out the events being monitored
    var elem = $(el)
    elem.on("change.shinysky-select2Input", function() {
      callback()
    })
  },
  unsubscribe: function(el) {
    $(el).off(".shinysky-select2Input");
  }
});

Shiny.inputBindings.register(select2InputBinding);

// custom handler
Shiny.addCustomMessageHandler("updateShinySkySelect2", function(data) {
  
  var choices = data.choices
  var id = data.id
  $("#" + id)
    .select2({width:'resolve',tags:choices})
  if (typeof data.selected === "string") {
    var selected = [data.selected]
  } else {
    var selected = data.selected
  }
  
  var label = data.label //not used yet
  var el = $("#" + id).select2("val", selected)
})