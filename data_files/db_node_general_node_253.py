==============================
 How to tell if an attribute exists on an object  
==============================
const user = {     name: "Sicrano",     age: 14 }  user.hasOwnProperty('name');       // Retorna true user.hasOwnProperty('age');        // Retorna true user.hasOwnProperty('gender');     // Retorna false user.hasOwnProperty('address');    // Retorna false
  
==============================
253 at  2021-10-29T15:22:52.000Z
==============================
