==============================
 Javascript get month name  
==============================
let date = new Date(2020, 05, 21); // 2020-06-21 let longMonth = date.toLocaleString('en-us', { month: 'long' }); /* June */ let shortMonth = date.toLocaleString('en-us', { month: 'short' }); /* Jun */ let narrowMonth = date.toLocaleString('en-us', { month: 'narrow' }); /* J */
var  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];  var d = new Date();  var monthName=months[d.getMonth()]; // "July" (or current month)  
export  const GetDatMonthFromDate=(dateSplit:any)=>{     dateSplit = dateSplit.split('-');     var monthShortNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"         ];    var  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];      const date = new Date(dateSplit[0], dateSplit[1], dateSplit[2]); // 2020-06-21     return dateSplit[2]+' '+ monthShortNames[date.getMonth()]; }  GetDatMonthFromDate('2021-07-2');  //output = 2 sep;  // if you wanty full month then use months instead of monthShortNames on // line number 9  //return dateSplit[2]+' '+ months[date.getMonth()];  output == 2 September
date('m');
var Xmas95 = new Date(); var options = { month: 'long'}; console.log(new Intl.DateTimeFormat('en-US', options).format(Xmas95)); // December console.log(new Intl.DateTimeFormat('de-DE', options).format(Xmas95)); // Dezember 
  
==============================
291 at  2021-10-29T15:22:52.000Z
==============================
