var mongoose = require('mongoose');
var db = require('../database_mongodb');
var config = require('./../config');

// create an schema
var userSchema = new mongoose.Schema({
            id:String,
            keyword: String,
            link: String,
            title: String,
            description: String,
            reg_date : String
}, {
    collection: config.database.table
});

userTable=mongoose.model(config.database.table,userSchema);
        
module.exports={
     
     fetchData:function(callback){
        var userData=userTable.find({});
        console.log('********fetchData userTable_fetch fech model *****');

        userData.exec(function(err, data){
            if(err) throw err;
            return callback(data);
        })
        
     }
}
/*=============================================================0*/
/*=============================================================0*/
/*=============================================================0*/
/*=============================================================0*/
/*=============================================================0*/

// create an schema
/*
var userSchema = new mongoose.Schema({
    full_name: String,
    email_address: String,
    city: String,
    country: String
});
var schema = new mongoose.Schema(userSchema);

try {
    if (mongoose.model('users')) {
        var userTable_fetch = mongoose.model('users');
    }
} catch (e) {
    if (e.name === 'MissingSchemaError') {

        var userTable_fetch = mongoose.model('users', schema);
    }
}

module.exports = {

    fetchData: function(callback) {
        var userData = userTable_fetch.find({});
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        });

    }
}
*/