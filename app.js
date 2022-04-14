/*chrome://inspect/#devices*/
var createError = require('http-errors');
var express = require('express');
var session = require('express-session');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var util = require('util');
var http = require('http');
var cors = require('cors');
var chalk = require('chalk');

var config = require('./config');

var app = express();
const expressPrettier = require('express-prettier');
global.__basedir = __dirname;
var corsOptions = {
  origin: "http://localhost:3016"
};

app.set('port', process.env.PORT || 3012);

http.createServer(app).listen(app.get('port'),
  function(){
    console.log("Express server listening on port " + app.get('port'));
});



var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var linksRouter = require('./routes/links-route');
var fileRouter = require('./routes/file-route');
var emailRouter = require('./routes/email-route');
var crudRouter = require('./routes/crud-route');
var keywordsRouter = require('./routes/keywords');

var createRouter = require('./routes/create-route');
var readRouter   = require('./routes/read-route');
var updateRouter = require('./routes/update-route');
var deleteRouter = require('./routes/delete-route');
var searchRouter = require('./routes/search-route');
var tsRouter = require('./routes/ts-route');
var csvRouter = require('./routes/csv-route');


var registrationRouter = require('./routes/registration-route');
var loginRouter = require('./routes/login-route');
var dashboardRouter = require('./routes/dashboard-route');
var logoutRouter = require('./routes/logout-route');

var imageRouter = require('./routes/image-route');

//example d insert avec mongodb
/*
var insertRouter = require('./routes/user-route');
var fetchRouter = require('./routes/fetch-route');
var updatemongoRouter = require('./routes/update-mongo-route');
var crud_mongo_Router = require('./routes/crud_mongo_route');
*/

// view engine setup

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cookieParser());
app.use(session({
    secret: '123456cat',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 60000000
    }
}));

app.use(express.static(path.join(__dirname, 'public'))); //old

app.use('/', createRouter);
app.use('/', readRouter);
app.use('/', updateRouter);
app.use('/', deleteRouter);
app.use('/', searchRouter);
app.use('/ts', tsRouter);
app.use('/csv', csvRouter);
app.use('/', indexRouter);
app.use('/', imageRouter);
app.use('/users', usersRouter);
app.use('/links', linksRouter);
app.use('/file', fileRouter);
app.use('/crudy', crudRouter);
app.use('/keywords', keywordsRouter);
app.use('/', registrationRouter);
app.use('/', loginRouter);
app.use('/', dashboardRouter);
app.use('/', logoutRouter);

//example d insert avec mongodb
/*
app.use('/', insertRouter);
app.use('/', fetchRouter);
app.use('/', updatemongoRouter);
app.use('/crud_mongo', crud_mongo_Router);
*/

/*trying to avoid multicross origin*/

const db = require("./models/sequelize-model");
//db.sequelize.sync();
// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res) {
    
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');

});
 
    app.locals ={
        site: {
            address: config.server.host_adr, 
            port: config.server.port
        },
        author: {
            name: 'ahnedsek',
            contact: 'ahmed.sek@yahoo.com'
        }
    };
    app.locals.app_homedir = __dirname;

module.exports = app;