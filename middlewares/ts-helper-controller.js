var fs = require('fs');
var path = require('path');
const util = require('util');
var beautify = require('beautify');
const Json2csvParser = require("json2csv").Parser;
const createCsvWriter = require("csv-writer").createObjectCsvWriter;
var tsModel = require('./ts-helper-model');
var config = require('./../config');
var chalk = require('chalk');
const log = console.log;

var arr_schema = ['id', 'keyword', 'link', 'title', 'description', 'reg_date'];
var dir_store = './db_bkps/json/';

function unset_key_value(arr_objs, key) {
    var arrOutputTmp = new Array();

    arr_objs.forEach(function(data) {
        delete data[key];
        arrOutputTmp.push(data);
    });
    return arrOutputTmp;
}

module.exports.table = {
    displayTest:function(text) {
        // display text as test
        console.log(chalk.yellow(' displayTest:function(text) ts-helper'));
        console.log('text');
        console.dir(text);
        return 1;

    },
     cleanText:function(text) {
        // clean it and return
    },

    isWithinRange(text, min, max) {
        // check if text is between min and max length
    },

    readData :function(table) {

        tsModel.table.readData(function(table,tsdata) 
            {
                console.log('tsModel.table.readData(function(table,tsdata)');
                tsdata.forEach(function(data) {
                    console.dir(data);

                });
            });
    },
    storeData: function(table) {
        var arrOutput = new Array();
        tsModel.table.readData(function(table, returned_data) 
        {
            console.log('tsModel.table.storeData(function(data)');
            returned_data.forEach(function(data) 
            {
                var objTemp = new Object();
                objTemp.id = null;
                objTemp.keyword = null;
                objTemp.link = null;
                objTemp.title = null;
                objTemp.description = null;
                objTemp.reg_date = null;
                for (let key in data) 
                {
                    if (arr_schema.includes(key)) 
                    {
                        objTemp[key] = data[key];
                    }
                }

                arrOutput.push(objTemp);

            });
            var new_file_name = `bkp_${config.database.db}_${config.database.table}.json`;

            var txt = JSON.stringify(arrOutput, null, 2);

            try {
                fs.writeFileSync(dir_store + new_file_name, txt, 'utf-8');
            } catch (err) {
                if (err.code === 'ENOENT') {
                    console.log('File not found!');
                } else {
                    fs.appendFileSync(dir_store + new_file_name + '__LOG__ERR__.txt', err);
                    return true;
                }
            }

        });

    },
    checkData: function(table,create=0) {
        var arrOutput = new Array();
        var new_file_name = `bkp_${config.database.db}_${table}.json`;

        fs.readdir(dir_store, function(err, files) {
            //handling error
            if (err) {
                return console.log('Unable to scan directory: ' + err);
            }
            //listing all files using forEach
            files.forEach(function(file) {
                // Do whatever you want to do with the file
                if (file == new_file_name) {
                    const readFileLines = filename =>
                        fs.readFileSync(filename)
                        .toString('UTF8');

                    file_content = readFileLines(dir_store + '/' + file);
                        if(create)
                        {
                            if (typeof file_content != 'undefined' &&
                                file_content != '' &&
                                file_content != null) {
                                /*creation temporary table for tests*/
                                tsModel.table.createTable(table,function(returned_data) {
                                    console.log(chalk.yellow('tsModel.table.createTable'));
                                    console.log('returned_data');
                                    console.dir(returned_data);

                                });
                        }


                        arrOutput = JSON.parse(file_content);
                        let array = new Array();
                        array = unset_key_value(arrOutput, 'reg_date');
                        array = arrOutput.map(obj => Object.values(obj));
                        console.log(chalk.yellow('----------array checkData ----------'));
                        tsModel.table.createData(config.database.table, array, function(err, returned_data) {
                            if (err) throw err;
                            console.log(chalk.yellow('returned_data.insertId ' + returned_data.insertId));

                            log(chalk.yellow(returned_data.affectedRows + " record created"));
                            console.log('returned_data');
                            console.dir(returned_data);


                        });

                    }

                }
            });
        });
    }
}