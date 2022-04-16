==============================
 How to Make a Bad Word Filter in JavaScript  
==============================
/*     This code comes from Vincent Lab     And it has a video version linked here: https://www.youtube.com/watch?v=spBRgujJ3xw */  // Import dependencies const Filter = require("bad-words");  // Make a new filter const filter = new Filter();  // https://www.cs.cmu.edu/~biglou/resources/ // Add extra words to the bad words list const words = require("./extra-words.json"); filter.addWords(...words);  // Test the bad words filter console.log(filter.clean("Don't be an ash0le")); console.log(filter.clean("You fucking mother fucker")); console.log(filter.clean("You are a son of a whore")); console.log(filter.clean("You fucking fucknut")); console.log(filter.clean("fucking cunt")); console.log(filter.clean("You are a shit ass")); console.log(filter.clean("This fucking product is unbelievable")); console.log(filter.clean("You are a bitch"));
  
==============================
238 at  2021-10-29T15:22:52.000Z
==============================
