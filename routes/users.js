var express = require('express');
var router = express.Router();
var db = require('../database');
// another routes also appear here
// this script to fetch data from MySQL databse table

var showKeysValues = function(obj) {
    var keys = [];
    var values = [];
    for (var key in obj) {
        keys.push(key.toString() + "");
        values.push(obj[key].toString() + "");
    }
    console.log(" { " + keys + " }");
    console.log(" { " + values + " }");
}

router.get('/user-list', function(req, res, next) {

    var sql = 'SELECT * FROM search';
    db.query(sql, function(err, data, fields) {
        if (err) throw err;
        hljs = require('highlight.js');
        const beautify = require('beautify');
        for (var key in data) {
            /*CSS/JS/JSON/HTML/XML*/

            data[key].description = beautify(data[key].description, {
                format: 'js'
            });
            /* load the library and ALL languages*/
            /*data[key].description = hljs.highlightAuto(data[key].description).value;*/

            console.dir(data[key]);
        }

        res.render('user-list', {
            title: 'User List',
            userData: data
        });
    });
});
module.exports = router;