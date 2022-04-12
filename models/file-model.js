var db = require('../database');
var config = require('./../config');
var  chalk  = require('chalk');
const log = console.log;

function storeData(data) {
    var sql = `insert into ${config.database.db}.${config.database.table}(title,description) values ('` + data.title + "','" + data.description + "');";
    return db.query(sql, (err, result) => {
        if (err) throw err;
        if (result) {
            console.log(data.title + "-" + data.description + "-" + data.id);
        }
        return result.insertId;
    });

}

function updateData(data) {
    var sql = `update ${config.database.db}.${config.database.table} set ${config.database.db}.${config.database.table}.title='` + data.title + `', ${config.database.db}.${config.database.table}.description = '` + data.description + `' where ${config.database.db}.${config.database.table}.id = ` + data.id + ";";
    return db.query(sql, function(err, result) {
        if (err) throw err;
        if (result) {
            data.id = result.insertId;
            console.log(data.title + "-" + data.description + "-" + data.id);

        }
        return result.changedRows;
    });
}


module.exports = {
    readData: function(callback) {
        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    },
    storeData: function(inputData, callback) {
        console.log('inputData');
        
        log(chalk.yellow('file-model storeData inputData :'));
        log(chalk.yellow(inputData));

        var sql = `INSERT INTO ${config.database.db}.${config.database.table} SET ?`;
        db.query(sql, inputData, function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }

}