==============================
 JavaScript that executes after page load  
==============================
//two ways of executing JS code after page is loaded, use "DOMContentLoaded" when able    document.addEventListener("DOMContentLoaded", function(){      //dom is fully loaded, but maybe waiting on images & css files  });    window.addEventListener("load", function(){      //everything is fully loaded, don't use me if you can use DOMContentLoaded  });
/* javascript function is executed after 5 seconds page was loaded */ window.onload = function() {    setTimeout(loadAfterTime, 5000) };    function loadAfterTime(){    document.getElementById("menu").style.display="block"; }
  
==============================
273 at  2021-10-29T15:22:52.000Z
==============================
