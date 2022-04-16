==============================
 HOW WRITE AND SAVE JSON FILE IN NODEJS  
==============================
'use strict';  const fs = require('fs');  let student = {      name: 'Mike',     age: 23,      gender: 'Male',     department: 'English',     car: 'Honda'  };   let data = JSON.stringify(student, null, 2);  fs.writeFile('student-3.json', data, (err) => {     if (err) throw err;     console.log('Data written to file'); });  console.log('This is after the write call'); 
const fs = require('fs'); const path = require('path');  let student = {      name: 'Mike',     age: 23,      gender: 'Male',     department: 'English',     car: 'Honda'  };   fs.writeFileSync(path.resolve(__dirname, 'student.json'), JSON.stringify(student)); 
  
==============================
229 at  2021-10-29T15:22:52.000Z
==============================
