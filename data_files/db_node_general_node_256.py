==============================
 Inject Javascript Function not working in Android React Native WebView but work fine in iOS React Native  
==============================
For android, while adding the javascript function we need to add it as part of DOM. For that, replace `function` with `document` in jsCode.   Ex: let jsCode = `docuement.doPopUp() {                         document.querySelector('#myBody').style.backgroundColor = 'red';                         alert('hello world from webview');                         }`;  
  
==============================
256 at  2021-10-29T15:22:52.000Z
==============================
