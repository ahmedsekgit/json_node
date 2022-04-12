const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function lsWithGrep() {
  try {
      await exec('node ex4.js');

  }catch (err){
     console.error(err);
  };
};

/*lsWithGrep();*/

function myFunc_console()
{
  i++;
  console.log('myFunc_console  every 2 seconds %d',i);
}

//var intervalID = setInterval(myFunc_console, 3000); // Will alert every second.
// clearInterval(intervalID); // Will clear the timer.

//setTimeout(myFunc_console, 3000); // Will alert once, after a second.
var i = 0;
var intervalID = setInterval(function(){ 
  lsWithGrep();
  console.log("setInterval this every 120 seconds!");
}, 180000);//run this thang every 2 seconds

setTimeout(function() {
     clearInterval(intervalID); 
}, 1200000);


/*
function myFunc(arg) {
  console.log(`arg was => ${arg}`);
}

setTimeout(myFunc, 1500, 'funky');
*/