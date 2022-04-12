const Obj_paths = 
{
url_path_3_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example3/node_q_r',

url_path_4_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example4/js_tryit_w3s_q_r',
url_path_4_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example4/js_w3s_q_r',

url_path_5_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example5/node_express_q_r',
url_path_5_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example5/php_w3s_q_r',
url_path_5_3 : '/home/sea/programs/javascript/nodejs/Crawling/Example5/php_tryit_w3s_q_r',

url_path_6_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example6/jquery_w3s_q_r',
url_path_6_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example6/jquery_tryit_w3s_q_r',
url_path_6_3 : '/home/sea/programs/javascript/nodejs/Crawling/Example6/react_q_r',

url_path_7_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example7/sql_tryit_w3s_q_r',
url_path_7_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example7/sql_w3s_q_r',
url_path_7_3 : '/home/sea/programs/javascript/nodejs/Crawling/Example7/jquery_q_r',

url_path_8_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example8/bootstrap_w3s_q_r',
url_path_8_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example8/bootstrap_tryit_w3s_q_r',

url_path_9_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example9/css_w3s_q_r',

url_path_10_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example10/java_w3s_q_r',

url_path_11_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example11/python_w3s_q_r'
};

const Obj_app_paths = 
{
url_path_1 : '/home/sea/nodeapp_test/',
url_path_2 : '/home/sea/nodeapp_test/controllers/',
url_path_3 : '/home/sea/nodeapp_test/models/',
url_path_4 : '/home/sea/nodeapp_test/public/',
url_path_5 : '/home/sea/nodeapp_test/middlewares/',
url_path_6 : '/home/sea/nodeapp_test/routes/',
url_path_7 : '/home/sea/nodeapp_test/views/partials/',
url_path_8 : '/home/sea/nodeapp_test/views/',
url_path_9 : '/home/sea/nodeapp_test/db_bkps/',
url_path_10 : '/home/sea/nodeapp_test/db_bkps/CSVs/',
url_path_11 : '/home/sea/nodeapp_test/db_bkps/json/'
};

const Obj_php_paths = 
{
url_path_1 : '/home/sea/nodeapp_test/',
url_path_2 : '/home/sea/nodeapp_test/controllers/',
url_path_3 : '/home/sea/nodeapp_test/models/',
url_path_4 : '/home/sea/nodeapp_test/public/',
url_path_5 : '/home/sea/nodeapp_test/middlewares/',
url_path_6 : '/home/sea/nodeapp_test/routes/',
url_path_7 : '/home/sea/nodeapp_test/views/partials/',
url_path_7 : '/home/sea/nodeapp_test/views/'
};



const Obj_ex_paths = 
{
url_path_3_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example3',

url_path_4_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example4',

url_path_5_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example5',

url_path_6_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example6',

url_path_7_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example7',

url_path_8_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example8',

url_path_9_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example9',

url_path_10_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example10',

url_path_11_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example11'
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


function get_All_ex()
{
   let arrOutput = [];
   let arrtmp = [];
    
   console.log('ex12.2.js'); 

   let url_path = '';
   let txt = "";     
   for (let key in Obj_ex_paths) 
    {
        url_path = Obj_ex_paths[key];

        arrtmp = readFiles(url_path);
        
        arrtmp.forEach(function(data){
            if(arr_ex.includes(data.title)) 
            {   
               arrOutput.push(
               {
                url_path:url_path,
                data : data
               }
                );
               
            }
        });       
 
    }

return arrOutput;
}

function write_All_ex()
{

var arrRet = get_All_ex();

for (let key in arrRet) 
    {
        for (let k in Obj_ex_paths) 
        {
            url_path = Obj_ex_paths[k];
            if(arrRet[key].url_path == url_path)
            {
                console.log('url_path'  + url_path);
                //console.log('arrRet[key].data');
                //console.dir(arrRet[key].data);
                //process.exit();
                var new_filename = url_path.replace(/\//gi, "__");

                var dir = '/bkp/Exs/';
                var txt = '';
                    txt+='============================================================\n';
                    txt+= 'path : ' + arrRet[key].data.path.replace(/\//gi, "__");
                    txt+= '\n';
                    txt+='============================================================\n';
                    txt+= 'full_path: ' + arrRet[key].data.full_path().replace(/\//gi, "__");
                    txt+= '\n';
                    txt+='============================================================\n';
                    txt+= 'id: ' + arrRet[key].data.id;
                    txt+= '\n';
                    txt+='============================================================\n';
                    txt+= 'file: ' + arrRet[key].data.title;
                    txt+= '\n';
                    txt+='============================================================\n';
                    txt+= 'content: ' + arrRet[key].data.description;
                    txt+= '\n';
                    txt+='============================================================\n';

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

            }

        }
         
    }

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
var bkp_nb = 5;
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

