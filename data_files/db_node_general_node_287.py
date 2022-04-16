==============================
 Javascript generate random string  
==============================
var crypto = require("crypto"); var id = crypto.randomBytes(20).toString('hex');  // "bb5dc8842ca31d4603d6aa11448d1654"
function randomString(length) { 		var result           = ''; 		var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*()_+=-'; 		var charactersLength = characters.length; 		for ( var i = 0; i < length; i++ ) { 		   result += characters.charAt(Math.floor(Math.random() * charactersLength)); 		} 		return result; 	 } randomString(4);
function getRandomString(length) {      var randomChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';      var result = '';      for ( var i = 0; i < length; i++ ) {          result += randomChars.charAt(Math.floor(Math.random() * randomChars.length));      }      return result;  }    //usage: getRandomString(20); // pass desired length of random string
// program to generate random strings  const result = Math.random().toString(36).substring(2,7); console.log(result);
function makeid(length) {     var result           = [];     var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';     var charactersLength = characters.length;     for ( var i = 0; i < length; i++ ) {       result.push(characters.charAt(Math.floor(Math.random() *   charactersLength)));    }    return result.join(''); }  console.log(makeid(5));
const string_length = 10 [...Array(string_length)].map(i=>(~~(Math.random()*36)).toString(36)).join('')
  
==============================
287 at  2021-10-29T15:22:52.000Z
==============================
