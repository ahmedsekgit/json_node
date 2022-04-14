var searchModel = require('../models/search-model');
var fs = require('fs');
var path = require('path');
var chalk = require('chalk');
const readline = require('readline');
let string_decoder = require('string_decoder');
var lineReader = require('line-reader');
const log = console.log;

var filename = __dirname+"/../hist.txt";

function filtrage(filtred)
{
    return (filtred !== NULL && filtred !== FALSE && filtred.trim() !== "");
}

function getFileLinesSync(filename)
{
var arr_return =[];
try {
    // read contents of the file
    const data = fs.readFileSync(filename, 'UTF-8');

    // split the contents by new line
    const lines = data.split(/\r?\n/);

    // print all lines
    lines.forEach((line) => {
        arr_return.push(line);
    });
} catch (err) {
    console.error(err);
}
    return arr_return;
}

 function json_success(name, la_limite) 
{

    name = name.trim();
    name = name.toLowerCase();
    var arr_return = [];
        arr_return['error'] = false;
        arr_return['name'] = name;
    
    var Arr = [];
    var lines = [];

    lines = getFileLinesSync(filename);

    var lines_unique = lines.filter((v, i, a) => a.indexOf(v) === i); 
  
    var results = [];

    var index, value;
    for (index = 0; index < lines_unique.length; ++index) 
    {
        value = lines_unique[index];
        if (value.includes(name)) 
        {
            results.push(value);
        }
    }

    var str_commands = "";

    if(typeof results == 'undefined' || results.length <= 0) 
    { 
        str_commands =  'No matches found.'; 
    }
    else 
    { 
     
        var arrTemp = [];
        for (var i_res=0; i_res < results.length; i_res++) 
        { 
            if(i_res <= la_limite)
            {
                arrTemp.push(results[i_res]);
            }
        }
        results = [];
        results = arrTemp;

        
        var arrRender = [];
        str_commands = "<table class=\"table  table-active\" cellpadding=\"3\" cellspacing=\"0\" border=\"0\" style=\"width: 67%; margin: 0 auto 2em auto;\"><thead><tr><th scope=\"col\"> Line</th><th scope=\"col\">Copy</th></tr></thead>";
        str_commands += "<tbody>";

        results.forEach((command, key_line) => 
        {
            var td1 = "<p><pre><code id=\"text__"+key_line+"\">"+command+"</pre></code></p>";
            var td2 = "<button type=\"button\" class=\"btn btn-success btn-sm\" onclick=\"copyToClipboard('#text__"+key_line+"')\">Copy</button>";

            td1.replace('\n', '<br>');
            td1.replace('#', '<br>#');
            td1.replace('$', '<br>$');
            
            str_commands += "<tr id=\"filter_global\" class=\"table-active\"></tr>" ;
            str_commands += "<tr>"+td1+"</tr>" ;
            str_commands += "<tr>"+td2+"</tr>" ;
            str_commands += "<tr></tr>" ;
            
        });
        str_commands += "</tbody></table>" ;
        
    }
    arr_return['str_commands'] = str_commands;

    return arr_return;

    //$return['exec'] = implode('', $return['exec']);
    //return json_encode($return, JSON_PRETTY_PRINT);
    //return json_encode($return);
    
}

// Return Error Function
function json_error(msg) {
    var arr_return = [];
    arr_return['error'] = true;
    arr_return['msg'] = msg;
    return arr_return;
    //return json_encode(arr_return);
}

module.exports = {
    ref_search: function(req, res) 
    {
        log("ref_search search-controller" );
        const ref_search_inputData = 
        {
            search_term: req.body.search_term,
            search_keyword: req.body.search_keyword,
            rendu_nbr: req.body.limit_sql
        };
        
        var termo = ref_search_inputData.search_term;
        var limito = ref_search_inputData.rendu_nbr;
        if(termo == 'Adam') 
        {
            var data_to_send=  Object.assign({}, json_success(termo));
        } 
        else 
        {
            var data_to_send=  Object.assign({}, json_success(termo, limito));
        }

        res.send(data_to_send);
    },
    display_search_Data: function(req, res) {
        res.render('crud_search')
    },
    send_to_file: function(req, res) {
        const name_file = req.params.name;
        res.sendFile(path.join(__dirname + './../data_files/' + name_file));
    },
    search_term_Data: function(req, res) {

        const inputData = {
            search_term: req.body.search_term,
            search_keyword: req.body.search_keyword,
            rendu_nbr: req.body.limit_sql
        };
        searchModel.search_term_Data(inputData, function(data) {
            console.log(" records found");
            //const avengers = ['thor', 'captain america', 'hulk'];
            data.forEach((item, index) => {
                if (item.best_match > 0) {
                    /*create dir if not exists*/
                    const dir = './data_files/';

                    if (!fs.existsSync(dir)) {
                        fs.mkdirSync(dir, {
                            recursive: true
                        });
                    }

                    /*unique file name*/
                    var uniqueFileName = item.id + ".js";
                    let url_path = './data_files/' + uniqueFileName;

                    let data_array = [];

                    data_array.push(item.id);
                    data_array.push(item.reg_date);
                    data_array.push(item.title);
                    /*CSS/JS/JSON/HTML/XML*/
                    const beautify = require('beautify');
                    item.description = beautify(item.description, {
                        format: 'js'
                    });
                    /* load the library and ALL languages
                    hljs = require('highlight.js');
                    item.description = hljs.highlightAuto(item.description).value;
                    */
                    data_array.push(item.description);
                    data_array.push(item.link);

                    /*create file if not exists*/
                    // Data which will write in a file.
                    let data = data_array.join('\n\n');

                    const the_path = require('path');

                    let baseDir = the_path.join(__dirname, 'public/data_files/');
                    let baseUrl = './../public/data_files/';

                    fs.open(baseUrl + uniqueFileName, 'wx', (err, desc) => {
                        if (!err && desc) {
                            fs.writeFile(desc, data, (err) => {
                                // Rest of your code
                                if (err) throw err;
                                log(chalk.yellow('search-controller search_term_Data Results Received'));
                            })
                        }
                    })

                    // Write data in 'Output.txt' .
                    //fs.writeFileSync(url_path, data);


                    fs.writeFile(url_path, data, function(err) {
                        if (err) {
                            return console.log(err);
                        }
                        log(chalk.yellow("The file was saved! :", uniqueFileName));

                    });

                    var myfile = url_path;
                    /*add new element to the object item */
                    item.href_to_file = myfile;
                    //console.log("data index, item");
                    //console.log(index, item);
                }

            })
            var view_switcher = req.body.limit_display;
            switch (view_switcher) {
                case "titles":
                    res.render('crud_titles', {
                        fetchData: data
                    });
                    break;
                case "titles_descriptions":
                    res.render('crud_titles_descriptions', {
                        fetchData: data
                    });
                    break;
                case "titles_links":
                    res.render('crud_titles_links', {
                        fetchData: data
                    });
                    break;
                case "all":
                    res.render('crud-table', {
                        fetchData: data
                    });
                    break;
                default:
                    res.render('crud-table', {
                        fetchData: data
                    });
            }

        });
    }
}