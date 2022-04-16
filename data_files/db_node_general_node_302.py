==============================
 Javascript remove empty elements from array  
==============================
let array = [0, 1, null, 2, 3];  function removeNull(array) { return array.filter(x => x !== null) };
var colors=["red","blue",,null,undefined,,"green"];    //remove null and undefined elements from colors  var realColors = colors.filter(function (e) {return e != null;});  console.log(realColors);
var array = [0, 1, null, 2, "", 3, undefined, 3,,,,,, 4,, 4,, 5,, 6,,,,];  var filtered = array.filter(function (el) {   return el != null; });  console.log(filtered);
const filterArray=(a,b)=>{return a.filter((e)=>{return e!=b})} let array = ["a","b","","d","","f"];  console.log(filterArray(array,""));//>> ["a","b","d","f"]
  
==============================
302 at  2021-10-29T15:22:52.000Z
==============================
