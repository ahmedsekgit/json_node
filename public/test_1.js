var express = require('express');
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