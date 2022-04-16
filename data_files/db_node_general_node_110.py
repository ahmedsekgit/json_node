==============================
codegrepper how to add element to object javascript  
==============================
//Consider the following example object literal:
var myObject = {
    sProp: 'some string value',
    numProp: 2,
    bProp: false
};
//You can use dot syntax to add a new property to it as follows:
myObject.prop2 = 'data here';

//Modify a Property of an Object Literal
//The process for modifying a property is essentially the same. 
//Here we will assign a new value to the sProp property shown in the 
//original myObject definition above:
myObject.sProp = 'A new string value for our original string property';

another example from stackoverflow ::
Your element is not an array, however your cart needs to be an array in order to support many element objects. Code example:

var element = {}, cart = [];
element.id = id;
element.quantity = quantity;
cart.push(element);

If you want cart to be an array of objects in the form { element: { id: 10, quantity: 1} } then perform:

var element = {}, cart = [];
element.id = id;
element.quantity = quantity;
cart.push({element: element});

JSON.stringify() was mentioned as a concern in the comment:

>> JSON.stringify([{a: 1}, {a: 2}]) 
      "[{"a":1},{"a":2}]" 

let person = {
  name : 'John Doe',
  age : 35
}

//Now we can add element by 2 ways
person.occupation = 'Web Designer'
//or
person['occupation'] = 'Web Designer'; //This is usefull for adding element within loop.

object[yourKey] = yourValue;
object.yourKey = yourValue;

  
==============================
110 at  2021-10-29T15:22:52.000Z
==============================
