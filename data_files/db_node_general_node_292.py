==============================
 Javascript get text input value  
==============================
var inputValue = document.getElementById("myTextInputID").value;  
<!DOCTYPE html> <html lang="en"> <head> <meta charset="utf-8"> <title>Get Text Input Field Value in JavaScript</title> </head> <body>     <input type="text" placeholder="Type something..." id="myInput">     <button type="button" onclick="getInputValue();">Get Value</button>          <script>         function getInputValue(){             // Selecting the input element and get its value              var inputVal = document.getElementById("myInput").value;                          // Displaying the value             alert(inputVal);         }     </script> </body> </html>
<!-- for simplicity's sake, I have the js code and html in the same file --> <!-- if you want to, you can add the js in another file and make a <script> tag and link it up to the html file -->  <html lang="en"> <head> <meta charset="utf-8"> <title>Get Text Input Field Value in JavaScript</title> </head> <body>     <input type="text" placeholder="Type something..." id="myInput">     <button type="button" onclick="getInputValue();">Get Value</button>          <script>         function getInputValue(){             // Selecting the input element and get its value              var inputVal = document.getElementById("myInput").value;                          // Displaying the value             alert(inputVal);         }     </script> </body> </html>
  
==============================
292 at  2021-10-29T15:22:52.000Z
==============================
