==============================
 Element in viewport or not ?  
==============================
function isElementInViewport (el) {      // Special bonus for those using jQuery     if (typeof jQuery === "function" && el instanceof jQuery) {         el = el[0];     }      var rect = el.getBoundingClientRect();      return (         rect.top >= 0 &&         rect.left >= 0 &&         rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /* or $(window).height() */         rect.right <= (window.innerWidth || document.documentElement.clientWidth) /* or $(window).width() */     ); } 
  
==============================
194 at  2021-10-29T15:22:52.000Z
==============================