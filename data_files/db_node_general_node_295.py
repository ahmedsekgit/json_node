==============================
 Javascript looping through table  
==============================
var table = document.getElementById("myTable"); for (let i in table.rows) {    let row = table.rows[i]    //iterate through rows    //rows would be accessed using the "row" variable assigned in the for loop    for (let j in row.cells) {      let col = row.cells[j]      //iterate through columns      //columns would be accessed using the "col" variable assigned in the for loop    }   }
  
==============================
295 at  2021-10-29T15:22:52.000Z
==============================
