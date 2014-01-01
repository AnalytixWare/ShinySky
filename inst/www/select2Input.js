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
    choices = data.choices
    selected = data.selected
    id = data.id
    label = data.label //not used yet
    el = $("#" + id).select2("val", selected)
  })