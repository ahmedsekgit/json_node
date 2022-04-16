==============================
 Cannot read property 'getAuthInstance' of undefined  
==============================
<html> <head>    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID"> </head> <body>   <script>     function signOut() {       var auth2 = gapi.auth2.getAuthInstance();       auth2.signOut().then(function () {         console.log('User signed out.');       });     }      function onLoad() {       gapi.load('auth2', function() {         gapi.auth2.init();       });     }   </script>   <a href="#" onclick="signOut();">Sign out</a>    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script> </body> </html>
  
==============================
172 at  2021-10-29T15:22:52.000Z
==============================
