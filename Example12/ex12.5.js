
const Obj_app_paths = 
{
url_path_1 : '/home/sea/json_node/',
url_path_2 : '/home/sea/json_node/controllers/',
url_path_3 : '/home/sea/json_node/models/',
url_path_4 : '/home/sea/json_node/public/',
url_path_5 : '/home/sea/json_node/middlewares/',
url_path_6 : '/home/sea/json_node/routes/',
url_path_7 : '/home/sea/json_node/views/partials/',
url_path_8 : '/home/sea/json_node/views/',
url_path_9 : '/home/sea/json_node/db_json/'
};

const arr_ex = ['ex1.js', 'ex2.js', 'ex3.js', 'ex4.js', 'ex5.js','ex6.js','ex7.js','ex8.js','ex9.js','ex10.js','ex11.js','ex12.js'];

var fs = require('fs');
var path = require('path');
var util = require('util');

function encodeHash(text) {
    return encodeURIComponent(text.replace(/\u200B/g, "\u200B\u200B").replace(/#/g, "\u200Bꖛ").replace(/%/g, "\u200B℅"));
}

function decodeHash(text) {
    return text.replace(/(?:%[a-f0-9]+)+/gim, function(t) {
        try {
            return decodeURIComponent(t)
        } catch (ex) {
            return t
        }
    }).replace(/\u200B℅/g, "%").replace(/\u200Bꖛ/g, "#").replace(/\u200B\u200B/g, "\u200B");
}

function readFiles(path) {

    let url_path = path;
    const files = fs.readdirSync(url_path)

    var n = files.length;

    const sample = [];
    var i = 1;

    var data_content;

    for (const file of files) {
        if(!fs.lstatSync(url_path + '/' + file).isDirectory())
        {
             const readFileLines = filename =>
                fs.readFileSync(filename)
                .toString('UTF8');

                file_content = readFileLines(url_path + '/' + file);

                file_to_raplace = file;
                /*file_to_raplace = file_to_raplace.replace(/_/g, " ");
                file_to_raplace = file_to_raplace.replace(/\.[^.]+$/, '');*/

                sample.push({
                    id: i,
                    path:url_path,
                    title: file_to_raplace,
                    description: file_content.toString(),
                    full_path: function() 
                        {
                            //console.log(this.path + '/' + this.file_to_raplace);
                            return this.path + '/' + this.title;
                        }
                });
                i++;
        }
    } /*end for parcour files*/
    return sample;
}

function get_All_app_files()
{
   let arrOutput = [];
   let arrtmp = [];
    
   console.log('ex12.2.js'); 

   let url_path = '';
   let txt = "";     
   for (let key in Obj_app_paths) 
    {
        url_path = Obj_app_paths[key];

        arrtmp = readFiles(url_path);

        
       arrOutput.push(
       {
        url_path:url_path,
        data : arrtmp
       }
        );
    }

return arrOutput;
}

write_All_app_files();
function write_All_app_files()
{
var bkp_nb = 7;
var extension_type = '.txt';

var arrRet = get_All_app_files();

for (let key in arrRet) 
    {
        for (let k in Obj_app_paths) 
        {
            url_path = Obj_app_paths[k];
            if(arrRet[key].url_path == url_path)
            {    
            
                var new_filename = url_path.replace(/\//gi, "__");
                     new_filename = new_filename.replace(/__home__sea__/g, "__");
                     new_filename = new_filename +bkp_nb +extension_type;

                var dir = '/bkp/AppGlobs/';
                arrRet[key].data.forEach(function(data)
                {
                    var txt = '';
                    txt+='============================================================\n';
                    txt+= 'path : ' + data.path.replace(/\//gi, "__");
                    txt+= '\n';
                    txt+='============================================================\n';
                    txt+='============================================================\n';
                    txt+= 'id: ' + data.id;
                    txt+= '\n';
                    txt+='============================================================\n';
                    txt+= 'file: ' + data.title;
                    txt+= '\n';
                    txt+='============================================================\n';
                    txt+= 'content: ' + data.description;
                    txt+= '\n';
                    txt+='============================================================\n';
                 
                    console.log('txt');
                    console.dir(txt);
                    
                 try{
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
                        fs.appendFileSync(__dirname + dir + new_filename +'__LOG__ERR__.txt', err);
                        return true;
                        }
                    }

                    fs.appendFileSync(__dirname + dir + new_filename, '\n\n');
                });
            
            }

        }
         
    }

}

