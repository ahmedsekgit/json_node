==============================
Example to understand promise from node js website                                                  
==============================
let done = true

const isItDoneYet = new Promise((resolve, reject) => {
  if (done) {
    const workDone = 'Here is the thing I built'
    resolve(workDone)
  } else {
    const why = 'Still working on something else'
    reject(why)
  }
})

const checkIfItsDone = () => {
  isItDoneYet
    .then(ok => {
      console.log(ok)
    })
    .catch(err => {
      console.error(err)
    })
}

checkIfItsDone()

a common example will be read a file :

const fs = require('fs')

const getFile = (fileName) => {
  return new Promise((resolve, reject) => {
    fs.readFile(fileName, (err, data) => {
      if (err) {
        reject(err)  // calling `reject` will cause the promise to fail with or without the error passed as an argument
        return        // and we don't want to go any further
      }
      resolve(data)
    })
  })
}

getFile('/etc/passwd')
.then(data => console.log(data))
.catch(err => console.error(err))


var str_explain_000 =`Promises, as the name implies, 
is the function "giving its word" that a value will be returned at a later time.
t's a proxy for a value that might not be returned, 
if the function we expect a response from doesn't deliver.
Instead of returning concrete values, these asynchronous functions return a Promise object, which will at some point either be fulfilled or not.

Most often, when coding, we'll be consuming Promises rather than creating them. It is the libraries/frameworks that create Promises for the clients to consume.

Still, it is good to understand what goes behind creating a Promise:
`
let promise = new Promise(function(resolve, reject) {
    // Some imaginary 2000 ms timeout simulating a db call
    setTimeout(()=> {
        if (/* if promise can be fulfilled */) {
            resolve({msg: 'It works', data: 'some data'});
        } else {
            // If promise can not be fulfilled due to some errors like network failure
            reject(new Error({msg: 'It does not work'}));
        }
    }, 2000);
});
var str_explain_001 =`The promise constructor receives an argument - a callback.
 The callback can be a regular function or an arrow function. 
 The callback takes two parameters - resolve and reject. 
 Both are function references. The callback is also called the executor.

The executor runs immediately when a promise is created.
 The promise is resolved by calling resolve() 
 if the promise is fulfilled, 
 	and rejected by calling reject() 
 if it can't be fulfilled.

Both resolve() and reject() 
takes one argument - boolean, string, number, array, or an object.

Consuming a Promise

Through an API, say we requested some data from the server 
and it's uncertain when it'll be returned - 
if it'll be returned at all. 
This is a perfect example of when we'd use a Promise to help us out.

Assuming that the server's method that handles our call returns a Promise, 
we can consume it:`

promise.then((result) => {
    console.log("Success", result);
}).catch((error) => {
    console.log("Error", error);
});
var str_explain_002 =`As we can see we have chained two methods - 
then() and catch(). 
These are few of the various methods provided by the Promise object.

then() is executed when things go well, 
i.e the promise is fulfilled by the resolve() method.
 And if the promise was rejected,
  the catch() method will be called with the error sent to reject.
Chaining Promises

If we have a sequence of asynchronous tasks one after another that need to be 
performed - the more nesting there is, the more confusing the code becomes.

This leads us to callback hell, which can easily be avoided by chaining 
several then() methods on a single Promised result:`
promise.then(function(result) {
    // Register user
    return {account: 'blahblahblah'};
}).then(function(result) {
    // Auto login
    return {session: 'sjhgssgsg16775vhg765'};
}).then(function(result) {
    // Present WhatsNew and some options
    return {whatsnew: {}, options: {}};
}).then(function(result) {
    // Remember the user Choices
    return {msg: 'All done'};
});
var str_explain_003 =`
As we can see the result is passed through the chain of then() handlers:

    The initial promise object resolves
    Then the then() handler is called to register user
    The value that it returns is passed to the next then() handler 
    to auto login the user
    ...and so on

Also, the then(handler) may create and return a promise.

Note: Although technically we can do something like the proceeding example, 
it can take away from the point of chaining.
 Although this technique can be good for when you need to optionally
  call asynchronous methods:`

let promise = new Promise(function(resolve, reject) {
    setTimeout(() => resolve({msg: 'To do some more job'}), 1000);
});

promise.then(function(result) {
    return {data: 'some data'};
});

promise.then(function(result) {
    return {data: 'some other data'};
});

promise.then(function(result) {
    return {data: 'some more data'};
});

var str_explain_004 =`What we are doing here is just adding several handlers
 to one promise,
 all of which process the result indepdendently. 
 They are not passing the result to each other in the sequence.

This way, all handlers get the same result – 
the result of that promise - {msg: 'To do some more job'}.`
//syntax 
  //let customPromise=new Promise((resolve, reject)=>{ …. }) 
  //example 
    function addNumbers(allowToAdd,num1, num2){ 
       return new Promise((resolve, reject)=>{ 
                 allowToAdd ? resolve(num1 + num2):reject(`Fail To Add`) }); } 
  //Handle result 
   let addResult=(value)=>{ console.log(`Add result :` + value) } 
   let failResult=(failString)=>{ console.log(failString) } 
  //consuming or calling promise addNumbers(true,10,20).then(addResult,failResult) 
  //Result Add result :30

  //addNumbers(true,'fdf',20).then(addResult,failResult) ;
  var str_explain_0000 =`Promises can be nested or chained to one another. 
  This is because when you define a promise, 
  the “then” method itself will return a promise.
  Take a look at the example here, 
  in which we are nesting to define two callback functions.`
  // addNumbers function as above 

     let firstResult = addNumbers(true,10,20) 
     let secResult = firstResult.then( function(data) { 
       // If firstResult was successful, perform add again 
                     return addNumbers(true, data, 20) }, function(err) { 
                          //If firstResult was unsuccessful, log error 
                                     console.error(err)
                                    } ) 

   secResult.then(addResult, failResult) ;
//result: Add result:50
var str_explain_0001 =`
In the above example, 
The then method itself returns a promise:

This promise here represents the return value for the onResolved or 
onRejected handlers when they are specified.
 But since only one of these resolutions is possible,
  the promise goes for the handler that is called at that point of time.

Since the then method returns a promise, 
it indicates that the promises can be chained 
to avoid issues related to the callback:.`
// addNumbers function as above 
    addNumbers(true,10,20).then((firstResult)=>{ return addNumbers(true,firstResult,20); })
                          .then((secResult)=>{ return addNumbers(true,secResult,30); })
                          .then(addResult) .catch(failResult)
                          .then(()=>{ console.log(`Promise Chaining Ended`) }) 
//result Add result:80
 var str_explain_0002 =`
 Note: Above is a clear example of a concept 
 such as “Promise Chaining” or “Promise Sequence”, 
 where things are done in a particular order..
 it was another manner to resole problem with callbacks,
 If you've ever worked with callbacks, 
 there's a chance you've experienced callback hell:`

doSomething(function(x) {
    console.log(x);
    doSomethingMore(x, function(y) {
        console.log(y);
        doRestOfTheThings(y, function(z) {
            console.log(z);
        });
    });
});



                    
                    
                      
==============================
355 at  2021-10-29T15:22:52.000Z
==============================
