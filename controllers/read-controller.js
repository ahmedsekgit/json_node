var readModel = require('../models/read-model');
var json_read_model = require('../models/json_read_model');
var fs = require('fs');
var path = require('path');
const JsonSearch = require('search-array').default;

var chalk = require('chalk');
var config = require('./../config');
var path = require('path');
var bkpHelper = require('../middlewares/bkp-helper');

const log = console.log;
function records_to_files(data)
{
    data.forEach((item, index) => 
    {

        /*create dir if not exists*/
        const dir = './data_files/';

        if (!fs.existsSync(dir)) 
        {
            fs.mkdirSync(dir, 
            {
                recursive: true
            });
        }

        /*unique file name*/
        var uniqueFileName = `${config.database.db}_${config.database.table}` + '_' + item.id + ".py";
        let url_path = './data_files/' + uniqueFileName;
        //log(chalk.yellow('read-controller readData Results Received'));

        //log(chalk.yellow('file =' + url_path + ' exists? :' + fs.existsSync(url_path)));

        var txt = "";

        if (typeof item.description != 'undefined')
         {
            txt += '==============================\n';
            txt += item.title + '  \n';
            txt += '==============================\n';

            txt += item.description + '  \n';
            txt += '==============================\n';
            txt += item.id + ' at  ' + item.reg_date + '\n';
            txt += '==============================\n';

        }

        if (!fs.existsSync(url_path)) 
        {
            fs.writeFile(url_path, txt, function(err) 
            {
                if (err) {
                    return log(chalk.greenBright(err));
                }
                log(chalk.greenBright("read-controller readData The file was saved!" + url_path));
            });


        }
        let bool_json = config.JSON;
            if(bool_json)
            {
                data[index].href_to_file = "#";
            }
            else
            {
                data[index].href_to_file = url_path;
            }

    });
return data;
}
module.exports = {
    send_to_file: function(req, res) {
        const name_file = req.params.name;
        res.sendFile(path.join(__dirname + './../data_files/' + name_file));
    },
    readData: function(req, res) {
        if (1/*req.session.loggedinUser*/) 
        {
            /*work with json file or not*/
            let bool_json = config.JSON;
            if(bool_json)
            {
              let arrData = json_read_model.readData() ;
              arrRendered = records_to_files(arrData);
                         res.render('crud-table', 
                            {
                                fetchData: arrRendered
                            });
            }
            else
            {
                var tmp_table = config.database.table;

                var arr_cache_data = bkpHelper.cachingData(tmp_table,0);

                var arrRendered = [];
                if(arr_cache_data.length>0)
                {
                         arrRendered = records_to_files(arr_cache_data);
                         res.render('crud-table', 
                            {
                                fetchData: arrRendered
                            });
                }   
                else
                { 
                    readModel.readData(function(data) 
                    {
                         arrRendered = records_to_files(data);
                         res.render('crud-table', 
                            {
                                fetchData: arrRendered
                            });
                    });/*end read model*/
                }
            }
            

        } 
        else 
        {
            req.session.return_to = '/read';
            res.redirect('/login');
        }

    }
}