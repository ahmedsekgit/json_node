/*
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