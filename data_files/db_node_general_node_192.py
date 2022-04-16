==============================
 Dynamically load external JavaScript CDN  
==============================
const loadGoogleMaps = (callback) => {   const existingScript = document.getElementById('googleMaps');    if (!existingScript) {     const script = document.createElement('script');     script.src = 'https://maps.googleapis.com/maps/api/js?key=<API Key>&libraries=places';     script.id = 'googleMaps';     document.body.appendChild(script);      script.onload = () => {       if (callback) callback();     };   }    if (existingScript && callback) callback(); };
  
==============================
192 at  2021-10-29T15:22:52.000Z
==============================
