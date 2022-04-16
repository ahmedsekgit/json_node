==============================
 JS get random number between  
==============================
// Genereates a number between 0 to 1; Math.random();  // to gerate a randome rounded number between 1 to 10; var theRandomNumber = Math.floor(Math.random() * 10) + 1;
function getRandomNumberBetween(min,max){      return Math.floor(Math.random()*(max-min+1)+min);  }    //usage example: getRandomNumberBetween(20,400);   
Math.floor(Math.random() * 10);
//returns a random number between min and max  const randomNumbers = (min, max) => { 	return Math.round(Math.random() * (max - min)) + min; }
//Returns random Int between 0 and 2 (included) Math.floor(Math.random()*3)
Math.random();
  
==============================
265 at  2021-10-29T15:22:52.000Z
==============================
