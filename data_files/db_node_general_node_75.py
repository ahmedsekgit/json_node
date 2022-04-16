==============================
one solution to pass mutidimentional array between jquery php via json stringify  
==============================
Client side :

var data = {a:{'foo':'bar'},b:{'this':'that'}};
$.ajax({ url        : '/',
         type       : 'POST',                                              
         data       : {'data':JSON.stringify(data)},
         success    : function(){ }
       });

Server Side:

$data = json_decode($_POST['data']);
print_r($data);
// Result:
// Array( "a" => Array("foo"=> "bar"), "b" => Array("that" => "this"))
  
==============================
75 at  2021-10-29T15:22:52.000Z
==============================
