var createModel = require('../models/create-model');
var json_create_model = require('../models/json_create_model');
var bkpHelper = require('../middlewares/bkp-helper');
var chalk = require('chalk');
var util = require('util');
var config = require('./../config');

const exec = util.promisify(require('child_process').exec);
const {
    execSync
} = require("child_process");

const log = console.log;

const fse = require('fs-extra');

var srcDir = '/db_bkps/';
var destDir = '/home/sea/the_db_news_bkp/';

function tryDbBkp(app_homedir) {
    try {
        var str_bkp = `mysqldump -u${config.database.user}  -p${config.database.password}  ${config.database.db} > ./db_bkps/bkp_${config.database.db}.sql`;
        log(chalk.yellow(" trying to backup ... :" + str_bkp));

        exec(str_bkp);
        // To copy a folder or file

        srcDir = app_homedir + srcDir;
        log(chalk.yellow(srcDir));
        log(chalk.yellow(destDir));
        fse.copySync(srcDir, destDir, {
            overwrite: true
        }, function(err) {
            if (err) {
                console.error(err);
            } else {
                log(chalk.yellow("success copyin db bkps to /home/sea/the_db_news_bkp!"));
            }
        });

    } catch (err) {
        console.error(err);
    };
};

module.exports = {
    crudForm: function(req, res) 
    {
        if (1/*req.session.loggedinUser*/)
        {
            res.render('crud-form');
        } 
        else 
        {
            req.session.return_to = '/form';
            res.redirect('/login');
        }
    },
    createData: function(req, res) {
        if (1/*req.session.loggedinUser*/) 
        {
            const inputData = 
            {
                title: req.body.title,
                description: req.body.description,
                link: req.body.link
            };
            /*work with json file or not*/
            let bool_json = config.JSON;
            if(bool_json)
            {
              let insertElem = json_create_model.createData(inputData) ;

                res.redirect('/links/show/' + insertElem.id);
                log(chalk.yellow(" json_create_model.createData last created id :"+insertElem.id));
            }
            else
            { 
                createModel.createData(inputData, function(data) 
                {
                    const app_homedir = req.app.locals.app_homedir;
                    tryDbBkp(app_homedir);
                    bkpHelper.tryDbBkp(app_homedir);
                    res.redirect('/links/show/' + data.insertId);
                    log(chalk.yellow(data.affectedRows + " record created"));

                });
            }
        } 
        else 
        {
            req.session.return_to = '/form';
            res.redirect('/login');
        }

    }
}