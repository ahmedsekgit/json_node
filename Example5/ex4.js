const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const readline = require('readline');

var filename = 'recheck_express__LOG__ERR__.txt';

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
     
        Glob_links(line);

        //console.log(`Line from file: ${line}`);
    }

}

processLineByLine(filename);

//url ="js_statements.asp";
//Glob_links(url);

function Glob_links(url) {

    var href = 'https://www.codegrepper.com' + url;

    var value = url;

    var new_value = value.replace(/\//gi, "__");
    new_value = new_value.replace(/\+/gi, '_');

    var txt = new_value + '__?';
    var dir = '/node_express_q_r/';
    var new_filename = new_value + '.txt';
  
    
    try {
        if (fs.existsSync(__dirname + dir + new_filename)) {
            const data = fs.readFileSync(__dirname + dir + new_filename).toString();
            var Nb_line = data.split('\n').length;
            console.log('__dirname + dir + new_filename');
            console.dir(__dirname + dir + new_filename);
            console.log('Nb_line');
            console.dir(Nb_line);
            }
            else
            {
                console.log('file does not exist');
                try {
                        console.log('trying fetchData(href).then((res)....');
                    fetchData(href).then((res) => {
                        
                        console.log('fetchData is responding ....');

                        const html = res.data;
                        const $ = cheerio.load(html);
                        const statsTable_old = $('textarea#textareaCode');
                        const statsTable = $('textarea.code_mirror_code');


                        statsTable.each(function() {
                            let textarea = $(this).text();
                            console.log('textarea');
                            console.log(textarea);
                            if (textarea.length>0)
                            {
                                try {
                                        fs.appendFileSync(__dirname + dir + new_filename, txt);
                                    } 
                                catch (err) 
                                    {
                                        if (err.code === 'ENOENT') 
                                        {
                                            console.log('File not found!');
                                        } 
                                    else 
                                        {
                                        fs.appendFileSync(__dirname + dir + '__LOG__ERR__.txt', err);
                                        return true;
                                        }
                                    }

                                    fs.appendFileSync(__dirname + dir + new_filename, '\n');

                                try {
                                    fs.appendFileSync(__dirname + dir + new_filename, textarea);
                                    } 
                                catch (err) 
                                    {
                                    if (err.code === 'ENOENT') 
                                    {
                                        console.log('File not found!');
                                    } 
                                    else 
                                    {
                                        fs.appendFileSync(__dirname + dir + '__LOG__ERR__.txt', err);
                                        return true;
                                    }
                                }
                            }
                                
                        }); /*fin statsTable*/

                    }) /*fin fetchData treatement*/

                } 
                catch 
                {
                    textarea = '_no_response_';

                    fs.writeFileSync(__dirname + dir + new_filename, textarea);

                }
            }

        }
        catch (err) 
            {
                console.error(err)
            }

} /* fin Glob_links*/


async function fetchData(url) {
    console.log("Crawling data...")
    // make http call to url
    let response = await axios(url).catch((err) => console.log(err));

    if (response.status !== 200) {
        console.log("Error occurred while fetching data");
        return;
    }
    return response;
}