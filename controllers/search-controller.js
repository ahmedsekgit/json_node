var searchModel = require('../models/search-model');
var fs = require('fs');
var path = require('path');
var chalk = require('chalk');
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