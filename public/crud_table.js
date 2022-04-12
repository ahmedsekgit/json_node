$(document).ready(function() {
    console.log("reading crud_table js file");
    $("p").click(function() {
        $(this).hide();
    });
    //data_table_initialisation ();

    var editId = 92;
    var data = {};
    data.title = "title";
    data.message = "message";

    $.ajax({
        type: 'POST',
        data: JSON.stringify(data),
        contentType: 'application/json',
        url: $('#site_address_port').val() + '/endpoint',
        success: function(data) {
            console.log('success');
            console.log(JSON.stringify(data));
        }
    });
    /*
     $.ajax({    
            type: "GET",
            url: '/edit/:'+editId, 
            //data:{id:editId},            
            dataType: "html",                  
            success: function(data){
              console.log("data");
              console.dir(data);
              let PREFIX = '<br> \"database.php\" Connection to database established successfully <br> <br>';
              let correct_data = data; 
              correct_data = correct_data.replace(PREFIX, '');

              var userData=JSON.parse(correct_data);  

              console.log("correct_data");
              console.dir(correct_data);
              //$("input[name='id']").val(userData.id);               
              //$("textarea[name='title']").val(userData.title);               
              //$("textarea[name='description']").val(userData.description);  

              $('html, body').animate({
                  scrollTop: $("#my_table_sek").offset().top
              }, 2000);  
                 
            }

        });
     */

}); /* fin de document ready */

$('#select_link').click(function(e) {
    e.preventDefault();
    console.log('select_link clicked');

    var data = {};
    data.title = "title";
    data.message = "message";

    $.ajax({
        type: 'POST',
        data: JSON.stringify(data),
        contentType: 'application/json',
        url: $('#site_address_port').val() + '/endpoint',
        success: function(data) {
            console.log('success');
            console.log(JSON.stringify(data));
        }
    });

});


function do_search() {
    var search_term = $("#search_term").val();
    $.ajax({
        type: 'post',
        url: 'get_update_search_results.php',
        data: {
            search: "search",
            search_term: search_term
        },
        success: function(response) {

            document.getElementById("result_div").innerHTML = response;

            // create a data table
            var table = $('#my_table_sek').DataTable({
                "oSearch": {
                    "sSearch": $("#search_term").val()
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
                //alert("keyword");
                //alert(keyword);

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

        } /* fin de success ajax  */
    }); /* fin de ajax  */
} /*fin de la function */


function data_table_initialisation() {
    // create a data table
    var searched_keyword = "";
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

        $('#my_table_sek_filter > label:eq(0) > input').val() = keyword.trim();

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
} /*fin de la function data_table_initialisation */