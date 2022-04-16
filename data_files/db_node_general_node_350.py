==============================
nodejs execute command  
==============================
// You can use 'exec' this way

const { exec } = require("child_process");

exec("ls -la", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
});

or

const { exec } = require("child_process");
exec("cat index.js", (error, data, getter) => {
	if(error){
		console.log("error",error.message);
		return;
	}
	if(getter){
		console.log("data",data);
		return;
	}
	console.log("data",data);

});

or 

// Run a command asynchronously
const { spawn } = require('child_process');
const dir = spawn('cmd', ['/c', 'dir']);

dir.stdout.on('data', data => console.log(`Stdout: ${data}`));
dir.stderr.on('data', data => console.log(`Stderr: ${data}`));
dir.on('close', code => console.log(`Exit code: ${code}`));

// Run a command synchronously
const { spawnSync } = require( 'child_process' );
const dir = spawnSync('cmd', ['/c', 'dir']);

console.log(`Stdout: ${dir.stdout.toString()}`);
console.log(`Stderr: ${dir.stderr.toString()}`);

                      
==============================
350 at  2021-10-29T15:22:52.000Z
==============================
