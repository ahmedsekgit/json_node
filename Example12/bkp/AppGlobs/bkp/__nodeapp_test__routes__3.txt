============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 1
============================================================
file: create-route.js
============================================================
content: var express = require('express');
var createController = require('../controllers/create-controller');
var router = express.Router();
// to display form
router.get('/form', createController.crudForm);
// to create data
router.post('/create', createController.createData);
module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 2
============================================================
file: crud-route.js
============================================================
content: var express = require('express');
var crudController = require('../controllers/crud-controller');
var router = express.Router();

// curd form route
router.get('/form', crudController.crudForm);

// create data route
router.post('/create', crudController.createCrud);

// display data route
router.get('/fetch', crudController.fetchCrud);

// edit data route
router.get('/edit/:id', crudController.editCrud);

// update data route
router.post('/edit/:id', crudController.UpdateCrud);

// delete data route
router.get('/delete/:id', crudController.deleteCrud);

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 3
============================================================
file: crud_mongo_route.js
============================================================
content: var express = require('express');
var router = express.Router();
var crud_mongo_controller = require('../controllers/crud_mongo_controller');

/* GET users listing. */
router.get('/', crud_mongo_controller.userForm);
router.post('/create_mongo', crud_mongo_controller.createData);
router.get('/data-list_mongo', crud_mongo_controller.fetchData);
router.get('/edit_mongo/:id', crud_mongo_controller.editData);
router.post('/edit_mongo/:id', crud_mongo_controller.updateData);
router.get('/delete_mongo/:id', crud_mongo_controller.deleteData);
module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 4
============================================================
file: dashboard-route.js
============================================================
content: var express = require('express');
var router = express.Router();
/* GET users listing. */
router.get('/dashboard', function(req, res, next) {
    if (req.session.loggedinUser) {
    		if (req.session.return_to) 
    		{
    			res.redirect(req.session.return_to);
    		}
    		else
    		{
        		res.render('dashboard', 
        		{
            	email: req.session.emailAddress
        		})
    	}
    } else {
        res.redirect('/login');
    }
});
module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 5
============================================================
file: delete-route.js
============================================================
content: var express = require('express');
var deleteController = require('../controllers/delete-controller');
var router = express.Router();

// to delete data 
router.get('/delete/:id', deleteController.deleteData);
module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 6
============================================================
file: email-route.js
============================================================
content: var express = require('express');
var router = express.Router();
var nodemailer = require('nodemailer');

// load email form
router.get('/send-mail', function(req, res, next) {
    res.render('email-form', {
        title: 'Send Mail with nodejs'
    });
});

// This route will work after submit the form
router.post('/send-email', function(req, res) {

    var receiver = req.body.to;
    var subject = req.body.subject;
    var message = req.body.message;

    var transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 587,
        secure: false,
        requireTLS: true,
        auth: {
            user: 'codingstatus@gmail.com', // enter your email address
            pass: '********' // enter your visible/encripted password
        }
    });

    var mailOptions = {
        from: 'codingstatus@gmail.com',
        to: receiver,
        subject: subject,
        text: message
    };

    transporter.sendMail(mailOptions, function(error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email was sent successfully: ' + info.response);
        }
    });
    res.render('mail-form', {
        title: 'Send Mail with nodejs'
    });
})
module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 7
============================================================
file: fetch-route.js
============================================================
content: var express = require('express');
var router = express.Router();
var fetchController = require('../controllers/fetch-controller');

router.get('/fetch-data', fetchController.fetchData);

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 8
============================================================
file: file-route.js
============================================================
content: var express = require('express');
var fileController = require('../controllers/file-controller');
var router = express.Router();
// to display data 

router.get('/files', fileController.readData);
router.get('/store', fileController.storeData);
router.get('/checkData', fileController.checkData);

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 9
============================================================
file: image-route.js
============================================================
content: const express = require('express');
const router = express.Router();
const imageController = require('../controllers/image-controller');

router.get('/store-image', imageController.imageUploadForm);

router.post('/store-image', imageController.storeImage);

router.get('/display-image', imageController.displayImage);

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 10
============================================================
file: index.js
============================================================
content: var express = require('express');
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
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 11
============================================================
file: keywords.js
============================================================
content: var express = require('express');
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
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 12
============================================================
file: links-route.js
============================================================
content: var express = require('express');
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
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 13
============================================================
file: login-route.js
============================================================
content: var express = require('express');
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
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 14
============================================================
file: logout-route.js
============================================================
content: var express = require('express');
var router = express.Router();
/* GET users listing. */
router.get('/logout', function(req, res) {
    req.session.destroy();
    res.redirect('/login');
});
module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 15
============================================================
file: read-route.js
============================================================
content: var express = require('express');
var readController = require('../controllers/read-controller');
var router = express.Router();
// to display data 

router.get('/read', readController.readData);
router.get('/read/data_files/:name', readController.send_to_file);

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 16
============================================================
file: registration-route.js
============================================================
content: var express = require('express');
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
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 17
============================================================
file: search-route.js
============================================================
content: var express = require('express');
var searchController = require('../controllers/search-controller');
var router = express.Router();

// to search data get
router.get('/search', searchController.display_search_Data);
router.get('/data_files/:name', searchController.send_to_file);

router.post('/search_term_key', searchController.search_term_Data);
// to search post
//router.post('/search/:id', searchController.search_term_Data);

router.post('/query_search', function(req, res) {
    var obj = {};
    console.log('body: ' + JSON.stringify(req.body));
    res.send(req.body);
});


module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 18
============================================================
file: update-mongo-route.js
============================================================
content: var express = require('express');
var router = express.Router();
var update_mongo_Controller = require('../controllers/update-mongo-controller');

router.get('/edit/:id', update_mongo_Controller.editData);
router.post('/edit/:id', update_mongo_Controller.updateData);

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 19
============================================================
file: update-route.js
============================================================
content: var express = require('express');
var updateController = require('../controllers/update-controller');
var router = express.Router();

// to edit data 
router.get('/edit/:id', updateController.editData);
// to update data 
router.post('/update/:id', updateController.updateData);

router.post('/endpoint', function(req, res) {
    var obj = {};
    console.log('body: ' + JSON.stringify(req.body));
    res.send(req.body);
});

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 20
============================================================
file: user-route.js
============================================================
content: var express = require('express');
var router = express.Router();
var insertController = require('../controllers/user-controller');

router.get('/user-form', insertController.userForm);
router.post('/create', insertController.createData);

module.exports = router;
============================================================


============================================================
path : __home__sea__nodeapp_test__routes__
============================================================
============================================================
id: 21
============================================================
file: users.js
============================================================
content: var express = require('express');
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
============================================================


