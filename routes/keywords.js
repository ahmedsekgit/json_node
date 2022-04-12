var express = require('express');
var router = express.Router();
var db = require('../database');
router.get('/', function(req, res, next) {
    res.render('keywords');
});
router.post('/create', function(req, res, next) {

    // store all the keyword input data

    const keywordDetails = {
        keyword: req.body.keyword,
        link: req.body.link,
        title: req.body.title,
        description: req.body.description
    };
    // insert keyword data into keywords table
    var sql = 'INSERT INTO general_keywords SET ?';
    db.query(sql, keywordDetails, function(err, data) {
        if (err) throw err;
        console.log("keyword dat is inserted successfully ");
    });
    res.redirect('/keywords'); // redirect to keyword form page after inserting the data
});
module.exports = router;