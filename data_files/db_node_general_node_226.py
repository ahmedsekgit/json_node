==============================
 Get Theme from URL Parameter and enable CSS theme  
==============================
var head = document.getElementsByTagName('HEAD')[0];    const queryString = window.location.search; const urlParams = new URLSearchParams(queryString);  const theme = urlParams.get('theme')  var link = document.createElement('link'); link.rel = 'stylesheet'; link.type = 'text/css'; link.href = 'src/css/themes/' + theme + '.css';    head.appendChild(link); 		 console.log(theme + " theme enabled!");
  
==============================
226 at  2021-10-29T15:22:52.000Z
==============================
