==============================
 Basic JavaScript: Use Recursion to Create a Countdown  
==============================
function countdown(n){   if (n < 1) {     return [];   } else {     const arr = countdown(n - 1);     arr.unshift(n);     return arr;   } } console.log(countdown(5)); // [5, 4, 3, 2, 1]
  
==============================
161 at  2021-10-29T15:22:52.000Z
==============================
