var fs = require('fs');
var path = require('path');
const util = require('util');
var beautify = require('beautify');
var db = require('../database');
var config = require('./../config');
const mysql = require("mysql");
const createCsvWriter = require("csv-writer").createObjectCsvWriter;
const Json2csvParser = require("json2csv").Parser;

const exec = util.promisify(require('child_process').exec);
const {
    execSync
} = require("child_process");

var chalk = require('chalk');
const log = console.log;

const fse = require('fs-extra');

var srcDir = '/db_bkps/';
var destDir = '/home/sea/the_db_news_bkp/';

var arr_schema = ['id', 'keyword', 'link', 'title', 'description', 'reg_date'];
var dir_store = './db_bkps/json/';

module.exports = {
     tryDbBkp:function(app_homedir) {
    try {
        console.log(chalk.yellow('********* starting bkp-helper tryDbBkp:function(app_homedir) *********'));
        var str_bkp = `mysqldump -u${config.database.user}  -p${config.database.password}  ${config.database.db} > ./db_bkps/bkp_${config.database.db}_${config.database.table}.sql`;
        log(chalk.yellow(" trying to backup ... :" + str_bkp));
        console.log(chalk.yellow('app_homedir'));
        console.log(chalk.yellow(app_homedir));

        execSync(str_bkp);
        
          var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
            db.query(sql, function(err, data, fields) {
            if (err) throw err;
           
            const jsonData = JSON.parse(JSON.stringify(data));
      

            const json2csvParser = new Json2csvParser({ header: true});
            const csv = json2csvParser.parse(jsonData);

             var new_file_name = `bkp_${config.database.db}_${config.database.table}.json`;

              var txt = JSON.stringify(data, null, 2);

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

            fs.writeFile(`${app_homedir}/db_bkps/CSVs/bkp_${config.database.db}_${config.database.table}.csv`, csv, function(error) {
              if (error) throw error;
              /*console.log("Write to bezkoder_mysql_fs.csv successfully!");*/
              console.log(`Write to /db_bkps/CSVs/bkp_${config.database.db}_${config.database.table}.csv successfully!`);
            });
          });
          
        // To copy a folder or file

        srcDir = app_homedir + srcDir;
        log(chalk.yellow(srcDir));
        log(chalk.yellow(destDir));
        fse.copySync(srcDir, destDir, 
        {
            overwrite: true
        }, 
        function(err) 
        {
            if (err) 
            {
                console.error(err);
            } 
            else 
            {
                log(chalk.yellow("success copyin db bkps to /home/sea/the_db_news_bkp!"));
            }
        });

    } 
    catch (err)
    {
        console.error(err);
    }
        console.log(chalk.yellow('********* Ending bkp-helper tryDbBkp:function(app_homedir) *********'));

},

  unset_key_value:function(arr_objs, key) {
      var arrOutputTmp = new Array();

      arr_objs.forEach(function(data) {
          delete data[key];
          arrOutputTmp.push(data);
      });
      return arrOutputTmp;
  },
  cachingData_test_001: function(table,create=0) 
  {
    return 'bla bla bla';
  },

  cachingData: function(table,create=0) 
  {
        var arrOutput = new Array();
        var new_file_name = `bkp_${config.database.db}_${table}.json`;
  
        fileObjs = fs.readdirSync(dir_store, { withFileTypes: true });

            //listing all files using forEach
            fileObjs.forEach(function(fileObj) 
            {
                file = fileObj.name;
                // Do whatever you want to do with the file
                if (file == new_file_name) 
                {
                    const readFileLines = filename =>
                        fs.readFileSync(filename)
                        .toString('UTF8');

                    file_content = readFileLines(dir_store + '/' + file);

                    arrOutput = JSON.parse(file_content);

                        if(create == 1)
                        {
                            if (typeof file_content != 'undefined' &&
                                file_content != '' &&
                                file_content != null) 
                            {
                                /*creation temporary table for tests*/
                                tsModel.table.createTable(table,function(returned_data) 
                                {
                                    console.log(chalk.yellow('tsModel.table.createTable'));
                                    console.log('returned_data');
                                    console.dir(returned_data);

                                });
                                /*storing table data in database*/
                                let array = new Array();

                                array = unset_key_value(arrOutput, 'reg_date');

                                array = arrOutput.map(obj => Object.values(obj));

                                tsModel.table.createData(config.database.table, array, function(err, returned_data) 
                                {
                                    if (err) throw err;

                                    log(chalk.yellow(returned_data.affectedRows + " record created"));



                                });

                              }

                        }/*else*/

                }/*file == new_file_name*/
            });/*files.forEach(function(file) */
            return arrOutput;
       
    }/*cachingData: function*/
}

