==============================
 .reverse javascript  
==============================
const array1 = [1,2,3,4]; console.log('array1:', array1); //"array1:" Array [1, 2, 3, 4]  const reversed = array1.reverse(); console.log('reversed:', reversed); //"reversed:" Array [4, 3, 2, 1]  // Careful: reverse is destructive -- it changes the original array. console.log('array1:', array1); //"array1:" Array [4, 3, 2, 1]
"this is a test string".split("").reverse().join(""); //"gnirts tset a si siht"  // Or const reverse = str => [...str].reverse().join('');  // Or const reverse = str => str.split('').reduce((rev, char)=> `${char}${rev}`, '');  // Or const reverse = str => (str === '') ? '' : `${reverse(str.substr(1))}${str.charAt(0)}`;  // Example reverse('hello world');     // 'dlrow olleh'
var arr=[1,2,5,6,2] arr.reverse()
var arr = [34, 234, 567, 4]; print(arr); var new_arr = arr.reverse(); print(new_arr); 
array = [1 2, 3] reversed = array.reverse()
var rev = arr.reverse();  
  
==============================
147 at  2021-10-29T15:22:52.000Z
==============================
