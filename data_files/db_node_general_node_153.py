==============================
 A class member cannot have the 'const' keyword angular  
==============================
//Change this... const myVar = 123;  //To this... readonly myVar = 123;
class MyClass {     readonly myReadOnlyProperty = 1;      myMethod() {         console.log(this.myReadOnlyProperty);         this.myReadOnlyProperty = 5; // error, readonly     } }  new MyClass().myReadOnlyProperty = 5; // error, readonly 
  
==============================
153 at  2021-10-29T15:22:52.000Z
==============================
