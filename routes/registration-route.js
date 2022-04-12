var express = require('express');
var bodyParser = require('body-parser');

var router = express.Router();
var db = require('../database');

// to display registration form 
router.get('/register', function(req, res, next) {
    res.render('registration-form');
});

// create application/json parser
var jsonParser = bodyParser.json()

// create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({
    extended: false
})

// to store user input detail on post request
router.post('/register', urlencodedParser, function(req, res, next) {

    inputData = {
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        email_address: req.body.email_address,
        gender: req.body.gender,
        password: req.body.password
    };

    // check unique email address
    var sql = 'SELECT * FROM db_test.registration WHERE email_address =?';
    db.query(sql, [inputData.email_address], function(err, data, fields) {
        if (err) throw err
        if (data.length > 1) {
            var msg = inputData.email_address + "was already exist";
        } else if (req.body.confirm_password != inputData.password) {
            var msg = "Password & Confirm Password is not Matched";
        } else {

            // save users data into database
            var sql = 'INSERT INTO db_test.registration SET ?';
            db.query(sql, inputData, function(err, data) {
                if (err) throw err;
            });
            var msg = "Your are successfully registered";
        }
        res.render('registration-form', {
            alertMsg: msg
        });
    });

});
module.exports = router;