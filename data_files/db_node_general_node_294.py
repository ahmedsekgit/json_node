==============================
 Javascript key exists  
==============================
var person={"name":"Billy","age":20}  person.hasOwnProperty("name"); // true  person.hasOwnProperty("sex"); // false
if (obj.hasOwnProperty("key1")) {   ... }
"key" in obj // true, regardless of the actual value  If you want to check if a key doesn't exist, remember to use parenthesis: !("key" in obj) // true if "key" doesn't exist in object !"key" in obj   // ERROR!  Equivalent to "false in obj"  Or, if you want to particularly test for properties of the object instance (and not inherited properties), use hasOwnProperty: obj.hasOwnProperty("key") // true
"key" in obj // true, regardless of the actual value
!("key" in obj) // true if "key" doesn't exist in object !"key" in obj   // ERROR!  Equivalent to "false in obj" 
var obj = { key: undefined }; obj["key"] !== undefined // false, but the key exists!
  
==============================
294 at  2021-10-29T15:22:52.000Z
==============================
