==============================
 Check if a JavaScript string is a URL  
==============================
function validURL(str) {   var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol     '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name     '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address     '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path     '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string     '(\\#[-a-z\\d_]*)?$','i'); // fragment locator   return !!pattern.test(str); }
function isValidURL(string) {   var res = string.match(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g);   return (res !== null) };  var testCase1 = "http://en.wikipedia.org/wiki/Procter_&_Gamble";  alert(isValidURL(testCase1));  
  
==============================
174 at  2021-10-29T15:22:52.000Z
==============================
