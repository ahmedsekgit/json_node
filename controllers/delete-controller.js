var deleteModel = require('../models/delete-model');
var json_delete_model = require('../models/json_delete_model');
var config = require('./../config');
var chalk = require('chalk');
const log = console.log;

module.exports = {
    deleteData: function(req, res) {
        if (1/*req.session.loggedinUser*/) 
        {
            const deleteId = req.params.id;
            let bool_json = config.JSON;
            if(bool_json)
            {
              let arrData = json_delete_model.deleteData(deleteId) ;
              log(chalk.yellow("json record deleted records left : "+ arrData.length));
              res.redirect('/');
            }
            else
            {
                
                deleteModel.deleteData(deleteId, function(data) {

                    log(chalk.yellow(data.affectedRows + " record deleted"));
                    res.redirect('/read');
                });
            }
        } 
        else 
        {
            req.session.return_to = '/links/show/' + deleteId;
            res.redirect('/login');
        }
    }
}