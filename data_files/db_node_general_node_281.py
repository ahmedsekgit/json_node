==============================
 Javascript change element class  
==============================
document.getElementById("myElementID").classList.add('myClassName');  document.getElementById("myElementID").classList.remove('myClassName');
document.getElementById("MyElement").classList.add('MyClass');  document.getElementById("MyElement").classList.remove('MyClass');  if ( document.getElementById("MyElement").classList.contains('MyClass') ) { document.getElementById("MyElement").classList.toggle('MyClass'); }
//Overwrite all classes element.className = "class";  //Add class element.classList.add("class");
Syntax: document.getElementById('myElement').className = "myclass";  <html>      <head>          <title>Change class of an element with javascript</title>          <style type="text/css">              .redbutton{                  background-color: red;              }              .greenbutton{                  background-color: green;              }          </style>          <script type="text/javascript">              function changeClass() {                  document.getElementById('clickme').className = "greenbutton";                  var new_class = document.getElementById('clickme').className;                  document.getElementById('classChange').innerHTML = "New Class Name : "                   + new_class;              }          </script>      </head>      <body>          <button class="redbutton" id="clickme" onclick="changeClass()"                      >Change Class</button><br>          <p id="classChange">Class Name: redbutton</p>      </body>  </html>
  
==============================
281 at  2021-10-29T15:22:52.000Z
==============================
