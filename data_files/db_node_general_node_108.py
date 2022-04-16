==============================
nodejs error ReferenceError: TextEncoder is not defined  
==============================
Solution helped for me:

nano /app/MyProj/node_modules/whatwg-url/dist/encoding.js

and just add new line:

const { TextEncoder, TextDecoder } = require("util");
  
==============================
108 at  2021-10-29T15:22:52.000Z
==============================
