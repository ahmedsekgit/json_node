==============================
 How to find the max id in an array of objects in JavaScript  
==============================
const shots = [   {id: 1, amount: 2},   {id: 2, amount: 4},   {id: 3, amount: 52},   {id: 4, amount: 36},   {id: 5, amount: 13},   {id: 6, amount: 33} ];  shots.reduce((acc, shot) => acc = acc > shot.amount ? acc : shot.amount, 0); 
Math.max(...arr.map({ value } => value));
  
==============================
244 at  2021-10-29T15:22:52.000Z
==============================
