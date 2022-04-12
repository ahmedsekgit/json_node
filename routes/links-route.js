var express = require('express');
var router = express.Router();
var config = require('./../config');

var linkController = require('../controllers/link-controller');
var db = require('../database');
// another routes also appear here
// this script to fetch data from MySQL d

// to show data 
router.get('/show/:id', linkController.showData);
router.get('/show/data_files/:name', linkController.send_to_file);
router.post('/search_link_ajax', linkController.search_term_Data);
router.get('/links-list', linkController.showLinksList);


router.get('/link-search', function(req, res, next) {
    data = [];
    res.render('link_search', {
        title: 'link search',
        link_search_data: data
    });
});



router.post('/endpoint', function(req, res) {
    var obj = {};
    var data_rep = 'ceci est ma reponse de la part de endpoint';
    res.send(data_rep);

    /*console.log('body: ' + JSON.stringify(req.body));
    res.send(req.body);*/
});


router.get('/search', function(req, res) {
    var sql = `SELECT title FROM ${config.database.db}.${config.database.table} WHERE title LIKE "%` + req.query.key + '%"';
    db.query(sql, function(err, rows, fields) {
        if (err) throw err;
        var data = [];
        for (i = 0; i < rows.length; i++) {
            data.push(rows[i].title);
        }
        /*console.log("sending data_ajax_${config.database.db}.${config.database.table}");
        console.dir(data);*/

        res.send(JSON.stringify(data));
    });
});


module.exports = router;