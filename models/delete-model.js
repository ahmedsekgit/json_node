var db = require('../database');
var config = require('./../config');
var  chalk  = require('chalk');
const log = console.log;

module.exports = {
    deleteData: function(deleteId, callback) {

       log(chalk.yellow('delete-model deleteData this Id is a deleted id :', deleteId)); 

        var sql = `DELETE FROM ${config.database.db}.${config.database.table} WHERE id = ?`;
        db.query(sql, [deleteId], function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}