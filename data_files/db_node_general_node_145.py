==============================
 .map for object javscript  
==============================
var myObject = { 'a': 1, 'b': 2, 'c': 3 };  Object.keys(myObject).map(function(key, index) {   myObject[key] *= 2; });  console.log(myObject); // => { 'a': 2, 'b': 4, 'c': 6 }
  
==============================
145 at  2021-10-29T15:22:52.000Z
==============================
