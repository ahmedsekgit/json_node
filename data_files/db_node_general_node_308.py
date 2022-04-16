==============================
 Javascript string to int  
==============================
let string = "1"; let num = parseInt(string); //num will equal 1 as a int
var myInt = parseInt("10.256"); //10  var myFloat = parseFloat("10.256"); //10.256
var arr = ['1','2','3']; arr = arr.map(x => parseInt(x));  console.log(arr); //Array(3) [ 1, 2, 3 ]
// Method - 1 ### parseInt() ### var text = "42px"; var integer = parseInt(text, 10); // returns 42  // Method - 2 ### parseFloat() ### var text = "3.14someRandomStuff"; var pointNum = parseFloat(text); // returns 3.14  // Method - 3 ### Number() ### Number("123"); // returns 123 Number("12.3"); // returns 12.3 Number("3.14someRandomStuff"); // returns NaN Number("42px"); // returns NaN
const numberInString = "20";  console.log(typeof(numberInString)) // typeof is string this is string in double quote " " const numInNum = parseInt(numberInString) // now numberInStrings variable converted in an Integer due to parseInt console.log(typeof(numInNum)) // this tell us the type of numInNum which is now a number
let theInt = parseInt("5.90123"); //5 let theFloat = parseFloat("5.90123"); //5.90123
  
==============================
308 at  2021-10-29T15:22:52.000Z
==============================
