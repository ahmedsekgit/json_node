var updateModel = require('../models/update-model');
var json_update_model = require('../models/json_update_model');
var linkModel = require('../models/link-model');
var bkpHelper = require('../middlewares/bkp-helper');
var tsHelper = require('../middlewares/ts-helper-controller');
var fs = require('fs');
var path = require('path');
const util = require('util');
var beautify = require('beautify');
var config = require('./../config');

const exec = util.promisify(require('child_process').exec);
const {
    execSync
} = require("child_process");

var chalk = require('chalk');
const log = console.log;

const fse = require('fs-extra');

module.exports = {
    editData: function(req, res) {
        if (1/*req.session.loggedinUser*/) 
        {
            const editId = req.params.id;
            let bool_json = config.JSON;
            if(bool_json)
            {
              let arrData = json_update_model.editData(editId) ;
              res.render('crud-form', 
                    {
                        editData: arrData
                    });
                    log(chalk.yellow("json_update_model.editData " + editId));
            }
            else
            {
                

                updateModel.editData(editId, function(data) 
                {

                    res.render('crud-form', 
                    {
                        editData: data
                    });
                    log(chalk.yellow(data.affectedRows + " record fetched"));
                });
            }

        } 
        else 
        {
            const editId = req.params.id;
            req.session.return_to = '/edit/' + editId;
            res.redirect('/login');
        }
    },
    updateData: function(req, res) {
        const inputData = {
            title: req.body.title,
            description: req.body.description,
            link: req.body.link
        };
        const updateId = req.params.id;
        if (1 /*req.session.loggedinUser*/) 
        {       
            let bool_json = config.JSON;
            if(bool_json)
            {
              console.log(chalk.yellow('json_update_model: updateData:function(inputData, updateId)'));  
              var arrData = json_update_model.updateData(inputData, updateId) ;
                  if (typeof arrData == 'undefined') 
                  {

                    log(chalk.yellow('this Id is not yet registred :', updateId));
                    log(chalk.yellow('redirecting to /links/links-list ...'));
                    res.redirect('/links/links-list');
                    return;
                  } 
                  else /*we make file for the record*/ 
                  {
                        
                        res.redirect('/links/show/' + updateId);
                        log(chalk.yellow(arrData + " record updated"));

                  }
            }
            else
            {

                console.log(chalk.yellow('updateData: function(req, res)'));
                updateModel.updateData(inputData, updateId, function(data) 
                {

                const app_homedir = req.app.locals.app_homedir;
                
                console.log(chalk.yellow('app_homedir  =' + app_homedir));
                console.log(chalk.yellow('updateId   =' + updateId));
                bkpHelper.tryDbBkp(app_homedir);
                linkModel.showData(updateId, function(data) {

                    if (typeof data == 'undefined') {

                        log(chalk.yellow('this Id is not yet registred :', showId));
                        log(chalk.yellow('redirecting to /links/links-list ...'));
                        res.redirect('/links/links-list');
                        return;
                    } else /*we make file for the record*/ {
                        const dir = './data_files/';
                        if (!fs.existsSync(dir)) {
                            fs.mkdirSync(dir, {
                                recursive: true
                            });
                        }

                        /*unique file name*/

                        var uniqueFileName = `${config.database.db}_${config.database.table}` + '_' + data.id + ".py";
                        let url_path = './data_files/' + uniqueFileName;
                        log(chalk.yellow('update-controller updateData trying to file the record'));

                        log(chalk.yellow('file =' + url_path + ' exists? :' + fs.existsSync(url_path)));

                        var txt = "";

                        if (typeof data.description != 'undefined') {
                            txt += '==============================\n';
                            txt += data.title + '  \n';
                            txt += '==============================\n';

                            txt += data.description + '  \n';
                            txt += '==============================\n';
                            txt += data.id + ' at  ' + data.reg_date + '\n';
                            txt += '==============================\n';


                            fs.writeFile(url_path, txt, function(err) {
                                if (err) {
                                    return log(chalk.red(err));
                                }
                                log(chalk.yellow("update-controller updateData The file was saved even was there!" + url_path));
                            });


                            data.href_to_file = url_path;

                        }



                    }
                });
                res.redirect('/links/show/' + updateId);
                log(chalk.yellow(data.affectedRows + " record(s) updated"));
            });
            }
        } 
        else 
        {
            req.session.return_to = '/edit/' + updateId;
            res.redirect('/login');
        }
    }
}