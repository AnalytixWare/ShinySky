// function to update typeahead
function update_typeahead(id, dataset, valueKey, tokens, template, limit, placeholder) {
  limit = typeof limit !== 'undefined' ? limit : 20;

  var el = $("[data-name='" + id + "']");

  // dataset is in the form of object of arrays, need to convert it to an array of objects
  var obj_of_arr = dataset
  // parse an object of arrays into array of object
  var keys = Object.keys(obj_of_arr) // obtain the keys     
  var arr_of_obj = []
  if (typeof obj_of_arr[keys[0]] === "object") {
    var l = obj_of_arr[keys[0]].length
    for (var i = 0; i < l; i++) {
      var tmpobj = {}
      keys.map(function(key) {
        tmpobj[key] = obj_of_arr[key][i]
      })
      if (typeof tokens[i] === "string") {
        tokens[i] = [tokens[i], tmpobj[valueKey]]       
        tmpobj["tokens"] = tokens[i]
      } else {
        tokens[i].push(tmpobj[valueKey])
        tmpobj["tokens"] = tokens[i]
      }
      arr_of_obj.push(tmpobj)
    }
  }  

  //remove previous settings
  el.typeahead("destroy")

  // new typeahead
  el.typeahead({
    local: arr_of_obj,
    valueKey: valueKey,
    template: template,
    engine: Hogan,
    limit: limit
  })

  // update the placeholder text
  el.attr("placeholder", placeholder)
} 

Shiny.addCustomMessageHandler("update_textInput_typeahead", function(data) {
  update_typeahead(data.id, data.dataset, data.valueKey, data.tokens, data.template, data.limit, data.placeholder)
});

// Typeahead Text input Binding
var textInput_typeahead_Binding = new Shiny.InputBinding();
$.extend(textInput_typeahead_Binding, {
  find: function(scope) {
    return $(scope).find('.typeahead');
  },
  getId: function(el) {
    return $(el).data("name");
  },
  getValue: function(el) {
    ell = el
    //return $(el).parent().find("span:not([class])").text();
    return $(el).val()
  },
  setValue: function(el, value) {
    el.value = value;
  },
  subscribe: function(el, callback) {
    $(el).on('typeahead:selected typeahead:autocompleted typeahead:closed', function(obj, datum) {      
        if(obj.type === "typeahead:closed") {
          if ($(el).val() === "") {
            callback(true);
          }
        } else {
          callback(true);  
        }        
    })
  },
  unsubscribe: function(el) {
    $(el).off('.typeahead');
  },
  receiveMessage: function(el, data) {
    if (data.hasOwnProperty('value'))
      this.setValue(el, data.value);

    if (data.hasOwnProperty('label'))
      $(el).parent().find('label[for=' + el.id + ']').text(data.label);

    $(el).trigger('change');
  },
  getState: function(el) {
    return {
      label: $(el).parent().find('label[for=' + el.id + ']').text(),
      value: el.value
    };
  },
  getRatePolicy: function() {
    return {
      policy: 'debounce',
      delay: 250
    };
  }
});
Shiny.inputBindings.register(textInput_typeahead_Binding, 'shinysky.textInput_typeahead');