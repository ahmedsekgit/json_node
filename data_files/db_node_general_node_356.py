==============================
Better examples to understand promises and the callbacks   
==============================

 Let’s look at a first example, to give you a taste of what working with Promises is like.

With Node.js-style callbacks, reading a file asynchronously looks like this:

fs.readFile('config.json',
    function (error, text) {
        if (error) {
            console.error('Error while reading config file');
        } else {
            try {
                const obj = JSON.parse(text);
                console.log(JSON.stringify(obj, null, 4));
            } catch (e) {
                console.error('Invalid JSON in file');
            }
        }
    });

With Promises, the same functionality is used like this:

readFilePromisified('config.json')
.then(function (text) { // (A)
    const obj = JSON.parse(text);
    console.log(JSON.stringify(obj, null, 4));
})
.catch(function (error) { // (B)
    // File read error or JSON SyntaxError
    console.error('An error occurred', error);
});

Examples
import {readFile} from 'fs';

function readFilePromisified(filename) {
    return new Promise(
        function (resolve, reject) {
            readFile(filename, { encoding: 'utf8' },
                (error, data) => {
                    if (error) {
                        reject(error);
                    } else {
                        resolve(data);
                    }
                });
        });
}
function httpGet(url) {
    return new Promise(
        function (resolve, reject) {
            const request = new XMLHttpRequest();
            request.onload = function () {
                if (this.status === 200) {
                    // Success
                    resolve(this.response);
                } else {
                    // Something went wrong (404 etc.)
                    reject(new Error(this.statusText));
                }
            };
            request.onerror = function () {
                reject(new Error(
                    'XMLHttpRequest Error: '+this.statusText));
            };
            request.open('GET', url);
            request.send();
        });
}

This is how you use httpGet():

httpGet('http://example.com/file.txt')
.then(
    function (value) {
        console.log('Contents: ' + value);
    },
    function (reason) {
        console.error('Something went wrong', reason);
    });

Let’s implement setTimeout() as the Promise-based function delay() (similar to Q.delay()).

function delay(ms) {
    return new Promise(function (resolve, reject) {
        setTimeout(resolve, ms); // (A)
    });
}

// Using delay():
delay(5000).then(function () { // (B)
    console.log('5 seconds have passed!')
});


Example: timing out a Promise

function timeout(ms, promise) {
    return new Promise(function (resolve, reject) {
        promise.then(resolve);
        setTimeout(function () {
            reject(new Error('Timeout after '+ms+' ms')); // (A)
        }, ms);
    });
}


Using timeout() looks like this:

timeout(5000, httpGet('http://example.com/file.txt'))
.then(function (value) {
    console.log('Contents: ' + value);
})
.catch(function (reason) {
    console.error('Error or timeout', reason);
});


class Model {
    insertInto(db) {
        return db.insert(this.fields) // (A)
        .then(resultCode => {
            this.notifyObservers({event: 'created', model: this});
            return resultCode; // (B)
        });
    }
    ···
}



Let’s look at three ways of understanding Promises.

The following code contains a Promise-based function asyncFunc() and its invocation.

function asyncFunc() {
    return new Promise((resolve, reject) => { // (A)
        setTimeout(() => resolve('DONE'), 100); // (B)
    });
}
asyncFunc()
.then(x => console.log('Result: '+x));

// Output:
// Result: DONE

asyncFunc() returns a Promise.
 Once the actual result 'DONE' of the asynchronous computation is ready,
 it is delivered via resolve() (line B), which is a parameter of the callback that starts in line A.

So what is a Promise?

    Conceptually, invoking asyncFunc() is a blocking function call.
    A Promise is both a container for a value and an event emitter.

The following code invokes asyncFunc() from the async function main(). 
async function main() {
    const x = await asyncFunc(); // (A)
    console.log('Result: '+x); // (B)

    // Same as:
    // asyncFunc()
    // .then(x => console.log('Result: '+x));
}
main();

The body of main() expresses well what’s going on conceptually,
 how we usually think about asynchronous computations.
 Namely, asyncFunc() is a blocking function call:

    Line A: Wait until asyncFunc() is finished.
    Line B: Then log its result x.

 25.4.2 A Promise is a container for an asynchronously delivered value

If a function returns a Promise then that Promise is like a blank into which the function will (usually) fill in its result, once it has computed it. You can simulate a simple version of this process via an Array:

function asyncFunc() {
    const blank = [];
    setTimeout(() => blank.push('DONE'), 100);
    return blank;
}
const blank = asyncFunc();
// Wait until the value has been filled in
setTimeout(() => {
    const x = blank[0]; // (A)
    console.log('Result: '+x);
}, 200);

With Promises, you don’t access the eventual value via [0] (as in line A), you use method then() and a callback.
25.4.3 A Promise is an event emitter

Another way to view a Promise is as an object that emits events.

function asyncFunc() {
    const eventEmitter = { success: [] };
    setTimeout(() => { // (A)
        for (const handler of eventEmitter.success) {
            handler('DONE');
        }
    }, 100);
    return eventEmitter;
}
asyncFunc()
.success.push(x => console.log('Result: '+x)); // (B)

Registering the event listener (line B) can be done after calling asyncFunc(), 
because the callback handed to setTimeout() (line A) is executed asynchronously (after this piece of code is finished).



  
==============================
356 at  2021-10-29T15:22:52.000Z
==============================
