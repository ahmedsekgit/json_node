==============================
 Getting Started with AssemblyScript  
==============================
/*     This code comes from Vincent Lab     And it has a video version linked here: https://www.youtube.com/watch?v=ETrbk6khfwE */  // Import dependencies import { AsBind } from "as-bind"; import fs from "fs";  (async () => {     // Load in the wasm file     const wasm = fs.readFileSync("./main.wasm");      // Instantiate the wasm file, and pass in our importObject     const instance = await AsBind.instantiate(wasm, {         utils: {             log(message) {                 console.log(message);             }         }     });      // Run main     instance.exports.printName("Bob",10); })();
  
==============================
227 at  2021-10-29T15:22:52.000Z
==============================
