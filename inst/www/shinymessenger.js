
var shinymessenger = new Shiny.InputBinding();
$.extend(shinymessenger, {
  find: function(scope) {
    return $(scope).find(".shinymessenger");
  },
  getValue: function(el) {    
    //console.log("wassup");
   return($(el).data("message"))

  },
  setValue: function(el, value) {
  },
  subscribe: function(el, callback) {
    $(el).on("send_message.shinymessenger", function(e) {      
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".shinymessenger");
  }
});
Shiny.inputBindings.register(shinymessenger);