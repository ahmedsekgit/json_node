==============================
 How to append to a file in Node?  
==============================
// Asynchronously: const fs = require('fs');  fs.appendFile('message.txt', 'data to append', function (err) {   if (err) throw err;   console.log('Saved!'); });  // Synchronously: const fs = require('fs');  fs.appendFileSync('message.txt', 'data to append');
  
==============================
241 at  2021-10-29T15:22:52.000Z
==============================
