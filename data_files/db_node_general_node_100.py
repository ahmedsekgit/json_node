==============================
codegrepper node js nodejs fs create file if not exists  
==============================
fs.exists(filename, function(exists) {
  if(exists) {
    // Create a file
            fs.writeFile('<fileName>',<contenet>, callbackFunction)
  }
  else {
    console.log("Deny overwrite existing", filename);
  }
}); 
//function to create file 
javascript write to file 
// writeFile function is defined. 
const fs = require('fs') 
  
// Data which will write in a file. 
let data = "Learning how to write in a file."
  
// Write data in 'Output.txt' . 
fs.writeFile('Output.txt', data, (err) => { 
      
    // In case of a error throw err. 
    if (err) throw err; 
}) 
</script>   
==============================
100 at  2021-10-29T15:22:52.000Z
==============================
