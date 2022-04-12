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

$(document).ready(function() {
    console.log("ready!");


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