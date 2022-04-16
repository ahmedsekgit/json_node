==============================
How to access JSON object, 2 dimensional and single arrays at the same time in AJAX?  
==============================


PHP file returns json_encode data and possible to view on jquery as follows. Now i want to display PHP if condition else part (When no record found from the table) on jquery. How to do it?

PHP function

if($query->num_rows()){
    echo(json_encode($query->result()));
    //returns
    //[{"id":"24","content":"maths","email":"samplestudent@gmail.com"}]
} 
else {            
    $response["error"] = 1;
    $response["error_msg"] = "NO records found";
    echo json_encode($response);
    //returns  
    //{"error":1,"error_msg":"NO records found"}
}

Jquery

$.ajax({
  url: ajaxUrl,
  dataType: "JSON",
  type: "POST",
  success: function(retdata) {        
      $.each(retdata, function(i) {
         $("#main_div").append(retdata[i].email + '<br>');
      });
  }
});


Answers 1



PHP:

if($query->num_rows()){
    echo(json_encode($query->result()));
}else {
    header("HTTP/1.0 204 No Content");          
    echo json_encode($response);
}

Javascript:

$.ajax({
    url: ajaxUrl,
    dataType: "JSON",
    type: "POST",
    statusCode: {
        200: function() {
            // Code when records are found
        },
        201: function() {
            // Code when records are not found
        }
    },
});
$.ajax({
    type: 'POST',
    url: '../form-response-second-form.php',
    data: ajaxData,
    dataType: 'json',
    success: function (data) { }
  
==============================
76 at  2021-10-29T15:22:52.000Z
==============================
