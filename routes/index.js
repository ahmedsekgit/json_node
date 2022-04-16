var express = require('express');
var fs = require('fs');
var reload = require('express-reload');
const kill = require('kill-port');
const path = require('path');
const http = require('http');
const livereload = require("livereload");
var reload = require('reload');
var bodyParser = require('body-parser');
const connectLivereload = require("connect-livereload");

var router = express.Router();
var config = require('./../config');
var FileConfigPath = __dirname+'/../config.js';

var searchController = require('../controllers/search-controller');
var db = require('../database');

const port = 3012;


/* GET home page. */
router.get('/', function(req, res, next) {

    res.render('index', {
        title: 'Express'
    });
});

router.post('/ref_search', searchController.ref_search);

router.get('/ajax', function(req, res) {
    res.render('ajax', {
        title: 'An Ajax Example',
        quote: "AJAX is great!"
    });
});

function reload_app(req,res)
{
var local_app = req.app;
var local_server = req.app.locals.server;

local_server.close();
var server = http.createServer(local_app);
// Reload code here
reload(local_app).then(function (reloadReturned) {
  // reloadReturned is documented in the returns API in the README

  // Reload started, start web server
  server.listen(local_app.get('port'), function () {
    console.log('Web server listening on port ' + local_app.get('port'))
  })
}).catch(function (err) {
  console.error('Reload could not start, could not start server/sample app', err)
})

}
function GetSetFileLinesSync(filename,json_path_number)
{
var arr_return =[];
try {
    // read contents of the file
    const data = fs.readFileSync(filename, 'UTF-8');

    // split the contents by new line
    const lines = data.split(/\r?\n/);

    // print all lines
    lines.forEach((line) => {

        var pattern = /arr_json_paths\[[0-9]{1,3}\]/gi;
        
         let bool_match = line.match(pattern);
        if(bool_match)
        {

            line=line.replace(pattern, "arr_json_paths[" +json_path_number +"]");

        }
        arr_return.push(line);
        
    });
} catch (err) {
    console.error(err);
}
    var strData = "";

    strData = arr_return.join("\n");

    fs.writeFileSync(filename, strData);

}

router.get('/db_test', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,0);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_javascript', function(req, res) 
{

    GetSetFileLinesSync(FileConfigPath,15);
    reload_app(req,res);
    res.redirect('/');
    
});
router.get('/db_node', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,5);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_tryit', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,12);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_express', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,7);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_react', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,14);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_jquery', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,2);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_shell', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,16);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_css', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,4);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_sql', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,3);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_php', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,8);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_html', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,10);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_cpp', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,1);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_python', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,11);
    reload_app(req,res);
    res.redirect('/');
});
router.get('/db_java', function(req, res) 
{
    GetSetFileLinesSync(FileConfigPath,13);
    reload_app(req,res);
    res.redirect('/');
});

/*
router.post('/ajax', function(req, res) {


    res.render('ajax', {
        title: 'An Ajax Example',
        quote: req.body.quote
    });
});
*/
module.exports = router;