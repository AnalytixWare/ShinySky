//input binding
var jscolor = new Shiny.InputBinding();
$.extend(jscolor, {
  find: function(scope) {
    return $(scope).find("input.color");
  },
  getValue: function(el) {
    return $(el).val()
  },
  subscribe: function(el, callback) {
    $(el).on("afterChange", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off("input.color");
  }
});
Shiny.inputBindings.register(jscolor);