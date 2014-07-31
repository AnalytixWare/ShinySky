 Shiny.addCustomMessageHandler("shinyalerthandler", function(data) {
      var el = $('#' + data.id);
      var classes = el.attr('class').split(' ').filter(function(x) {
           return x.substring(0, 6) === "alert-"
      })

      classes.forEach(function(x) {
           el.removeClass(x)
      })
      
      
      if( data.show ){
        el.addClass(data["alert.css.style"]);
  
        el.addClass('in');
        el.html(data.HTMLtext);
        el.fadeIn();
      } else {
        el.removeClass('in');
        el.addClass('out');
        el.removeClass('fade');
        el.fadeOut();
      }

      //console.log(Number(el.data("auto-close-after")) * 1000); 

      if(el.data("auto-close-after") !== "") {
            setTimeout(function(el) {
              el.removeClass('in');
              el.addClass('out');
              el.removeClass('fade');
              el.fadeOut();
              },Number(el.data("auto-close-after")) * 1000, el)
      }
 });

 // input binding
 $(document).on('click', '.shinyalert', function() {
      var el = $(this);
      if(el.attr("click-hide") === "TRUE") {
            el.removeClass("in")
            el.removeClass('fade')
            el.addClass("out")
            el.fadeOut("slow")            
      }
 });