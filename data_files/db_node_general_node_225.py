==============================
 Get List of all files in a directory in Node.js  
==============================
fs.readdir('./', (err, files) => {     files.forEach(file => {     //   console.log(file); })});
const testFolder = './tests/'; const fs = require('fs');  fs.readdir(testFolder, (err, files) => {   files.forEach(file => {     console.log(file);   }); }); 
 //requiring path and fs modules const path = require('path'); const fs = require('fs'); //joining path of directory  const directoryPath = path.join(__dirname, 'Documents'); //passsing directoryPath and callback function fs.readdir(directoryPath, function (err, files) {     //handling error     if (err) {         return console.log('Unable to scan directory: ' + err);     }      //listing all files using forEach     files.forEach(function (file) {         // Do whatever you want to do with the file         console.log(file);      }); });
var fs = require('fs'); var files = fs.readdirSync('/downloads');
  
==============================
225 at  2021-10-29T15:22:52.000Z
==============================
