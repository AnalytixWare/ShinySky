//input binding for jstree
var ss_jstree = new Shiny.InputBinding();
$.extend(ss_jstree, {
  find: function(scope) {
    return $(scope).find(".ss-jstree");
  },
  getValue: function(el) {
    var tree = $(el).jstree();
    var leaves = tree.get_selected()

    var i, j, r = [];
    for (i = 0, j = leaves.length; i < j; i++) {
      r.push(tree.get_node(leaves[i]).text);
    }
    return r;

  },
  setValue: function(el, value) {},
  subscribe: function(el, callback) {
    $(el).on("changed.jstree", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".ss_jstree");
  }
});
Shiny.inputBindings.register(ss_jstree);