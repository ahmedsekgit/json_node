==============================
codegrepper nodejs read file from directory and specific directory nodejs  
==============================
node list files in directory
//requiring path and fs modules
const path = require('path');
const fs = require('fs');
//joining path of directory 
const directoryPath = path.join(__dirname, 'Documents');
//passsing directoryPath and callback function
fs.readdir(directoryPath, function (err, files) {
    //handling error
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    } 
    //listing all files using forEach
    files.forEach(function (file) {
        // Do whatever you want to do with the file
        console.log(file); 
    });
});

node js get files in dir
const path = require('path');
const fs = require('fs');

fs.readdir(
  path.resolve(__dirname, 'MyFolder'),
  (err, files) => {
    if (err) throw err;
    
    for (let file of files) {
      console.log(file);
    }
  }
);
  
==============================
109 at  2021-10-29T15:22:52.000Z
==============================
