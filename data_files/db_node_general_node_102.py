==============================
codegrepper nodejs nodejs array write to lines file  
==============================
let arr = ["a", "b", "c", "d", "e", "f"];

console.log(arr); // [ 'a', 'b', 'c', 'd', 'e', 'f' ]

console.log(arr.join('\n'));
// a
// b
// c
// d
// e
// f

let text = arr.join('\n');

fs.writeFileSync('modified.txt', text, "utf8");  
==============================
102 at  2021-10-29T15:22:52.000Z
==============================
