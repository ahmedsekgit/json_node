var displayData = function(id) {
    //$('#table-container').load('update-form.php');
    $('#msg').load('display-form.php');

    $.ajax({
        type: "POST",
        url: "update-data.php",
        data: {
            displayId: id
        },
        dataType: "html",
        success: function(data) {
            let PREFIX = '<br> \"database.php\" Connection to database established successfully <br> <br>';
            let correct_data = data;
            correct_data = correct_data.replace(PREFIX, '');

            var userData = JSON.parse(correct_data);

            $("input[name='id']").val(userData.id);
            $("textarea[name='title']").val(userData.title);
            $("textarea[name='description']").val(userData.description);
            $('html, body').animate({
                scrollTop: $("#displayForm").offset().top
            }, 2000);

        }

    });
};

$(document).ready(function() {

    // Multiple select
    //$( "#search_term" ).autocomplete({ 
    $(".auto").autocomplete({
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
            //var terms = split( $('#search_term').val() );
            var terms = split($('.auto').val());

            terms.pop();

            terms.push(ui.item.label);

            terms.push("");
            //$('#search_term').val(terms.join( ", " ));
            $('.auto').val(terms.join(", "));

            // Id
            terms = split($('#selectuser_ids').val());

            terms.pop();

            terms.push(ui.item.value);

            terms.push("");
            $('#selectuser_ids').val(terms.join(", "));

            return false;
        }

    });

    $(document).on('submit', '#displayForm', function(e) {
        e.preventDefault();

        var id = $("input[name='id']").val();
        var title = $("textarea[name='title']").val();
        var description = $("textarea[name='description']").val();
        //var fullName= $("input[name='fullName']").val();
        //var emailAddress= $("input[name='emailAddress']").val();
        //var city= $("input[name='city']").val();
        //var country= $("input[name='country']").val();
        $.ajax({
            method: "POST",
            url: "update-data.php",
            data: {
                Search: 'Search',
                displayId: id
            },
            success: function(data) {

                var search_term = $("input[name='search_term']").val();
                $.ajax({
                    type: 'post',
                    url: 'get_search_results.php',
                    data: {
                        search: "search",
                        search_term: search_term
                    },
                    success: function(response) {
                        document.getElementById("result_div").innerHTML = response;

                        // create a data table
                        //create a data table
                        var search_key = "";
                        var search_key = $("#search_keyword").val();
                        var search_terms = search_key.split(/,\s*/);
                        //remove repeated values
                        uniq_search_terms = [...new Set(search_terms)];
                        //convert array to string  replace commas by spaces  
                        uniq_search_terms = uniq_search_terms.join(" ");

                        var search_default = [search_term, uniq_search_terms].join(" ");

                        var table = $('#my_table_sek').DataTable({
                            "oSearch": {
                                "sSearch": search_default
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
                        });


                        // add custom listener to draw event on the table
                        table.on("draw", function() {
                            // get the search keyword
                            var keyword = $('#my_table_sek_filter > label:eq(0) > input').val();

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
                        });

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

                        });
                    }
                });
                $('#msg').html(data);

            }
        });
        $('html, body').animate({
            scrollTop: $("#result_div").offset().top
        }, 2000);
    });

    // Add more
    $('#addmore').click(function() {

        // Get last id 
        var lastname_id = $('.tr_input input[type=text]:nth-child(1)').last().attr('id');
        var split_id = lastname_id.split('_');

        // New index
        var index = Number(split_id[1]) + 1;

        // Make row with HTML input elements
        var html = "<tr class='tr_input'><td><input type='text' class='productname' id='productname_" + index + "' placeholder='Enter productname'></td><td><input type='text' class='name' id='name_" + index + "' ></td><td><input type='text' class='sku' id='sku_" + index + "' ></td><td><input type='text' class='pcode' id='pcode_" + index + "' ></td><td><input type='text' class='price' id='price_" + index + "' ></td></tr>";

        // Append data
        $('tbody').append(html);

    });
});