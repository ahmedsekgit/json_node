const fs = require('fs')
const readline = require('readline');

var filename = 'recheck_express__LOG__ERR__.txt';

processLineByLine(filename);

async function processLineByLine(filename) {
    const fileStream = fs.createReadStream(filename);

    const rl = readline.createInterface({
        input: fileStream,
        crlfDelay: Infinity
    });
    // Note: we use the crlfDelay option to recognize all instances of CR LF
    // ('\r\n') in input.txt as a single line break.

    for await (const line of rl) {
        // Each line` in input.txt will be successively available here as `line`.
     	path = __dirname+'/node_express_q_r/'+line;
        deleteFileSync(path);

        //console.log(`Line from file: ${line}`);
    }

}


function deleteFileSync(path)
{
	try {
			console.log('file');
			console.dir(path);
  			fs.unlinkSync(path)
  			console.log('file removed');
		} catch(err) {
  			console.error(err)
		}
}
