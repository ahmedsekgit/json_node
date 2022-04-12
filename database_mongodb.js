var mongoose = require('mongoose');
var config = require('./config');

mongoose.connect('mongodb://localhost:27017/'+config.database.db, {
    useNewUrlParser: true
}); //old
//mongoose.connect('mongodb://localhost:27017/db_test');

var conn = mongoose.connection;

conn.on('connected', function() {
    console.log('database mongodb is connected successfully');
});
conn.on('disconnected', function() {
    console.log('database mongodb is disconnected successfully');
})

//conn.on('error', console.error.bind(console, 'connection error:'));

module.exports = conn;