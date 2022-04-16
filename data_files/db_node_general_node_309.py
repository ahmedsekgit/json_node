==============================
 Javascript track mouse pointer  
==============================
var pointerX = -1; var pointerY = -1; document.onmousemove = function(event) { 	pointerX = event.pageX; 	pointerY = event.pageY; } setInterval(pointerCheck, 1000); function pointerCheck() { 	console.log('Cursor at: '+pointerX+', '+pointerY); }
// Cursor coordinate functions var myX, myY, xyOn, myMouseX, myMouseY; xyOn = true;  function getXYPosition(e) {     myMouseX = (e || event).clientX;     myMouseY = (e || event).clientY;     if (document.documentElement.scrollTop > 0) {         myMouseY = myMouseY + document.documentElement.scrollTop;     }     if (xyOn) {         alert("X is " + myMouseX + "\nY is " + myMouseY);     } } function toggleXY() {     xyOn = !xyOn;     document.getElementById('xyLink').blur();     return false; }     document.onmouseup = getXYPosition;
<p>Click in the div element below to get the x (horizontal) and y (vertical) coordinates of the mouse pointer, when it is clicked.</p>  <div onclick="showCoords(event)"><p id="demo"></p></div>  <p><strong>Tip:</strong> Try to click different places in the div.</p>  <script> function showCoords(event) {   var cX = event.clientX;   var sX = event.screenX;   var cY = event.clientY;   var sY = event.screenY;   var coords1 = "client - X: " + cX + ", Y coords: " + cY;   var coords2 = "screen - X: " + sX + ", Y coords: " + sY;   document.getElementById("demo").innerHTML = coords1 + "<br>" + coords2; } </script>
  
==============================
309 at  2021-10-29T15:22:52.000Z
==============================
