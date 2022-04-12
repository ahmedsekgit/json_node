var db = require('../database');
var config = require('./../config');
module.exports = {
    createData: function(inputData, callback) {
        var sql = `INSERT INTO ${config.database.db}.${config.database.table} SET ?`;
        db.query(sql, inputData, function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}