var db = require('../database');
var config = require('./../config');
module.exports = {
    editData: function(editId, callback) {

        var sql = `SELECT * FROM ${config.database.db}.${config.database.table} WHERE id=${editId}`;
        db.query(sql, function(err, data) {
            if (err) throw err;
            return callback(data[0]);
        });
    },
    updateData: function(inputData, updateId, callback) {

        var sql = `UPDATE ${config.database.db}.${config.database.table} SET ? WHERE id= ?`;
        db.query(sql, [inputData, updateId], function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}