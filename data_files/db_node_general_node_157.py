==============================
 Add table row in jQuery  
==============================
$('#myTable tr:last').after('<tr>...</tr><tr>...</tr>');  //OR  $('#myTable > tbody:last-child').append('<tr>...</tr><tr>...</tr>');
$('#myTable tr:last').after('<tr>...</tr>');
$('#someTableID tr:last').after('<tr><td>Some data here</td></tr>');
  
==============================
157 at  2021-10-29T15:22:52.000Z
==============================
