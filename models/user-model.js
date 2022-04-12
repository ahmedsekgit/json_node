var mongoose = require('mongoose');
var db = require('../database_mongodb');

// create an schema
var userSchema = new mongoose.Schema({
    full_name: String,
    email_address: String,
    city: String,
    country: String
});

try {
    if (mongoose.model('users')) return mongoose.model('users');
} catch (e) {
    if (e.name === 'MissingSchemaError') {
        var schema = new mongoose.Schema(userSchema);
        var userTable = mongoose.model('users', schema);
    }
}

module.exports = {
    createData: function(inputData, callback) {

        userData = new userTable(inputData);
        userData.save(function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}