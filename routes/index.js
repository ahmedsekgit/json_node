var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {

    res.render('index', {
        title: 'Express'
    });
});
router.get('/ajax', function(req, res) {


    res.render('ajax', {
        title: 'An Ajax Example',
        quote: "AJAX is great!"
    });
});
router.post('/ajax', function(req, res) {


    res.render('ajax', {
        title: 'An Ajax Example',
        quote: req.body.quote
    });
});
module.exports = router;