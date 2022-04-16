==============================
 Find document with array that contains a specific value  
==============================
As favouriteFoods is a simple array of strings, you can just query that field directly:  PersonModel.find({ favouriteFoods: "sushi" }, ...);  model: person = {     name : String,     favoriteFoods : Array }
  
==============================
218 at  2021-10-29T15:22:52.000Z
==============================
