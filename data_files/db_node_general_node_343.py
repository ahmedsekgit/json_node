==============================
Understand Asynchronous Code Async and await in Node.js                                                                                                   
==============================
An async function returns a promise, like in this example:

const doSomethingAsync = () => {
  return new Promise(resolve => {
    setTimeout(() => resolve('I did something'), 3000)
  })
}           
When you want to call this function you prepend await, and the calling code will stop until the promise is resolved or rejected. One caveat: the client function must be defined as async. Here's an example:

const doSomething = async () => {
  console.log(await doSomethingAsync())
}

This is a simple example of async/await used to run a function asynchronously:
const doSomethingAsync = () => {
  return new Promise(resolve => {
    setTimeout(() => resolve('I did something'), 3000)
  })
}

const doSomething = async () => {
  console.log(await doSomethingAsync())
}

console.log('Before')
doSomething()
console.log('After')

Prepending the async keyword to any function means that the function will return a promise.

Even if it's not doing so explicitly, it will internally make it return a promise.

This is why this code is valid:

JS

const aFunction = async () => {
  return 'test'
}

aFunction().then(alert) // This will alert 'test'
and it's the same as:

JS

const aFunction = () => {
  return Promise.resolve('test')
}

aFunction().then(alert) // This will alert 'test'

And this is a very simple example, the major benefits will arise when the code is much more complex.

For example here's how you would get a JSON resource, and parse it, using promises:

JS

const getFirstUserData = () => {
  return fetch('/users.json') // get users list
    .then(response => response.json()) // parse JSON
    .then(users => users[0]) // pick first user
    .then(user => fetch(`/users/${user.name}`)) // get user data
    .then(userResponse => userResponse.json()) // parse JSON
}

getFirstUserData()

Multiple async functions in series

Async functions can be chained very easily, and the syntax is much more readable than with plain promises:

const promiseToDoSomething = () => {
  return new Promise(resolve => {
    setTimeout(() => resolve('I did something'), 10000)
  })
}

const watchOverSomeoneDoingSomething = async () => {
  const something = await promiseToDoSomething()
  return something + '\nand I watched'
}

const watchOverSomeoneWatchingSomeoneDoingSomething = async () => {
  const something = await watchOverSomeoneDoingSomething()
  return something + '\nand I watched as well'
}

watchOverSomeoneWatchingSomeoneDoingSomething().then(res => {
  console.log(res)
})

Easier debugging

Debugging promises is hard because the debugger will not step over asynchronous code.

Async/await makes this very easy because to the compiler it's just like synchronous code.  
==============================
343 at  2021-10-29T15:22:52.000Z
==============================
