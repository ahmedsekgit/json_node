var linkModel = require('../models/link-model');
var json_read_model = require('../models/json_read_model');
var fs = require('fs');
var path = require('path');
var beautify = require('beautify');
var sql_formatter = require('sql-formatter');
var reserved = require('reserved');
const readline = require("readline");
var config = require('./../config');
var bkpHelper = require('../middlewares/bkp-helper');

var chalk = require('chalk');
var redis = require('redis');
var db_port = config.database.port;
var db_host = config.database.host;
var db_name = config.database.db;
var db_table = config.database.table;
//var redisClient = redis.createClient(3333);

const log = console.log;

function internal_sub(str, tag, antiTag) {
    var arr = [];
    var SubStrHtml_start = str.substring(0,
        str.indexOf(tag) + tag.length);

    arr.push(SubStrHtml_start);

    var SubStrScript = str.substring(
        str.indexOf(tag) + tag.length,
        str.lastIndexOf(antiTag));

    arr.push(SubStrScript);

    var SubStrHtml_end = str.substring(
        str.lastIndexOf(antiTag),
        str.length);

    arr.push(SubStrHtml_end);

    return arr;

}

function internal_format(str, bool_htm = 0) {


    if (typeof(str) != 'undefined') {
        var htmlstr = str;

        htmlstr = htmlstr.split(/\>[ ]?\</).join(">\n<");
        if (bool_htm) {
            htmlstr = htmlstr.split(/([*]?\{|\}[*]?\{|\}[*]?)/).join("\n");
        }

        htmlstr = htmlstr.split(/[*]?\;/).join("\;\n    ");
        return htmlstr;
    }

}
function reformat_record_to_file(data, app_homedir)
{
            if (typeof data == 'undefined') 
            {

                log(chalk.yellow('this Id is not yet registred :', showId));
                log(chalk.yellow('redirecting to /links/links-list ...'));
                res.redirect('/links/links-list');
                return;
            }
            data.title = data.title.replace(/code-examples/gi, "");
            /*
            data.description = data.description.replace(/\/\/+/gi, " \n\/\/ ");
            */

            data.description = data.description.trim();

            var index_js = data.title.trim().startsWith("js ");
            if (index_js) 
            {
                var tmp_description = data.description;
                var arr = internal_sub(tmp_description, '<script>', '<\/script>');
                data.description = beautify(arr[1], {
                    format: 'js'
                });
                var concat = arr[0] + '...code area...' + arr[2];
                data.description = data.description + beautify(concat, {
                    format: 'html'
                });
            }

            var index_jquery = data.title.trim().startsWith("jquery ");
            if (index_jquery && db_name != 'db_jquery') 
            {
                var tmp_description = data.description;
                var arr = internal_sub(tmp_description, '<script>', '<\/script>');
                data.description = beautify(arr[1], {
                    format: 'js'
                });
                var concat = arr[0] + '...code area...' + arr[2];
                data.description = data.description + beautify(concat, {
                    format: 'html'
                });
            }

            var index_java = data.title.trim().startsWith("java ");
            if (index_java) 
            {
                data.description = beautify(data.description, {
                    format: 'js'
                });
            }

            var index_python = data.title.trim().startsWith("python ");
            if (index_python) 
            {
                data.description = beautify(data.description, {
                    format: 'js'
                });
            }

            var index_php = data.title.trim().startsWith("php ");
            if (index_php) 
            {
                data.description = data.description;
            }

            var index_bs = data.title.trim().startsWith("bs ");
            if (index_bs) 
            {
                data.description = beautify(data.description, {
                    format: 'html'
                });
            }

            var index_css = data.title.trim().startsWith("css ");
            if (index_css) 
            {
                data.description = beautify(data.description, {
                    format: 'css'
                });
            }

            var index_css3 = data.title.trim().startsWith("css3 ");
            if (index_css3) 
            {
                data.description = beautify(data.description, {
                    format: 'css'
                });
            }

            var index_sql = data.title.trim().startsWith("sql ");
            if (index_sql) 
            {
                try {
                    data.description = sql_formatter.format(data.description);

                } catch {
                    data.description = data.description.trim();
                }
            }



            switch (db_name) 
            {
                case "db_test":
                    data.description = data.description;
                    break;
                case "db_javascript":
                    data.description = data.description.replace(/\^((ftp|http|https):)\/\/+/gi, " \n\/\/ ");
                    data.description = data.description.replace(/\/\/+/gi, " \n\/\/ ");
                    data.description = data.description.replace(/\;+/gi, " \;\n  ");
                    data.description = data.description.replace(/var /gi, " \n var ");
                    data.description = data.description.replace(/const /gi, " \n const ");
                    data.description = data.description.replace(/function /gi, " \n function ");
                    data.description = beautify(data.description, {
                        format: 'js'
                    });
                    break;
                case "db_shell":
                    data.description = data.description.replace(/\^((ftp|http|https):)\/\/+/gi, " \n\/\/ ");
                    data.description = data.description.replace(/\#+/gi, " \n\# ");
                    data.description = data.description.replace(/\$+/gi, " \n\$  ");
                    data.description = data.description.replace(/\;+/gi, " \;\n  ");
                    data.description = data.description.replace(/\.\^(js|sh|php|bash|txt|java|python|cache|log)/gi, " \.\n  ");
                    data.description = data.description.replace(/\^(\#|\$)[*]?git/gi, "\n git ");

                    data.description = beautify(data.description, {
                        format: 'css'
                    });
                    break;
                case "db_java":
                    data.description = beautify(data.description, {
                        format: 'js'
                    });
                    break;
                case "db_php":
                    data.description = beautify(data.description, {
                        format: 'css'
                    });
                    break;
                case "db_html":
                    data.description = beautify(data.description, {
                        format: 'html'
                    });
                    break;
                case "db_cpp":
                    data.description = beautify(data.description, {
                        format: 'js'
                    });
                case "db_css":
                    data.description = beautify(data.description, {
                        format: 'css'
                    });
                case "db_sql":
                    try {
                        data.description = sql_formatter.format(data.description);
                    } catch {
                        data.description = data.description.trim();
                    }
                    case "db_python":
                        data.description = beautify(data.description, {
                            format: 'js'
                        });
                    case "db_jquery":
                        data.description = beautify(data.description, {
                            format: 'js'
                        });
                    case "db_node":
                        data.title = data.title.replace(/frameworks nodejs/g, "");
                        data.description = beautify(data.description, {
                            format: 'js'
                        });
            }

            let dir = '/data_files/';
            var uniqueFileName = `${config.database.db}_${config.database.table}` + '_' + data.id + ".py";

            if (fs.existsSync(app_homedir + dir + uniqueFileName)) 
            {
                const href_to_file = '.' + dir + uniqueFileName;

                let data_tmp = fs.readFileSync(app_homedir + dir + uniqueFileName).toString();
                let Nb_line = data_tmp.split('\n').length;
                log(chalk.yellow('link-controller showData file exists : ' + app_homedir + dir + uniqueFileName));
                log(chalk.yellow('link-controller showData file Nb_line : ' + Nb_line));

                data.href_to_file = href_to_file;

            } 
            else 
                /*we make file for the record*/ 
            {

                const dir = './data_files/';

                if (!fs.existsSync(dir)) 
                {
                    fs.mkdirSync(dir, {
                        recursive: true
                    });
                }

                /*unique file name*/

                var uniqueFileName = `${config.database.db}_${config.database.table}` + '_' + data.id + ".py";
                let url_path = './data_files/' + uniqueFileName;
                log(chalk.yellow('link-controller showData trying to file the record'));

                log(chalk.yellow('file =' + url_path + ' exists? :' + fs.existsSync(url_path)));

                var txt = "";

                if (typeof data.description != 'undefined') 
                {
                    txt += '==============================\n';
                    txt += data.title + '  \n';
                    txt += '==============================\n';

                    txt += data.description + '  \n';
                    txt += '==============================\n';
                    txt += data.id + ' at  ' + data.reg_date + '\n';
                    txt += '==============================\n';


                    fs.writeFile(url_path, txt, function(err) 
                    {
                        if (err) 
                        {
                            return log(chalk.red(err));
                        }
                        log(chalk.yellow("link-controller showData The file was saved!" + url_path));
                    });


                    data.href_to_file = url_path;

                }

            }
    return data;

}

module.exports = {
    send_to_file: function(req, res) {
        const name_file = req.params.name;
        res.sendFile(path.join(__dirname + './../data_files/' + name_file));
    },
    showData: function(req, res) {

        const showId = req.params.id;
        const app_homedir = req.app.locals.app_homedir;
        
        var tmp_table = config.database.table;
        var objRendered = new Object();
        let bool_json = config.JSON;
        if(bool_json)
        {
          let arrData = json_read_model.readDataId(showId) ;
          if(typeof arrData != 'undefined')
            {
              arrData.href_to_file = "#";
              var arrRendered = arrData;

                    arrRendered.title = arrRendered.title.replace(/code-examples/gi, "");
                    arrRendered.title = arrRendered.title.replace(/frameworks  nodejs/gi, "");
                    arrRendered.title = arrRendered.title.trim();
                    arrRendered.description = beautify(arrRendered.description, {
                        format: 'html'
                    });
                
              //objRendered = reformat_record_to_file(arrData,app_homedir);
                     res.render('link-form', 
                        {
                            showData: arrRendered
                        });
            }
            else
            {
                log(chalk.yellow("json record id not found: "+ showId));
                res.redirect('/');
            }
        }
        else
        {
            
            var arr_cache_data = bkpHelper.cachingData(tmp_table,0);

            var obj_showId = arr_cache_data.find(o => o.id == showId);
            
            if(typeof obj_showId != 'undefined')
            {
                     objRendered = reformat_record_to_file(obj_showId,app_homedir);
                     res.render('link-form', 
                        {
                            showData: objRendered
                        });   
            }   
            else
            { 
               
                    linkModel.showData(showId, function(data) 
                    {
                         objRendered = reformat_record_to_file(data,app_homedir);
                         res.render('link-form', 
                            {
                                showData: objRendered
                            });
                    });/*end read model*/
            }
            
        }/*show from json*/  
    },
    search_term_Data: function(req, res) {

        const inputData = {
            search_term: req.body.search_term,
            search_keyword: req.body.search_keyword,
            rendu_nbr: req.body.limit_sql
        };
        /*work with json file*/
        let bool_json = config.JSON;
        if(bool_json)
        {
            let arrData = json_read_model.search_term_Data(inputData) ;
            let data_array = arrData["data"];
            var data_ids = [];
            for (var i = 0; i < data_array.length; i++) 
            {
                let item = data_array[i];
                data_ids.push(item.id);

            }
            
            var data_to_send = 
                    [{
                        selected_link_ids: '',
                        keywords_link_vals: arrData['keywords_vals']
                    }];
            if (typeof data_ids != 'undefined' && data_ids.length > 0) 
            {
                // the array is defined and has no elements
                data_to_send[0].selected_link_ids = data_ids.join(',');
            }
        
                res.json(data_to_send);
        }
        else
         
        {
            linkModel.search_term_Data(inputData, function(data) {
                    log(chalk.yellow(" records found search_term_Data link controller"));
                    var data_ids = [];
                    var data_temp = [];
                    var data_to_send = [{
                        selected_link_ids: '',
                        keywords_link_vals: data['keywords_vals']
                    }];
        
                    data.forEach((item, index) => {
                        if (item.best_match > 0) {
                            let data_array = [];
                            data_array.push(item.id);
                            data_ids.push(item.id);
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
        
                            data_temp.push(data_array.join('\n\n'));
        
                        }
        
                    }) /*end data foreach*/
        
        
                    if (typeof data_ids != 'undefined' && data_ids.length > 0) {
                        // the array is defined and has no elements
                        data_to_send[0].selected_link_ids = data_ids.join(',');
                    }
        
                    res.json(data_to_send);
                    //res.send(JSON.stringify(data_to_send));
                }); /*linkModel.search_term_Data*/
        }/*else json*/
    },
    /*search_term_Data*/


    showLinksList: function(req, res) 
    {
            let bool_json = config.JSON;
            if(bool_json)
            {
              let arrData = json_read_model.readData() ;
              var arrRendered = arrData;
                for (var key in arrRendered) 
                {
                    arrRendered[key].title = arrRendered[key].title.trim();
                    arrRendered[key].title = arrRendered[key].title.replace(/code-examples/gi, "");
                    arrRendered[key].title = arrRendered[key].title.replace(/frameworks  nodejs/gi, "");
                    arrRendered[key].title = arrRendered[key].title.trim();
                    /*arrRendered[key].description = beautify(arrRendered[key].description, {
                        format: 'js'
                    });*/
                }
                res.render('links-list', 
                {
                            title: 'links List',
                            linkData: arrRendered
                });

            }
            else
            {  
                var tmp_table = config.database.table;
                var arr_cache_data = bkpHelper.cachingData(tmp_table,0);
                 if(arr_cache_data.length>0)
                    {
                            for (var key in arr_cache_data) 
                            {
                                arr_cache_data[key].title = arr_cache_data[key].title.trim();
                                arr_cache_data[key].title = arr_cache_data[key].title.replace(/code-examples/gi, "");
                                arr_cache_data[key].title = arr_cache_data[key].title.replace(/frameworks  nodejs/gi, "");
                                arr_cache_data[key].title = arr_cache_data[key].title.trim();
                                /*
                                arr_cache_data[key].description = beautify(arr_cache_data[key].description, {
                                    format: 'js'
                                });*/
                                arr_cache_data[key].description = arr_cache_data[key].description;
                            }
                            res.render('links-list', 
                            {
                                        title: 'links List',
                                        linkData: arr_cache_data
                            });
                    }   
                    else
                    { 
                        linkModel.showLinksList(function(data) 
                        {
                            for (var key in data) 
                            {
                                data[key].title = data[key].title.trim();
                                data[key].title = data[key].title.replace(/code-examples/gi, "");
                                data[key].title = data[key].title.replace(/frameworks  nodejs/gi, "");
                                data[key].title = data[key].title.trim();
                                data[key].description = beautify(data[key].description, {
                                    format: 'js'
                                });
                            }
                            res.render('links-list', 
                            {
                                        title: 'links List',
                                        linkData: data
                            });
                        });
                    }
            }/*end bool_json*/
    } /*showLinksList*/


}