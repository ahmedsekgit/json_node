==============================
 Delay js function  
==============================
var delayInMilliseconds = 1000; //1 second  setTimeout(function() {   //your code to be executed after 1 second }, delayInMilliseconds); 
setTimeout(function() {  //your code here }, 1000);
console.log("Hello"); setTimeout(() => {  console.log("World!"); }, 2000); 
 $(this).delay(1000).queue(function() {       // your Code | Function here            $(this).dequeue();      });
setTimeout(/*how many milaseconds you want to delay */)
function sleep(ms) {   return new Promise(resolve => setTimeout(resolve, ms)); }  console.log("Hello"); sleep(2000).then(() => { console.log("World!"); }); 
  
==============================
187 at  2021-10-29T15:22:52.000Z
==============================
