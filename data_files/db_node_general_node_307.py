==============================
 Javascript store in localStorage  
==============================
var person = { "name": "billy", "age": 23};    localStorage.setItem('person', JSON.stringify(person)); //stringify object and store  var retrievedPerson = JSON.parse(localStorage.getItem('person')); //retrieve the object
localStorage.setItem('user_name', 'Rohit'); //store a key/value var retrievedUsername = localStorage.getItem('user_name'); //retrieve the key
localStorage.setItem(key, val); var val = localStorage.getItem(key); localStorage.removeItem(key); localStorage.clear();
  
==============================
307 at  2021-10-29T15:22:52.000Z
==============================
