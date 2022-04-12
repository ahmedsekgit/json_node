var db = require('../database');
var config = require('./../config');
var tmp_table = config.database.table;
//var tmp_table = 'table_0001';
var sql_create  = `CREATE TABLE ${tmp_table}(
                      id int unsigned DEFAULT NULL,
                      keyword text  NULL,
                      link text NULL,
                      title  text NULL,
                      description text NULL,
                      reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                      UNIQUE KEY id (id)
                  )`;

module.exports = {
    readData: function(callback) {
        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    },
    storeData: function(callback) {
        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    },
    checkData: function(callback) {
        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    },
    createData: function(proposal_t, inputData, callback) {

        //var sql = `INSERT INTO ${config.database.db}.${proposal_t} SET ?`;
        var sql = `INSERT INTO ${config.database.db}.${proposal_t} (id,keyword,link,title,description ) VALUES ?`;
        db.query(sql, [inputData], function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    },
    updateData: function(inputData, updateId, callback) {

        var sql = `UPDATE ${config.database.db}.${config.database.table} SET ? WHERE id= ?`;
        db.query(sql, [inputData, updateId], function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    },
    deleteData: function(deleteId, callback) {

       log(chalk.yellow('ts-model deleteData this Id is a deleted id :', deleteId)); 

        var sql = `DELETE FROM ${config.database.db}.${config.database.table} WHERE id = ?`;
        db.query(sql, [deleteId], function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    },
    createTable: function(callback) {
        db.query(sql_create, function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    },

}