var editData = function(id) {
    //$('#table-container').load('update-form.php');
    $('#msg').load('update-form.php');

    $.ajax({
        type: "GET",
        url: "update-data.php",
        data: {
            editId: id
        },
        dataType: "html",
        success: function(data) {

            let PREFIX = '<br> \"database.php\" Connection to database established successfully <br> <br>';
            let correct_data = data;
            correct_data = correct_data.replace(PREFIX, '');
            //alert("correct_data");
            //alert(typeof correct_data);
            //alert(correct_data);

            var userData = JSON.parse(correct_data);

            //alert("userData id = ");		
            //alert(userData.id);

            //alert("userData title = ");   
            //alert(userData.title);

            //alert("userData description = ");   
            //alert(userData.description);

            $("input[name='id']").val(userData.id);
            $("textarea[name='title']").val(userData.title);
            $("textarea[name='description']").val(userData.description);

            $('html, body').animate({
                scrollTop: $("#updateForm").offset().top
            }, 2000);

            //$("input[name='fullName']").val(userData.fullName);
            //$("input[name='emailAddress']").val(userData.emailAddress);
            //$("input[name='city']").val(userData.city);
            //$("input[name='country']").val(userData.country);

        }

    });
};

var deleteData = function(id, search_term) {
    let transmitted_search_term = JSON.stringify(search_term);

    var confirmation_1 = confirm("Want to delete?");
    if (confirmation_1) {

        var confirmation_2 = confirm("are you sure Want to delete?");

        if (confirmation_2) {

            $.ajax({
                type: "GET",
                url: "update-data.php",
                data: {
                    deleteData: id
                },
                dataType: "html",
                success: function(response) {

                    var search_term_val = $("#search_term").val();

                    $.ajax({
                        type: 'post',
                        url: 'get_update_search_results.php',
                        data: {
                            search: "search",
                            search_term: search_term_val,
                            delete_flag: "delete_func"
                        },
                        success: function(response) {

                            document.getElementById("result_div").innerHTML = response;

                            // create a data table
                            var table = $('#my_table_sek').DataTable({
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


                            var maxLength = 100;
                            $(".show-read-more").each(function() {
                                //dabord on enleve les span et les mark js
                                $('#my_table_sek').find("span").each(function() {
                                    var text = $(this).text(); //get span content
                                    $(this).replaceWith(text); //replace all span with just content
                                });

                                $('#my_table_sek').unmark();

                                var myStr = $(this).text();

                                if ($.trim(myStr).length > maxLength) {
                                    var newStr = myStr.substring(0, maxLength);
                                    var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
                                    $(this).empty().html(newStr);
                                    $(this).append(' <a href="javascript:void(0);" class="read-more">read more...</a>');
                                    $(this).append('<span class="more-text">' + removedStr + '</span>');
                                }
                            });
                            $(".read-more").click(function() {
                                $(this).siblings(".more-text").contents().unwrap();
                                $(this).remove();
                            });


                        } //success get_update_searc..
                    }); //ajax get update search results


                } //success delete in update data file..
            }); //ajax de delete  
        } //deuxieme confirm
    } //premiere confirm


}; //fin de la var delete data
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


$(document).on('submit', '#updateForm', function(e) {
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
            updateId: id,
            title: title,
            description: description
            //fullName:fullName,
            //emailAddress:emailAddress,
            //city:city,
            //country:country

        },
        success: function(data) {
            //alert("data");
            //alert(data);
            var search_term = $("input[name='search_term']").val();
            //alert("search_term");
            //alert(search_term);
            $.ajax({
                type: 'post',
                url: 'get_update_search_results.php',
                data: {
                    search: "search",
                    search_term: search_term
                },
                success: function(response) {
                    //alert("response");
                    //alert(response);
                    console.log(response);
                    document.getElementById("result_div").innerHTML = response;

                    // create a data table
                    var table = $('#my_table_sek').DataTable();

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
});