==============================
 Javascript run code after page load  
==============================
//two ways of executing JS code after page is loaded, use "DOMContentLoaded" when able    document.addEventListener("DOMContentLoaded", function(){      //dom is fully loaded, but maybe waiting on images & css files  });    window.addEventListener("load", function(){      //everything is fully loaded, don't use me if you can use DOMContentLoaded  });
<body onload="script();"> <!-- will call the function script when the body is load -->
  
==============================
305 at  2021-10-29T15:22:52.000Z
==============================
