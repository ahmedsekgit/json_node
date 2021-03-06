function copyToClipboard(element) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(element).text()).select();
    document.execCommand("copy");
    $temp.remove();
}

function pop_up(url) {
    window.open(url, 'win2', 'status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=1076,height=768,directories=no,location=no')
}

function split(val) {
    return val.split(/,\s*/);
}

function extractLast(term) {
    return split(term).pop();
}

function filterGlobal() {
    $('#my_table_sek').DataTable().search(
        $('#global_filter').val(),
        $('#global_regex').prop('checked'),
        $('#global_smart').prop('checked')
    ).draw();
}

function filterColumn(i) {
    $('#my_table_sek').DataTable().column(i).search(
        $('#col' + i + '_filter').val(),
        $('#col' + i + '_regex').prop('checked'),
        $('#col' + i + '_smart').prop('checked')
    ).draw();

}
function ref_search() {
   
        var form = $(this);


            var search_term = $("#search_link_term").val();
            /*var search_keyword=$("#search_link_keyword").val();*/
            var limit_sql = $("#limit_link_sql").val();
            var search_keyword = '';
             var test = $('#site_address_port').val() + '/ref_search';

            if (typeof(search_term.trim()) !== undefined) {
                $.ajax({
                    type: 'POST',
                    data: {
                        'search_term': search_term,
                        'search_keyword': search_keyword,
                        'limit_sql': limit_sql,
                    },
                    datatype: 'json',
                    url: $('#site_address_port').val() + '/ref_search',
                    success: function(data) {
                     
                        if(data.error == true) 
                        {
                            var error = $("#example_form_error");
                            error.css("color", "red");
                            error.html("Not " + data.msg + ". Please enter a different name.");
                      
                         } 
                         else 
                         {
                        
                         // $("#example_form_enter").hide();
                         $("#example_form_enter").show();
                         $("#example_form_error").hide();
                         $("#example_form_confirmation").show();
                        
                         var success = $("#example_form_success");
                         success.css("background-color", "black");
                         success.css("color", "white");
                         success.html("Success! You submitted the name " + data.name + ".");
                         success.html(" " + data.str_commands + " ");
                         }
                    }
                }); /*end ajax*/

                return false;
            } /*end if*/

    
}/*function ref_search()*/
$(document).ready(function() {
    console.log("ready!");

    $("#search_link_term").on('keyup click', function() {
        ref_search();
    });
    //    //autocomplete
    // $(".auto").autocomplete({
    // 	source: "keyword_search.php",
    // 	minLength: 0
    // });		

    var table = data_table_initialisation();

    $(document).tooltip({
        track: true
    });

    //pour datatables
    var lastIdx = null;


    $('input.global_filter').on('keyup click', function() {
        filterGlobal();
    });

    $('input.column_filter').on('keyup click', function() {
        filterColumn($(this).parents('tr').attr('data-column'));
    });

    $("#draggable").draggable();
    $("#date").datepicker();
    $("#table-container").resizable();

    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];

    $( "#tags_porcelaine" ).autocomplete({
      source: availableTags
    });

    // Multiple select
    $("#searchterm").autocomplete({
        source: function(request, response) {

            var searchText = extractLast(request.term);
            $.ajax({
                url: "test_fetch_data.php",
                type: 'post',
                dataType: "json",
                data: {
                    search: searchText
                },
                success: function(data) {
                    //alert("data");
                    //alert(data);
                    response(data);
                }
            });
        },
        select: function(event, ui) {
            var terms = split($('#multi_autocomplete').val());

            terms.pop();

            terms.push(ui.item.label);

            terms.push("");
            $('#multi_autocomplete').val(terms.join(", "));

            // Id
            terms = split($('#selectuser_ids').val());

            terms.pop();

            terms.push(ui.item.value);

            terms.push("");
            $('#selectuser_ids').val(terms.join(", "));

            return false;
        }

    }); //fin de lautocomplete multiple

    //$( "#date" ).datepicker();  
}); //fin de la fonction document ready

//$( "#date" ).datepicker(); 
function myFunction() {
    var element = document.body;
    element.classList.toggle("dark-mode");
}

function data_table_initialisation() {
    // create a data table
    let searched_keyword = "";
    if ((typeof $("#keywords_vals_id").val() !== 'undefined' && $("#keywords_vals_id").val() !== "" && $("#keywords_vals_id").val() !== null)) {
        searched_keyword = $("#keywords_vals_id").val();
    }
    searched_keyword = searched_keyword.trim();
    var table = $('#my_table_sek').DataTable({
        "oSearch": {
            "sSearch": searched_keyword?searched_keyword:""
        },
        scrollX: true,
        colResize: {
            isEnabled: true,
            hoverClass: 'dt-colresizable-hover',
            hasBoundCheck: true,
            minBoundClass: 'dt-colresizable-bound-min',
            maxBoundClass: 'dt-colresizable-bound-max',
            isResizable: function(column) {
                return column.idx !== 2;
            },
            onResize: function(column) {
                //console.log('...resizing...');
            },
            onResizeEnd: function(column, columns) {
                console.log('I have been resized!');
            }
        }
    }); /* fin de l initialisation de la table avec colsize */

    // add custom listener to draw event on the table
    table.on("draw", function() {
        // get the search keyword
        var keyword = $('#my_table_sek_filter > label:eq(0) > input').val();

        if (typeof keyword !== 'undefined' && keyword !== "" && keyword !== null) {
            // clear all the previous highlighting
            $('#my_table_sek_filter > label:eq(0) > input').val() = keyword.trim();
            
            $('#my_table_sek').find("span").each(function() {
                var text = $(this).text(); //get span content
                $(this).replaceWith(text); //replace all span with just content
            });

            $('#my_table_sek').unmark();

            // highlight the searched word
            $('#my_table_sek').mark(keyword, {});
        }
    }); /* fin de la table.on("draw",function() */


    $('input.global_filter').on('keyup click', function() {
        filterGlobal();
    });

    $('input.column_filter').on('keyup click', function() {

        var i = $(this).parents('tr').attr('data-column');

        filterColumn(i);

        var keyword = $('#col' + i + '_filter').val();

        if (typeof keyword !== 'undefined' && keyword !== "" && keyword !== null) {
            // clear all the previous highlighting

            $('#my_table_sek').find("span").each(function() {
                var text = $(this).text(); //get span content
                $(this).replaceWith(text); //replace all span with just content
            });

            $('#my_table_sek').unmark();

            // highlight the searched word
            $('#my_table_sek').mark(keyword, {});
        }

    }); /*fin de la  ('input.column_filter') */
    return table;
} /*fin de la function data_table_initialisation */