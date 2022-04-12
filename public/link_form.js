$(document).ready(function() {

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