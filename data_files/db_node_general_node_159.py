==============================
 Append text into a file nodejs  
==============================
const fs = require('fs');  fs.appendFile('message.txt', 'data to append', function (err) {   if (err) throw err;   console.log('Saved!'); });  If message.txt doesnt exist, It will gonna create that too 
Synchronously  const fs = require('fs');  fs.appendFileSync('message.txt', 'data to append'); 
  
==============================
159 at  2021-10-29T15:22:52.000Z
==============================
