==============================
 Javascript round number to nearest 5  
==============================
Math.round(X);           // round X to an integer Math.round(10*X)/10;     // round X to tenths Math.round(100*X)/100;   // round X to hundredths Math.round(1000*X)/1000; // round X to thousandths
function round5(x) {     return Math.ceil(x/5)*5; } 
  
==============================
304 at  2021-10-29T15:22:52.000Z
==============================
