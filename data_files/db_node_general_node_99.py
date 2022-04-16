==============================
codegrepper nodejs how to create a folder using fs in node js  
==============================
var fs = require('fs');
const dir = './database/temp';
if (!fs.existsSync(dir)) {
	fs.mkdirSync(dir, {
		recursive: true
	});
}   
==============================
99 at  2021-10-29T15:22:52.000Z
==============================
