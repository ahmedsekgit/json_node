==============================
 Javascript Http Get Request  
==============================
const Http = new XMLHttpRequest(); const url='https://jsonplaceholder.typicode.com/posts'; Http.open("GET", url); Http.send();  Http.onreadystatechange = (e) => {   console.log(Http.responseText) }
// Use these functions:  function _GET_REQUEST(url, response) {   var xhttp;   if (window.XMLHttpRequest) {     xhttp = new XMLHttpRequest();   } else {     xhttp = new ActiveXObject("Microsoft.XMLHTTP");   }    xhttp.onreadystatechange = function() {     if (this.readyState == 4 && this.status == 200) {       response(this.responseText);     }   };    xhttp.open("GET", url, true);   xhttp.send(); }  function _POST_REQUEST(url, params, response) {   var xhttp;   if (window.XMLHttpRequest) {     xhttp = new XMLHttpRequest();   } else {     xhttp = new ActiveXObject("Microsoft.XMLHTTP");   }    xhttp.onreadystatechange = function() {     if (this.readyState == 4 && this.status == 200) {       response(this.responseText);     }   };    xhttp.open("POST", url, true);   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");   xhttp.send(params); }   // Use like: _GET_REQUEST('http://url.com', (response) => { 	// Do something with variable response   	console.log(response); }); _POST_REQUEST('http://url.com', 'parameter=sometext', (response) => { 	// Do something with variable response   	console.log(response); });
function httpGetAsync(url, callback) {   var xmlHttp = new XMLHttpRequest();   xmlHttp.onreadystatechange = function() {      if (xmlHttp.readyState == 4 && xmlHttp.status == 200)       callback(xmlHttp.responseText);   }   xmlHttp.open("GET", url, true); // true for asynchronous    xmlHttp.send(null); }
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
xhr.open(Method, URL[, Async]); JavaScriptCopy
const xhr = new XMLHttpRequest(); JavaScriptCopy
  
==============================
275 at  2021-10-29T15:22:52.000Z
==============================
