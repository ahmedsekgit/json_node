const Obj_app_paths = 
{
url_path_1 : '/var/www/ninth.com/public_html'
};
const arr_ninth_php=
[
'database.php',
'display-form.php',
'do_login.php',
'form_post.php',
'from_file_to_database.php',
'get_search_results.php',
'get_update_search_results.php',
'indep_data_flow.php',
'indep_file_parser.php',
'keyword_search.php',
'logout.php',
'out_files_treat_2.php',
'out_files_treat_3.php',
'out_files_treat.php',
'out_json_encode.php',
'out_shell_exec.php',
'php-script.php',
'post_search_commands.php',
'ref_insert_data.php',
'ref_login.php',
'ref_search_commands.php',
'ref_search_engine.php',
'ref_update_data.php',
'update-data.php',
'update-form.php',
'work_annexe_base.php'
];
const arr_ninth_js =
[
'ajax-script.js',
'autocomplete.js',
'main.js',
'test_script.js',
'update-ajax.js'
];
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
function get_All_js()
{
   let arrOutput = [];
   let arrtmp = [];
    
   console.log('ex12.3.js'); 

   let url_path = '';
   let txt = "";     
   for (let key in Obj_app_paths) 
    {
        url_path = Obj_app_paths[key]+'/js';

        arrtmp = readFiles(url_path);
        
        arrtmp.forEach(function(data){
            if(arr_ninth_js.includes(data.title)) 
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


function get_All_php()
{
   let arrOutput = [];
   let arrtmp = [];
    
   console.log('ex12.3.js'); 

   let url_path = '';
   let txt = "";     
   for (let key in Obj_app_paths) 
    {
        url_path = Obj_app_paths[key];

        arrtmp = readFiles(url_path);
        
        arrtmp.forEach(function(data){
            if(arr_ninth_php.includes(data.title)) 
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
var php_or_js = 'php';
write_All_php_js(php_or_js);
function write_All_php_js(php_or_js)
{
var bkp_nb = 1;
var extension_type = '.txt';
if(php_or_js === 'php')
{var arrRet = get_All_php();}
if(php_or_js === 'js')
{var arrRet = get_All_js();}
for (let key in arrRet) 
    {
        for (let k in Obj_app_paths) 
        {
            url_path = Obj_app_paths[k];
            if(php_or_js === 'js')
            {
                url_path = url_path + '/js';
            }
            if(arrRet[key].url_path == url_path)
            {
                var dir ='';
                //console.log('arrRet[key].data');
                //console.dir(arrRet[key].data);
                //process.exit();
                var new_filename = url_path.replace(/\//gi, "__");
                     new_filename = new_filename.replace(/__var__www__/g, "__");
                     if(php_or_js === 'php')
                     {
                        dir = '/bkp/ninth/phps';
                        new_filename = new_filename +'_php_'+bkp_nb +extension_type;
                     }
                     if(php_or_js === 'js')
                     {
                        dir = '/bkp/ninth/jss';
                        new_filename = new_filename +'_'+bkp_nb +extension_type;
                     }   
                console.log('new_filename'  + new_filename);

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


function write_All_app_files()
{
var bkp_nb = 2;
var extension_type = '.sql';

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

