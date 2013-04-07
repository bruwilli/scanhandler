var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

var last_search_data = "";
var last_search_xhr = undefined;
var do_search = function() {
    var form = $("#person-search-form"); // grab the form wrapping the search bar.
    var form_data = form.serialize();
    if (form_data != last_search_data) {
        delay(function() {
            var url = form.attr('action'); // live_search action.   
            if (last_search_xhr != undefined) last_search_xhr.abort();
            last_search_xhr = $.get(url, form_data, function(html) { // perform an AJAX get
                    last_search_data = form_data;
                    last_search_xhr = undefined;
                    $("#person-search-results").html(html); // replace the "results" div with the results
                }).fail(function() {});
            }, 300);
    }
};

$(document).ready(function() {
    $("#first_name,#last_name").bind("keyup", function() {
      do_search();
    }); 
});