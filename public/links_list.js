$(document).ready(function() {

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
    /*
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
            *//*
            console.log('success data from links/search_link_ajax');
            console.log(data);
            console.log(JSON.stringify(data));
        }
    }); 
    */
    /*end ajax*/
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