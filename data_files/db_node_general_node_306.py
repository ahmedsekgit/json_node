==============================
 Javascript stop setInterval  
==============================
var myInterval = setInterval(function(){console.log("mmk")}, 2000);    clearInterval(myInterval); //stop that interval
let myVar = setInterval(() => {console.log('bop'), 1000);  clearInterval(myVar);
clearInterval(interval)
let autoScroll = window.setInterval(() => {   if (window.scrollY >= document.getElementById('second-part').scrollHeight) {      clearInterval(autoScroll);   }    window.scrollBy(0, 10); }, 25);
 window.clearTimeout(yourTimer)
var refreshIntervalId = setInterval(fname, 10000); /* later */ clearInterval(refreshIntervalId); // See the docs for setInterval() and clearInterval()
  
==============================
306 at  2021-10-29T15:22:52.000Z
==============================
