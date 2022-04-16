==============================
Console Debugging console.log console.dir let x = 123;   console.log('x:', x);  // x: 123  
==============================
console.log( myVariable );
let x = 123;
console.log('x:', x);
// x: 123

However, ES6 destructuring can offer similar output with less typing effort:

console.log({x});
// { x: 123 }

Larger objects can be output as a condensed string using this:

console.log( JSON.stringify(obj) );

Few developers delve beyond this humble debugging command, but they’re missing out on many more possibilities, including these:
console method 	description
.log(msg) 	output a message to the console
.dir(obj,opt) 	uses util.inspect to pretty-print objects and properties
.table(obj) 	outputs arrays of objects in tabular format
.error(msg) 	output an error message
.count(label) 	a named counter reporting the number of times the line has been executed
.countReset[label] 	resets a named counter
.group(label) 	indents a group of log messages
.groupEnd(label) 	ends the indented group
.time(label) 	starts a timer to calculate the duration of an operation
.timeLog([label] 	reports the elapsed time since the timer started
.timeEnd(label) 	stops the timer and reports the total duration
.trace() 	outputs a stack trace (a list of all calling functions)
.clear() 	clear the console  
==============================
82 at  2021-10-29T15:22:52.000Z
==============================
