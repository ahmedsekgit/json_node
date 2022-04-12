var mysql = require('mysql');
var config = require('./config');

var conn = mysql.createConnection({
    host: config.database.host, // Replace with your host name
    user: config.database.user, // Replace with your database username
    password: config.database.password, // Replace with your database password
    database: config.database.db // // Replace with your database Name
});
conn.connect(function(err) 
{
	if (err)
	{
		console.log('Cannot connect to database !' + err); 
		//throw err;
	}
	else
	{
		console.log('Database is connected successfully !');
	}
});
module.exports = conn;