console.log("shinyalert.js loaded");

 Shiny.addCustomMessageHandler("shinyalerthandler", function(data) {
     var el = $('#' + data.id);
     var classes = el.attr('class').split(' ').filter(function(x) {
         return x.substring(0, 6) === "alert-"
     })

     classes.forEach(function(x) {
         el.removeClass(x)
     })

     el.addClass(data["alert.css.style"])

     el.addClass('in');
     el.html(data.HTMLtext);
     el.fadeIn();
     // setTimeout(function(el) {
     //   el.removeClass('in');
     //   el.addClass('out');
     //   el.removeClass('fade');
     //   el.fadeOut();
     //   },1000,el)
 });

 // input binding
 $(document).on('click', '.shinyalert', function() {
     var el = $(this);
     el.removeClass("in")
     el.removeClass('fade')
     el.addClass("out")
     el.fadeOut("slow")
 });