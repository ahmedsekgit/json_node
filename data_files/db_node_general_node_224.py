==============================
 Generate random whole numbers within a range javascript  
==============================
function getRandomNumberBetween(min,max){      return Math.floor(Math.random()*(max-min+1)+min);  }    //usage example: getRandomNumberBetween(20,400);   
function randomRange(min, max) {  	return Math.floor(Math.random() * (max - min + 1)) + min;  }  console.log(randomRange(1,9));
const min = 1; const max = 4; const intNumber = Math.floor(Math.random() * (max - min)) + min; console.log(intNumber); //> 1, 2, 3
var randomWholeNumber = Math.floor(Math.random() * 20);   function randomWholeNum() {  	return Math.floor(Math.random() * 10);  }  console.log(randomWholeNum());
var myMin = 1; var myMax = 10; function randomRange(myMin, myMax) {   return Math.floor(Math.random() * (myMax - myMin + 1)) + myMin; }  console.log(randomRange(myMin, myMax));
  
==============================
224 at  2021-10-29T15:22:52.000Z
==============================
