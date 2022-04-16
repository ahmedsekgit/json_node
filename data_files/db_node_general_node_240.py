==============================
 How to Make a Product Key for your Node.js Application  
==============================
/*     This code comes from Vincent Lab     And it has a video version linked here: https://www.youtube.com/watch?v=fQk5WqpoRNQ */  // Import dependencies const jwt = require("jsonwebtoken"); const Cryptr = require("cryptr");  // Secrets const secret1 = "123"; const secret2 = "123";  // Cryptr const cryptr = new Cryptr(secret1);  // Generate the product key function generate(type) {     return cryptr.encrypt(jwt.sign({ type: type }, secret2)); }  // Validate the product key function validate(productKey) {     return jwt.verify(cryptr.decrypt(productKey), secret2); }  // Examples console.log(validate(generate("basic"))); console.log(generate("premium"));
  
==============================
240 at  2021-10-29T15:22:52.000Z
==============================
