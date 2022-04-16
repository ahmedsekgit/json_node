==============================
 100vh --vh  
==============================
// CSS .full-height {   height: 100vh; /* Use vh as a fallback for browsers that do not support Custom Properties */   height: calc(var(--vh, 1vh) * 100); }   // JS const injectVHInCSS = ()=>{   // First we get the viewport height and we multiple it by 1% to get a value for a vh unit   let vh = window.innerHeight * 0.01;   // Then we set the value in the --vh custom property to the root of the document   document.documentElement.style.setProperty('--vh', `${vh}px`); }  // Run it on load injectVHInCSS(); // Run it on resize window.addEventListener('resize', injectVHInCSS);  
  
==============================
149 at  2021-10-29T15:22:52.000Z
==============================
