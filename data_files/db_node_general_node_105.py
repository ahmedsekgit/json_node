==============================
How can I Display a JavaScript ES6 Map Object to Console?  
==============================
 const mapObject = new Map();   
 mapObject.set(1, 'hello');

 console.log([...mapObject.entries()]);
 // [[1, "hello"]]

 console.log([...mapObject.keys()]);
 // [1]

 console.log([...mapObject.values()]);
 // ["hello"]  
==============================
105 at  2021-10-29T15:22:52.000Z
==============================
