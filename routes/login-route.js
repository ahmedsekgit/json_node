var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../database');
/* GET users listing. */
router.get('/login', function(req, res, next) {
    res.render('login-form');
});

// create application/json parser
var jsonParser = bodyParser.json()

// create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({
    extended: false
})

router.post('/login', urlencodedParser, function(req, res) {

    var emailAddress = req.body.email_address;
    var password = req.body.password;


    var sql = 'SELECT * FROM db_test.registration WHERE email_address =? AND password =?';
    db.query(sql, [emailAddress, password], function(err, data, fields) {
        if (err) throw err
        if (data.length > 0) {
            req.session.loggedinUser = true;
            req.session.emailAddress = emailAddress;
            res.redirect('/dashboard');
        } else {
            res.render('login-form', {
                alertMsg: "Your Email Address or password is wrong"
            });
        }
    });

});

module.exports = router;