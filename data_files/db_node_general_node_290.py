==============================
 Javascript get last item in array  
==============================
var foods = ["kiwi","apple","banana"]; var banana = foods[foods.length - 1]; // Getting last element
var colors = ["red","blue","green"]; var green = colors[colors.length - 1];//get last item in the array
let arr = ['a', 'b', 'c'] arr.slice(-1)[0] // returns last element in an array
// Method - 1 ([] operator) const arr = [5, 3, 2, 7, 8]; const last = arr[arr.length - 1]; console.log(last); /*     Output: 8 */  // Method - 2 (Destructuring Assignment) const arr = [5, 3, 2, 7, 8];  const [last] = arr.slice(-1); console.log(last); /*     Output: 8 */  // Method - 3 (Array.prototype.pop()) const arr = [5, 3, 2, 7, 8];  const last = arr.slice(-1).pop(); console.log(last); /*     Output: 8 */  // Method - 4 (Underscore/Lodash Library) const _ = require("underscore");  const arr = [5, 3, 2, 7, 8]; const last = _.last(arr); console.log(last); /*     Output: 8 */
var colors = ["red","blue","green"];  var green = colors[colors.length - 1]; //get last item in the array  
var array =[1,2,3,4]; var last= array[array.length-1];
  
==============================
290 at  2021-10-29T15:22:52.000Z
==============================
