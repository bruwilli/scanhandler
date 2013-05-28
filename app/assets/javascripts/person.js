var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    if (ms) {
        timer = setTimeout(callback, ms);
    } else {
        timer = 0;
    }
  };
})();

var last_search_data = '';
var last_search_xhr = undefined;
var do_search = function(first_name, last_name) {
    if (first_name.length == 0 && last_name.length == 0) {
        if (last_search_xhr != undefined) {
            last_search_xhr.abort();
            last_search_xhr = undefined;
            last_search_data = '';
        }

        delay(false, 0);
        $('#person-search-results').html('')
        return;
    }

    var form = $("#person-search-form"); // grab the form wrapping the search bar.
    var form_data = form.serialize();
    if (form_data != last_search_data) {
        delay(function() {
            var url = form.attr('action'); // live_search action.   
            if (last_search_xhr != undefined) last_search_xhr.abort();
            last_search_data = form_data;
            last_search_xhr = $.get(url, form_data, function(html) { // perform an AJAX get
                last_search_xhr = undefined;
                $("#person-search-results").html(html); // replace the "results" div with the results
            }).fail(function(html) {
                last_search_data = '';
                last_search_xhr = undefined;
                $('#person-search-results').html(html)
            });
            $('#person-search-results').html($('#ajax_spinner').html());
            }, 300);
    }
};

var enable_add_new_person = function() {
    var add_new_button = $("#add_new_person_button");
    add_new_button.removeClass("disabled");
    var url = add_new_button.attr('base_path') + '?' + $('#person-search-form').serialize(); 
    add_new_button.attr('href', url);
    add_new_button.attr('title', 'Add this person')
};

var disable_add_new_person = function() {
    var add_new_button = $("#add_new_person_button");
    add_new_button.addClass("disabled");
    add_new_button.attr('href', '#');
    add_new_button.attr('title', 'Must specify person first/last name before adding')
};

$(document).ready(function() {
    $('#first_name, #last_name').bind("keyup", function() {
        var first_name_field = $("#first_name");
        var last_name_field = $("#last_name");
        $(this).val($.trim($(this).val()));
        if (first_name_field.val().length == 0 || 
            last_name_field.val().length == 0) {
            disable_add_new_person();
        } else {
            enable_add_new_person();
        }
        do_search(first_name_field.val(), last_name_field.val());
    }); 
    disable_add_new_person();
});

$(document).ready(function() {
    var today = new Date();
    $('#scan_scan_date').datepicker({dateFormat: 'yy/mm/dd', 
                                      defaultDate: today,
                                      maxDate: today,
                                      changeMonth: true,
                                      changeYear: true});
})