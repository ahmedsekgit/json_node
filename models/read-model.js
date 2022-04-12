var db = require('../database');
var config = require('./../config');

module.exports = {
    readData: function(callback) {
        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    }

}