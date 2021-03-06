============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 1
============================================================
file: create-controller.js
============================================================
content: var createModel = require('../models/create-model');
var  chalk  = require('chalk');
const log = console.log;

module.exports = {
    crudForm: function(req, res) 
    {
        if (req.session.loggedinUser) 
        {
            res.render('crud-form');
        } 
        else 
        {
            req.session.return_to = '/form';
            res.redirect('/login');
        }
    },
    createData: function(req, res) 
    {
        if (req.session.loggedinUser) 
        {
            const inputData = 
            {
                email: req.body.email_address,
                title: req.body.title,
                description: req.body.description,
                link: req.body.link
            };
            createModel.createData(inputData, function(data) 
            {
                res.redirect('/links/show/' + data.insertId);
                log(chalk.yellow(data.affectedRows + " record created"));

            });
        } 
        else 
        {
            req.session.return_to = '/form';
            res.redirect('/login');
        }

    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 2
============================================================
file: crud-controller.js
============================================================
content: var crudModel = require('../models/crud-model');
module.exports = {

    crudForm: function(req, res) {
        res.render('crud-operation');
    },
    createCrud: function(req, res) {

        const createData = crudModel.createCrud();
        res.send('<h1>' + createData + '</h1>');

    },
    fetchCrud: function(req, res) {

        const fetchData = crudModel.fetchCrud();
        res.send('<h1>' + fetchData + '</h1>');

    },
    editCrud: function(req, res) {

        const editId = req.params.id;
        const editData = crudModel.editCrud(editId);
        res.render('crud-operation', {
            editData: editData,
            editId: editId
        });
    },
    UpdateCrud: function(req, res) {

        const updateId = req.params.id;
        const updateData = crudModel.UpdateCrud(updateId);
        res.send('<h1>' + updateData + '</h1>');

    },
    deleteCrud: function(req, res) {

        const deleteId = req.params.id;
        const deleteData = crudModel.deleteCrud(deleteId);
        res.send('<h1>' + deleteData + '</h1>');

    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 3
============================================================
file: crud_mongo_controller.js
============================================================
content: var crud_mongo_model = require('../models/crud_mongo_model');
console.log("crud_mongo_model");
console.dir(crud_mongo_model);
module.exports = {
    userForm: function(req, res) {
        res.render('crud_mongo_form')
    },
    createData: function(req, res) {
        var inputData = req.body;

        crud_mongo_model.createData(inputData, function(data) {
            res.render('crud_mongo_form')
            console.log(" record was created");
        });
    },
    fetchData: function(req, res) {

        crud_mongo_model.fetchData(function(data) {
            res.render('crud_mongo_list', {
                userData: data
            });
        })
    },
    editData: function(req, res) {
        var editId = req.params.id;
        crud_mongo_model.editData(editId, function(data) {
            res.render('crud_mongo_form', {
                userData: data
            });
        })
    },
    updateData: function(req, res) {
        var inputData = req.body;
        var editId = req.params.id;
        crud_mongo_model.updateData(inputData, editId, function(data) {
            res.redirect('/crud_mongo/data-list_mongo')
            console.log(" record was updated");
        });
    },
    deleteData: function(req, res) {

        var deleteId = req.params.id;
        crud_mongo_model.deleteData(deleteId, function(data) {
            res.redirect('/crud_mongo/data-list_mongo')
            console.log(" record was deleted");
        });
    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 4
============================================================
file: delete-controller.js
============================================================
content: var deleteModel = require('../models/delete-model');
var  chalk  = require('chalk');
const log = console.log;

module.exports = {
    deleteData: function(req, res) {
        if (req.session.loggedinUser) {
            const deleteId = req.params.id;
            deleteModel.deleteData(deleteId, function(data) {
                
                log(chalk.yellow(data.affectedRows + " record deleted"));
                res.redirect('/read');
            });

        } else 
        {
            req.session.return_to ='/links/show/' + deleteId;
            res.redirect('/login');
        }
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 5
============================================================
file: fetch-controller.js
============================================================
content: var fetchModel = require('../models/fetch-model');


module.exports = {

    fetchData: function(req, res) {

        fetchModel.fetchData(function(data) {
            res.render('user-table', {
                userData: data
            });
        });
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 6
============================================================
file: file-controller.js
============================================================
content: var fileModel = require('../models/file-model');
var beautify = require('beautify');
var fs = require('fs');
var path = require('path');
var decode = require('decode-html');
var nl2br = require('nl2br');
var util = require('util');
const querystring = require('querystring');
var  chalk  = require('chalk');
const log = console.log;

function encodeHash(text) {
    return encodeURIComponent(text.replace(/\u200B/g, "\u200B\u200B").replace(/#/g, "\u200B???").replace(/%/g, "\u200B???"));
}

function decodeHash(text) {
    return text.replace(/(?:%[a-f0-9]+)+/gim, function(t) {
        try {
            return decodeURIComponent(t)
        } catch (ex) {
            return t
        }
    }).replace(/\u200B???/g, "%").replace(/\u200B???/g, "#").replace(/\u200B\u200B/g, "\u200B");
}

function readFiles(path) {

    let url_path = path;
    const files = fs.readdirSync(url_path)

    var n = files.length;

    const sample = [];
    var i = 1;

    var data_content;

    for (const file of files) {

        const readFileLines = filename =>
            fs.readFileSync(filename)
            .toString('UTF8');

        file_content = readFileLines(url_path + '/' + file);
        file_content = file_content.substring(file.length, file_content.length);


        file_to_raplace = file.replace(/phptryit\.asp\?filename=try/g, "");

        file_to_raplace = file_to_raplace.replace(/tryit\.asp\?filename=try/g, "");

        file_to_raplace = file_to_raplace.replace(/tryjava\.asp\?filename=/g, " java ");

        file_to_raplace = file_to_raplace.replace(/trypython\.asp\?filename=/g, " python ");

        file_to_raplace = file_to_raplace.replace(/trysql\.asp\?filename=/g, "");

        file_to_raplace = file_to_raplace.replace(/trysql/g, " sql ");
        file_to_raplace = file_to_raplace.replace(/__code-examples__javascript__frameworks__/g, "");

        file_to_raplace = file_to_raplace.replace(/_/g, " ");
        file_to_raplace = file_to_raplace.replace(/\.[^.]+$/, '');
        file_to_raplace = decode(file_to_raplace);
        file_to_raplace = decodeHash(file_to_raplace);



        file_content = decode(file_content);
        file_content = decodeHash(file_content);

        /*file_content = decodeURIComponent(file_content);*/

        //file_content = querystring.decode(file_content); 

        // Non-XHTML Way
        //file_content = nl2br(file_content, false);

        /*
        file_content = file_content.replace(/s{2,}/g,' ').trim();
        file_content = file_content.replace(/\/\/+/gi,"$$");
        */
        /*CSS/JS/JSON/HTML/XML*/
        //file_content = beautify(file_content, {format: 'js'});

        sample.push({
            id: i,
            title: file_to_raplace,
            description: file_content.toString()
        });
        i++;
    } /*end for parcour files*/
    return sample;
}

module.exports = {

    readData: function(req, res) {
        if (req.session.loggedinUser) {
            fileModel.readData(function(data) {

                let url_path = './work_on_files/jquery_q_r';
                var sample = readFiles(url_path);

                res.render('files_list', {
                    fileData: sample
                });
            });
        } else {
            req.session.return_to ='/file/files';
            res.redirect('/login');
        }
    },
    checkData: function(req, res) {

        fileModel.readData(function(data) {
            res.render('files_list', {
                fileData: data
            });
        });

    },
    storeData: function(req, res) {
        if (req.session.loggedinUser) {
            let url_path = './work_on_files/jquery_q_r';
            var sample = readFiles(url_path);

            var unefois = 1;
            if (sample.length != 0) {
                sample.forEach(function(sample_row_data) {
                    const inputData = {
                        title: sample_row_data.title,
                        description: sample_row_data.description
                    };

                    fileModel.storeData(sample_row_data, function(returned_data) {
                        //console.log(returned_data.affectedRows + " record created");
                    });

                });
            } else {
                log(chalk.yellow('No Data Found'));
                log(chalk.yellow(console.dir(sample)));
            }
        } else {
            req.session.return_to ='/file/checkData';
            res.redirect('/login');
        }
    } /*fin de la storeData*/


} /*fin de l export*/
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 7
============================================================
file: image-controller.js
============================================================
content: var multer = require('multer');

var imageMiddleware = require('../middlewares/image-middleware');
var imageModel = require('../models/image-model');

module.exports = {
    imageUploadForm: function(req, res) {
        res.render('upload-form');
    },
    storeImage: function(req, res) {
        var upload = multer({
            storage: imageMiddleware.image.storage(),
            allowedImage: imageMiddleware.image.allowedImage
        }).single('image');
        upload(req, res, function(err) {
            if (err instanceof multer.MulterError) {
                res.send(err);
            } else if (err) {
                res.send(err);
            } else {
                // store image in database
                var imageName = req.file.originalname;
                var inputValues = {
                    image_name: imageName
                }
                // call model
                imageModel.storeImage(inputValues, function(data) {
                    res.render('upload-form', {
                        alertMsg: data
                    })
                })

            }

        })

    },
    displayImage: function(req, res) {
        imageModel.displayImage(function(data) {
            res.render('display-image', {
                imagePath: data
            })
        })

    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 8
============================================================
file: link-controller.js
============================================================
content: var linkModel = require('../models/link-model');
var fs = require('fs');
var path = require('path');
var beautify = require('beautify');
var sql_formatter = require('sql-formatter');
var reserved = require('reserved');
const readline = require("readline");
var config = require('./../config');
var  tableFromNpm  = require('table');
var  chalk  = require('chalk');
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


module.exports = {
    send_to_file: function(req, res) {
        const name_file = req.params.name;
        res.sendFile(path.join(__dirname + './../data_files/' + name_file));
    },
    showData: function(req, res) {

        const showId = req.params.id;
        const app_homedir = req.app.locals.app_homedir;

        linkModel.showData(showId, function(data) {
            
            if(typeof data =='undefined')
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
            if (index_js) {
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
            if (index_jquery) {
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
            if (index_java) {
                data.description = beautify(data.description, {
                    format: 'js'
                });
            }

            var index_python = data.title.trim().startsWith("python ");
            if (index_python) {
                data.description = beautify(data.description, {
                    format: 'js'
                });
            }

            var index_php = data.title.trim().startsWith("php ");
            if (index_php) {
                data.description = data.description;
            }

            var index_bs = data.title.trim().startsWith("bs ");
            if (index_bs) {
                data.description = beautify(data.description, {
                    format: 'html'
                });
            }

            var index_css = data.title.trim().startsWith("css ");
            if (index_css) {
                data.description = beautify(data.description, {
                    format: 'css'
                });
            }

            var index_css3 = data.title.trim().startsWith("css3 ");
            if (index_css3) {
                data.description = beautify(data.description, {
                    format: 'css'
                });
            }

            var index_sql = data.title.trim().startsWith("sql ");
            if (index_sql) {
                try {
                    data.description = sql_formatter.format(data.description);

                } catch {
                    data.description = data.description.trim();
                }
            }

            let db_name = config.database.db;

            switch (db_name) {
                case "db_test":
                    data.description =data.description;
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
                    case "db_node":
                        data.title = data.title.replace(/frameworks nodejs/g, "");
                        data.description = beautify(data.description, {
                            format: 'js'
                        });
                }

            let dir = '/data_files/';
            var uniqueFileName = `${config.database.db}_${config.database.table}`+'_'+data.id + ".py";

            if (fs.existsSync(app_homedir + dir + uniqueFileName)) 
            {
                const href_to_file = '.' + dir + uniqueFileName;

                let data_tmp = fs.readFileSync(app_homedir + dir + uniqueFileName).toString();
                let Nb_line = data_tmp.split('\n').length;
                log(chalk.yellow('link-controller showData file exists : ' + app_homedir + dir + uniqueFileName));
                log(chalk.yellow('link-controller showData file Nb_line : ' +Nb_line));
            
                data.href_to_file = href_to_file;
                
            }

            res.render('link-form', {
                showData: data
            });
            //console.log(data.affectedRows + " record fetched link controller");
        });
    },
    search_term_Data: function(req, res) {

        const inputData = {
            search_term: req.body.search_term,
            search_keyword: req.body.search_keyword,
            rendu_nbr: req.body.limit_sql
        };
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
    }, /*search_term_Data*/


    showLinksList: function(req, res) {

        linkModel.showLinksList(function(data) {
            for (var key in data) 
            {
                data[key].title = data[key].title.trim();
                data[key].title = data[key].title.replace(/code-examples/gi, "");
                data[key].title = data[key].title.replace(/frameworks  nodejs/gi, "");
                data[key].title = data[key].title.trim();
            }

            res.render('links-list', 
            {
                title: 'links List',
                linkData: data
            });
        });
    } /*showLinksList*/

}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 9
============================================================
file: read-controller.js
============================================================
content: var readModel = require('../models/read-model');
var fs = require('fs');
var path = require('path');
var  chalk  = require('chalk');
var config = require('./../config');
var path = require('path');
const log = console.log;

module.exports = {
    send_to_file: function(req, res) {
        const name_file = req.params.name;
        res.sendFile(path.join(__dirname + './../data_files/' + name_file));
    },
    readData: function(req, res) {
        if (req.session.loggedinUser) {
            readModel.readData(function(data) {

                data.forEach((item, index) => {

                    /*create dir if not exists*/
                    const dir = './data_files/';

                    if (!fs.existsSync(dir)) {
                        fs.mkdirSync(dir, {
                            recursive: true
                        });
                    }

                    /*unique file name*/
                    var uniqueFileName = `${config.database.db}_${config.database.table}`+'_'+item.id + ".py";
                    let url_path = './data_files/' + uniqueFileName;
                    log(chalk.yellow('read-controller readData Results Received'));
                    
                    log(chalk.yellow('file ='+url_path + ' exists? :'  + fs.existsSync(url_path)));

                    var txt = "";

                    if (typeof item.description !='undefined') 
                    {
                        txt += '==============================\n'; 
                        txt += item.title + '  \n';
                        txt += '==============================\n'; 

                        txt += item.description + '  \n';
                        txt += '==============================\n'; 
                        txt += item.id + ' at  '+ item.reg_date + '\n'; 
                        txt += '==============================\n';    

                    }

                    if(!fs.existsSync(url_path))
                    {
                        let baseUrl = './../public/data_files/';

                        fs.open(baseUrl + uniqueFileName, 'wx', (err, desc) => {
                            if (!err && desc) {
                                fs.writeFile(desc, txt, (err) => {
                                    // Rest of your code
                                    if (err) throw err;
                                    log(chalk.greenBright('read-controller readData Results Received'));
                                })
                            }
                        })

                        // Write data in 'Output.txt' .
                        //fs.writeFileSync(url_path, data);


                        fs.writeFile(url_path, txt, function(err) {
                            if (err) {
                                return log(chalk.greenBright(err));
                            }
                            log(chalk.greenBright("read-controller readData The file was saved!" + url_path));
                        });


                    }

                    data[index].href_to_file = url_path;

                })

                res.render('crud-table', {
                    fetchData: data
                });
            });
        } else {
            req.session.return_to ='/read';
            res.redirect('/login');
        }

    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 10
============================================================
file: search-controller.js
============================================================
content: var searchModel = require('../models/search-model');
var fs = require('fs');
var path = require('path');
var  chalk  = require('chalk');
const log = console.log;


module.exports = {
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
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 11
============================================================
file: update-controller.js
============================================================
content: var updateModel = require('../models/update-model');
var fs = require('fs');
var path = require('path');
var beautify = require('beautify');
var  chalk  = require('chalk');
const log = console.log;

module.exports = {
    editData: function(req, res) {
        if (req.session.loggedinUser) {

            const editId = req.params.id;

            updateModel.editData(editId, function(data) {

                /*CSS/JS/JSON/HTML/XML*/
                data.description = beautify(data.description, {
                    format: 'html'
                });
                /*load the library and ALL languages
                hljs = require('highlight.js');
                data.description = hljs.highlightAuto(data.description).value;
                */

                res.render('crud-form', {
                    editData: data
                });
                log(chalk.yellow(data.affectedRows + " record fetched"));
            });
        } else {
            const editId = req.params.id;
            req.session.return_to ='/edit/'+editId;
            res.redirect('/login');
        }
    },
    updateData: function(req, res) {
        if (req.session.loggedinUser) {
            const inputData = {
                title: req.body.title,
                description: req.body.description,
                link: req.body.link
            };
            const updateId = req.params.id;
            updateModel.updateData(inputData, updateId, function(data) {

                res.redirect('/links/show/' + updateId);
                log(chalk.yellow(data.affectedRows + " record(s) updated"));
            });
        } else {
            req.session.return_to ='/edit/'+updateId;
            res.redirect('/login');
        }
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 12
============================================================
file: update-mongo-controller.js
============================================================
content: var update_mongo_Model = require('../models/update-mongo-model');
module.exports = {

    editData: function(req, res) {
        var editId = req.params.id;
        update_mongo_Model.editData(editId, function(data) {
            res.render('user-mongo-form', {
                userData: data
            });
        })
    },
    updateData: function(req, res) {
        var inputData = req.body;
        var editId = req.params.id;
        update_mongo_Model.updateData(inputData, editId, function(data) {
            res.redirect('/user/data-list')
            console.log(data.affectedRows + " record was updated");
        });
    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__controllers__
============================================================
============================================================
id: 13
============================================================
file: user-controller.js
============================================================
content: var insertModel = require('../models/user-model');

module.exports = {
    userForm: function(req, res) {
        res.render('user-form')
    },
    createData: function(req, res) {
        var inputData = req.body;
        insertModel.createData(inputData, function(data) {
            res.render('user-form')
            console.log(" record was created");
        });
    }
}
============================================================


