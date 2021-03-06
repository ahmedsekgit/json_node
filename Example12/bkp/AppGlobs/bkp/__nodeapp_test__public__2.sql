============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 1
============================================================
file: ajax_with_nodejs_express.js
============================================================
content: /*
------------------------html form -----------------------------------
<body>
    <form method="post" id="cityform">
        <button id="submitBtn" type="submit">Search Weather</button>
    </form> 
</body>
----------------------------------------------------------------------
*/

$("#cityform").submit(function(e) {
    e.preventDefault();
    $.ajax({
        url: "https://localhost:8443/getCity",
        type: "POST",
        data: {
            'city': 'pune',
            'country': 'India',
        },
        success: function(data) {
            console.log(data);
        }
    });
});



/*Post request should look like this, 
I'm calling some function as findCity, you don't have to use it.*/

app.post("/getCity", (req, res) => {
    var cityname = req.body.city;
    var country = req.body.country;
    city.findCity(cityname, country).then((cityID) => {
        res.status(200).send({
            cityID: '123'
        });
    }).catch((e) => {
        res.status(400).send(e);
    });
});

/*--------------Using javascript------------------------------*/
function makeRequest(method, url, data) {
    return new Promise(function(resolve, reject) {
        var xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.onload = function() {
            if (this.status >= 200 && this.status < 300) {
                resolve(xhr.response);
            } else {
                reject({
                    status: this.status,
                    statusText: xhr.statusText
                });
            }
        };
        xhr.onerror = function() {
            reject({
                status: this.status,
                statusText: xhr.statusText
            });
        };
        if (method == "POST" && data) {
            xhr.send(data);
        } else {
            xhr.send();
        }
    });
}

//POST example
var data = {
    "person": "john",
    "balance": 1.23
};
makeRequest('POST', "https://www.codegrepper.com/endpoint.php?param1=yoyoma", data).then(function(data) {
    var results = JSON.parse(data);
});


/* example with typeahead */
$('input.typeahead').on(1 'typeahead:selected', function(evt, item) {
    // do what you want with the item here

    console.log("alert item selected");
    console.dir(item);
    $("input.typeahead").focus();
})

$('input.typeahead').typeahead([{
    name: 'typeahead',
    valueKey: 'title',
    remote: {
        url: $('#site_address_port').val() + '/links/search?key=%QUERY',
        filter: function(parsedResponse) {
            return parsedResponse;
        }
    },
    limit: 1000,
    template: [
        '<p class="name">{{title}}</p>'
    ].join(''),
    engine: Hogan // download and include http://twitter.github.io/hogan.js/                                                               
}]);


$('#search-box').typeahead([{
    name: 'Search',
    valueKey: 'forename',
    remote: {
        url: 'searchPatient.do?q=%QUERY',
        filter: function(parsedResponse) {
            // parsedResponse is the array returned from your backend
            console.log(parsedResponse);

            // do whatever processing you need here
            return parsedResponse;
        }
    },
    template: [
        '<p class="name">{{forename}} {{surname}} ({{gender}} {{age}})</p>',
        '<p class="dob">{{dateOfBirth}}</p>'
    ].join(''),
    engine: Hogan // download and include http://twitter.github.io/hogan.js/                                                               
}]);


$('input.typeahead').typeahead({
    name: 'typeahead',
    remote: $('#site_address_port').val() + '/links/search?key=%QUERY',
    limit: 10
});


/*

         <% if(linkData_ajax.length!=0)
            { var i=1; 
            linkData_ajax.forEach(function(data)
                { %>
             
                <%=i; %>
               <%=data.title %>
               <% i++; })%>
         <% }%>   
*/
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 2
============================================================
file: autocomplete.js
============================================================
content: var displayData = function(id) {
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
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 3
============================================================
file: crud_arbre.txt
============================================================
content: nodeapp/
  |__controllers/
  |     |__create-controller.js
  |     |__read-controller.js
  |     |__update-controller.js
  |     |__delete-controller.js
  |__models/
  |     |__create-model.js
  |     |__read-model.js
  |     |__update-model.js
  |     |__delete-model.js
  |__routes/
  |     |__create-route.js
  |     |__read-route.js
  |     |__update-route.js
  |     |__delete-route.js
  |__views/
  |     |__crud-form.ejs
  |     |__create-table.ejs
  |__app.js
  |__database.js
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 4
============================================================
file: crud_form.js
============================================================
content: $(document).ready(function() {
    console.log("reading crud_form js file");

    var multipleFields = document.querySelectorAll('.auto-resize');
    for (var i = 0; i < multipleFields.length; i++) {

        multipleFields[i].addEventListener('input', autoResizeHeight, 0);
    }
    // auto resize multiple textarea
    function autoResizeHeight() {
        this.style.height = "auto";
        this.style.height = this.scrollHeight + "px";
        this.style.borderColor = "green";
    }

}); /* fin de document ready */
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 5
============================================================
file: crud_search.js
============================================================
content: $(document).ready(function() {
    console.log("reading crud_search js file");

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
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 6
============================================================
file: crud_table.js
============================================================
content: $(document).ready(function() {
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
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 7
============================================================
file: favicon.ico
============================================================
content:         h     (                                    ??? ??? ???   ???   ???   ??? ??? ??? 		??? ??? ??? ??? ??? ??? ??? 64. 971 <:4 =;6 =<6 ??? @>9 ##??? DD@ GF@ GGA HID HJE IKH FI{ JMy SWU TXV UXV UYW ZZU VZX WZY W[Y Z\X X\Y X\Z []Z Y][ [_] [`] ^a` _ca `cb AA??? `db EE??? dhf ehf dhh dhi eig fig FF??? eii EE??? mnh jnl knl jok mqo prm mro qus rvt swu sxt vxs txv z| |~ |???~ }??? ~??? ~?????? ~?????? ?????? ????????? ?????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ?????????                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      $$$$$$$$$$$$"0JSNPPPOOOOMMPP$EXA$$$$$$$$$$9\2W]-u||sH{||z$dDgZCn|o#v|t5eVOKhlskIXfIUTB=^QL>\@|| y|GYF/a$z|*88'y{,`>&[A&+5qp4()?_.b"$$%8rr4!$$$R8rr4i
6rr4m	7xw4 3<<:;~}4<<<1c44j???                  ???   ???  ???  ???  ???  ???  ????  ???  ???  ???  ???  
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 8
============================================================
file: link_form.js
============================================================
content: $(document).ready(function() {

    /*
    $('input.typeahead').typeahead({
    name: 'typeahead',
    remote: $('#site_address_port').val()+'/links/search?key=%QUERY',
    limit: 10
    });
    */
    $.ajax({
        type: 'POST',
        data: {
            'question': 'bonjour ceci est ma question pour endpoint',
        },
        datatype: 'json',
        url: $('#site_address_port').val() + '/links/endpoint',
        success: function(data) {
            console.log('success data from endpoint');
            console.log(data);
            /*console.log(JSON.stringify(data));*/
        }
    });
    $('input.typeahead').on('typeahead:selected', function(evt, item) {
        // do what you want with the item here
        alert("alert item selected");
        console.log("alert item selected");
        console.dir(item);
        $("input.typeahead").focus();
    })
    $('input.typeahead').typeahead([{
        name: 'typeahead',
        valueKey: 'title',
        remote: {
            url: $('#site_address_port').val() + '/links/search?key=%QUERY',
            filter: function(parsedResponse) {
                // parsedResponse is the array returned from your backend
                /*
                $("#typeahead_response").empty();
                document.getElementById('typeahead_response').innerHTML = parsedResponse;
                console.log(parsedResponse);*/

                // do whatever processing you need here
                return parsedResponse;
            }
        },
        limit: 1000,
        template: [
            '<p class="name">{{title}}</p>'
        ].join(''),
        engine: Hogan // download and include http://twitter.github.io/hogan.js/                                                               
    }]);


});

$('#search-box').typeahead([{
    name: 'Search',
    valueKey: 'forename',
    remote: {
        url: 'searchPatient.do?q=%QUERY',
        filter: function(parsedResponse) {
            // parsedResponse is the array returned from your backend
            console.log(parsedResponse);

            // do whatever processing you need here
            return parsedResponse;
        }
    },
    template: [
        '<p class="name">{{forename}} {{surname}} ({{gender}} {{age}})</p>',
        '<p class="dob">{{dateOfBirth}}</p>'
    ].join(''),
    engine: Hogan // download and include http://twitter.github.io/hogan.js/                                                               
}]);
/*

         <% if(linkData_ajax.length!=0)
            { var i=1; 
            linkData_ajax.forEach(function(data)
                { %>
             
                <%=i; %>
               <%=data.title %>
               <% i++; })%>
         <% }%>   
*/
$('test_input.global_filter').on('keyup click', function() {
    filterGlobal();
});
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 9
============================================================
file: links_list.js
============================================================
content: $(document).ready(function() {

    function delay(fn, ms) {
        let timer = 0
        return function(...args) {
            clearTimeout(timer)
            timer = setTimeout(fn.bind(this, ...args), ms || 0)
        }
    }
    function countOccurences(string, word) 
    {
        return string.split(word).length - 1;
    }
    function countIncludes(string, substring) 
    {
        return (string.includes(substring))?1:0;
    }
    $('#search_link_keyword').keyup(delay(function(e) {

        /*console.log('Time elapsed!', this.value);*/
        
        var el = document.getElementById("search_link_keyword");

        var val_search = $('#search_link_keyword').val().trim();

            val_search_0 = '   faefe  efaef     afaf   fefgdgdg     ergg         grgrgg  ';
            val_search_1 = val_search_0.replace(/\s+/g, ' ').trim();
       
        var arrValSearch = val_search.split(" ").map(item => item.trim());
        arrValSearch = arrValSearch.filter(
                        function(el) {
                            if(el != "" )
                            {
                                return el != null;
                            }
                        });

        /*console.log(arrValSearch);return;*/
         
        var divsToHide = document.getElementsByClassName("link_div_bobnamespringsummer"); //divsToHide is an array

        for (var i = 0; i < divsToHide.length; i++) {
            $('#' + divsToHide[i].id).show();

        }

        var divsToHide = document.getElementsByClassName("link_div_bobnamespringsummer"); //divsToHide is an array
        for (var i = 0; i < divsToHide.length; i++) {
            var needed_text = divsToHide[i].children[3].innerText;
            /*divsToHide[i].style.visibility = "hidden"; */
            var occurences_in = 0;
            for (var k = 0; k < arrValSearch.length; k++) 
                {
                    occurences_in += countIncludes(needed_text.toLowerCase(),arrValSearch[k].toLowerCase());
                }
                /*var index = needed_text.indexOf(arrValSearch[k]);*/
                /*if (index !== -1) {*/
                if(occurences_in == arrValSearch.length)    
                {
                    $('#' + divsToHide[i].id).show();
                } else {
                    $('#' + divsToHide[i].id).hide();
                }
            
        }

    }, 200));

    $.ajax({
        type: 'POST',
        data: {
            'search_term': 'node django',
            'search_keyword': 'node replace',
            'limit_sql': 10,
        },
        datatype: 'json',
        url: $('#site_address_port').val() + '/links/search_link_ajax',
        success: function(data) {
            /*
            console.log('success data from links/search_link_ajax');
            console.log(data);*/
            /*console.log(JSON.stringify(data));*/
        }
    }); /*end ajax*/
    // Link to open the dialog
     $('#dialog-link.dialog_div').on('keyup click', function() {
        /*console.dir($(this));*/
        var div_span_id = $(this).find("span").attr('id');
        /*alert(div_span_id);*/
        $("#dialog_div_"+div_span_id).dialog("open");
     });
     /*
    $("#dialog-link").click(function(event) {
        alert('mess');
        /*id=dialog_div_<%=data.id%> */
       /*
        console.dir($(this));
        return;
        $("#dialog").dialog("open");
        event.preventDefault();
    });
    */
    $(".dialog_div_links").dialog({
            autoOpen: false,
            width: 400,
            buttons: [{
                    text: "Ok",
                    click: function() {
                        $(this).dialog("close");
                    }
                },
                {
                    text: "Cancel",
                    click: function() {
                        $(this).dialog("close");
                    }
                }
            ]
        });

}); /*end document ready*/


/*
function delay(callback, ms) {
  var timer = 0;
  return function() {
    var context = this, args = arguments;
    clearTimeout(timer);
    timer = setTimeout(function () {
      callback.apply(context, args);
    }, ms || 0);
  };
}
*/


function copyToClipboard(element) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(element).text()).select();
    document.execCommand("copy");
    $temp.remove();
}

function do_search() {


    var search_term = $("#search_link_term").val();
    /*var search_keyword=$("#search_link_keyword").val();*/
    var limit_sql = $("#limit_link_sql").val();
    var search_keyword = '';

    if (typeof(search_term.trim()) !== undefined) {
        $.ajax({
            type: 'POST',
            data: {
                'search_term': search_term,
                'search_keyword': search_keyword,
                'limit_sql': limit_sql,
            },
            datatype: 'json',
            url: $('#site_address_port').val() + '/links/search_link_ajax',
            success: function(data) {
                /*var nb_showed_div =$('#main-div .specific-class').length*/

                /*otherwise in VanillaJS (from IE8 included) you may use  */

                var nb_showed_div = document.querySelectorAll('#main_div_bobnamespringsummer .link_div_bobnamespringsummer').length;
                var str_ids = data[0].selected_link_ids;
                var arr_ids = str_ids.split(',');

                var divsToHide = document.getElementsByClassName("link_div_bobnamespringsummer"); //divsToHide is an array
                for (var i = 0; i < divsToHide.length; i++) {
                    /*divsToHide[i].style.visibility = "hidden"; */
                    $('#' + divsToHide[i].id).show();
                }

                if (data[0].selected_link_ids || data[0].selected_link_ids.length !== 0) {
                    var divsToHide = document.getElementsByClassName("link_div_bobnamespringsummer"); //divsToHide is an array

                    for (var i = 0; i < divsToHide.length; i++) {
                        /*divsToHide[i].style.visibility = "hidden"; */
                        $('#' + divsToHide[i].id).hide();
                    }
                    for (var i = 0; i < arr_ids.length; i++) {
                        /*console.log("link_div_");
                        console.dir('#link_div_'+arr_ids[i]);*/
                        $('#link_div_' + arr_ids[i]).show();
                    }

                }

                console.log('success data from links/search_link_ajax');
                console.dir(data);
                /*document.getElementById("result_div").innerHTML=JSON.stringify(data);*/
                /*var keyword = $('#col'+i+'_filter').val();*/
                /*console.log(JSON.stringify(data));*/
            }
        }); /*end ajax*/

        return false;
    } /*end if*/
}
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 10
============================================================
file: magic.js
============================================================
content: $(document).ready(function() {
    $("form#changeQuote").on('submit', function(e) {
        e.preventDefault();
        var data = $('input[name=quote]').val();
        console.log("data:", data);
        console.dir(data);

        $.ajax({
                type: 'post',
                url: '/ajax',
                data: data,
                dataType: 'text'
            })
            .done(function(data) {
                console.log("data:", data);
                console.dir(data);

                $('h1').html(data.quote);
            });
    });
});
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 11
============================================================
file: main.js
============================================================
content: function copyToClipboard(element) {
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
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 12
============================================================
file: prettier_demo.js
============================================================
content: < !DOCTYPE html >
    <
    html >
    <
    head >
    <
    meta charset = "utf-8" >
    <
    meta name = "viewport"
content = "width=device-width" >
    <
    script src = "https://unpkg.com/prettier/standalone.js" > < /script> <
    script src = "https://unpkg.com/@prettier/plugin-php/standalone.js" > < /script> <
    title > Prettier PHP Plugin < /title> <
    /head> <
    body >
    <
    textarea id = "input"
placeholder = "Unformatted input" > & lt; ? php
array_map(function($arg1, $arg2) use($var1, $var2) {
    return $arg1 + $arg2 / ($var + $var2);
}, array("complex" => "code", "with" => "inconsistent", "formatting" => "is", "hard" => "to", "maintain" => true)); < /textarea> <
textarea id = "output"
placeholder = "Prettified output"
readonly > < /textarea>

    <
    script >
    function format() {
        try {
            output.value = prettier.format(input.value, {
                plugins: prettierPlugins,
                parser: "php"
            });
        } catch (error) {
            output.value = error;
        }
    }

format();
input.oninput = format; <
/script> <
/body> <
/html>
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 13
============================================================
file: test_1.js
============================================================
content: var express = require('express');
var app = express.createServer();

app.use(express.bodyParser());

/*app.get('/endpoint', function(req, res){
	var obj = {};
	obj.title = 'title';
	obj.data = 'data';
	
	console.log('params: ' + JSON.stringify(req.params));
	console.log('body: ' + JSON.stringify(req.body));
	console.log('query: ' + JSON.stringify(req.query));
	
	res.header('Content-type','application/json');
	res.header('Charset','utf8');
	res.send(req.query.callback + '('+ JSON.stringify(obj) + ');');
});*/

app.post('/endpoint', function(req, res) {
    var obj = {};
    console.log('body: ' + JSON.stringify(req.body));
    res.send(req.body);
});


app.listen(3000);

$(function() {
    $('#select_link').click(function(e) {
        e.preventDefault();
        console.log('select_link clicked');

        /*$.ajax({
             dataType: 'jsonp',
             data: "data=yeah",            
             jsonp: 'callback',
             url: $('#site_address_port').val()+'/endpoint?callback=?',           
             success: function(data) {
                 console.log('success');
                 console.log(JSON.stringify(data));
             }
         });*/

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

        /*$.ajax($('#site_address_port').val()+'/endpoint', {
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json',
                success: function() { console.log('success');},
                error  : function() { console.log('error');}
        });*/
    });
});
============================================================


============================================================
path : __home__sea__nodeapp_test__public__
============================================================
============================================================
id: 14
============================================================
file: update-ajax.js
============================================================
content: var editData = function(id) {
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
============================================================


