============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 1
============================================================
file: app.js
============================================================
content: /*chrome://inspect/#devices*/
var createError = require('http-errors');
var express = require('express');
var session = require('express-session');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var util = require('util');
var http = require('http');
var config = require('./config');

var app = express();
const expressPrettier = require('express-prettier');


app.set('port', process.env.PORT || 3014);

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
    extended: false
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
============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 2
============================================================
file: config.js
============================================================
content: var config = {
	database: {
		host:	  'localhost', 	// database host
		user: 	  'root', 		// your database username
		password: '123', 		// your database password
		port: 	  3306, 		// default MySQL port
		db: 	  'db_shell', 		// your database name
		table: 	  'general_shell' 		// your table name
	},
	server: {
		host: '127.0.0.1',
		host_adr: 'http://localhost:',
		port: '3014'
	}
}

module.exports = config

============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 3
============================================================
file: database.js
============================================================
content: var mysql = require('mysql');
var config = require('./config');

var conn = mysql.createConnection({
    host: config.database.host, // Replace with your host name
    user: config.database.user, // Replace with your database username
    password: config.database.password, // Replace with your database password
    database: config.database.db // // Replace with your database Name
});
conn.connect(function(err) {
    if (err) throw err;
    console.log('Database is connected successfully !');
});
module.exports = conn;
============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 4
============================================================
file: database_mongodb.js
============================================================
content: var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/db_test', {
    useNewUrlParser: true
}); //old
//mongoose.connect('mongodb://localhost:27017/db_test');
*
var conn = mongoose.connection;

conn.on('connected', function() {
    console.log('database mongodb is connected successfully');
});
conn.on('disconnected', function() {
    console.log('database mongodb is disconnected successfully');
})

conn.on('error', console.error.bind(console, 'connection error:'));

module.exports = conn;
============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 5
============================================================
file: ex3.txt
============================================================
content: const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');


const url1 = "https://www.iban.com/exchange-rates";
const url2 = `https://www.codegrepper.com/code-examples/javascript/frameworks/nodejs`;

fetchData(url1).then((res) => {
    const html = res.data;
    const $ = cheerio.load(html);
    const statsTable = $('.table.table-bordered.table-hover.downloads > tbody > tr');
    statsTable.each(function() {
        let title = $(this).find('td').text();
        console.log(title);
    });
})

fetchData(url2).then((res) => {
    var obselete = [];
    const html = res.data;
    const $ = cheerio.load(html);
    try {
        let urls = $("a");
        Object.keys(urls).forEach((item) => {

            if (urls[item].type === 'tag') {
                let href = urls[item].attribs.href;

                if (href && !obselete.includes(href)) {
                    href = href.trim();
                    obselete.push(href);

                    // Slow down the
                    /*
                    setTimeout(function() {
                        href.startsWith('http') ? crawlAllUrls(href) : crawlAllUrls(`${url}${href}`) // The latter might need extra code to test if its the same site and it is a full domain with no URI
                    }, 5000)
                    */
                }
            }
        });
        for (var i = 0; i < obselete.length; i++) 
        {
            var index = obselete[i].indexOf('node');
            if (index !== -1) {
                console.log('obselete[%d]', i);
                console.dir(obselete[i]);
                fs.appendFileSync('node_links.txt', obselete[i] + '\n');
            }

        }

    } catch (e) {
        console.error(`Encountered an error crawling ${url2}. Aborting crawl.`);
    }
    return obselete;
})



async function fetchData(url) {
    console.log("Crawling data...")
    // make http call to url
    let response = await axios(url).catch((err) => console.log(err));

    if (response.status !== 200) {
        console.log("Error occurred while fetching data");
        return;
    }
    return response;
}
============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 6
============================================================
file: ex4.txt
============================================================
content: const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const readline = require('readline');

var filename = 'node_links.txt';

async function processLineByLine(filename) {
  const fileStream = fs.createReadStream(filename);

  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  });
  // Note: we use the crlfDelay option to recognize all instances of CR LF
  // ('\r\n') in input.txt as a single line break.

  for await (const line of rl) {
    // Each line` in input.txt will be successively available here as `line`.
    console.log('line');
    console.dir(line);
    Glob_links(line);

    //console.log(`Line from file: ${line}`);
  }

}

processLineByLine(filename);

//url ="/code-examples/javascript/append+at+the+end+of+file+fs+write";
//Glob_links(url);

function Glob_links(url)
{

var href = 'https://www.codegrepper.com'+url;

var value = url;

var new_value = value.replace(/\//gi, "__");
    new_value = new_value.replace(/\+/gi, '_');

var txt = new_value + '__?'; 
var dir = '/node_q_r/';
var new_filename = new_value + '.txt';
console.log('txt');
console.dir(txt);
console.log('new_value');
console.dir(new_value);
console.log('new_filename');
console.dir(new_filename);

try
{
    fs.appendFileSync(__dirname+dir+new_filename, txt);
}
catch (err) 
{
    if (err.code === 'ENOENT') 
    {
        console.log('File not found!');
    } 
    else 
    {
      fs.appendFileSync(__dirname+dir+'__LOG__ERR__.txt', err);   
      return true;
    }
}

fs.appendFileSync(__dirname+dir+new_filename, '\n');

try
{
    fetchData(href).then((res) => {

    const html = res.data;
    const $ = cheerio.load(html);
    const statsTable = $('textarea.code_mirror_code');

    statsTable.each(function() {
        let textarea = $(this).text();

        try
        {
            fs.appendFileSync(__dirname+dir+new_filename, textarea);
        }
        catch (err) 
        {
            if (err.code === 'ENOENT') 
            {
                console.log('File not found!');
            } 
            else 
            {
              fs.appendFileSync(__dirname+dir+'__LOG__ERR__.txt', err);                  
              return true;
            }
        }

        console.log(textarea);
    }); /*fin statsTable*/

    })/*fin fetchData treatement*/

}
catch
{
    textarea ='_no_response_';

    fs.writeFileSync(__dirname+dir+new_filename, textarea);
  
}

}/* fin Glob_links*/


async function fetchData(url) {
    console.log("Crawling data...")
    // make http call to url
    let response = await axios(url).catch((err) => console.log(err));

    if (response.status !== 200) {
        console.log("Error occurred while fetching data");
        return;
    }
    return response;
}


============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 7
============================================================
file: favicon.ico
============================================================
content:         h     (                                    � � �   �   �   � � � 		� � � � � � � 64. 971 <:4 =;6 =<6 � @>9 ##� DD@ GF@ GGA HID HJE IKH FI{ JMy SWU TXV UXV UYW ZZU VZX WZY W[Y Z\X X\Y X\Z []Z Y][ [_] [`] ^a` _ca `cb AA� `db EE� dhf ehf dhh dhi eig fig FF� eii EE� mnh jnl knl jok mqo prm mro qus rvt swu sxt vxs txv z| |~ |�~ }� ~� ~�� ~�� �� ��� �� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� �½ ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      $$$$$$$$$$$$"0JSNPPPOOOOMMPP$EXA$$$$$$$$$$9\2W]-u||sH{||z$dDgZCn|o#v|t5eVOKhlskIXfIUTB=^QL>\@|| y|GYF/a$z|*88'y{,`>&[A&+5qp4()?_.b"$$%8rr4!$$$R8rr4i
6rr4m	7xw4 3<<:;~}4<<<1c44j�                  �   �  �  �  �  �  �?  �  �  �  �  
============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 8
============================================================
file: gruntfile.js
============================================================
content: /*
module.exports = function(grunt) {
  grunt.initConfig({
    nodemon: {
      all: {
        script: 'app.js',
        options: {
          watchedExtensions: ['js'],
          env: {
                PORT: '3000'
                }
        }
      }
    }
  });
  grunt.loadNpmTasks('grunt-nodemon');
  grunt.registerTask('default', 'nodemon');
};
*/
module.exports = function(grunt) {
        grunt.initConfig({
            //watches for the specified files and executes the task associated to be performed
            watch: {
                refresh: {
                    options: {
                        livereload: '<%= connect.options.livereload %>'
                    },
                    files: ['app/**/*.js', 'app/**/*.css', 'app/**/*.html'] //give the list of all files that you want to watch for and reload
                }
            },
            //serves the application under this configuration
            connect: {
                options: {
                    port: 9000,
                    // Change this to '0.0.0.0' to access the server from outside.
                    hostname: 'localhost',
                    livereload: 35729
                },
                livereload: {
                    options: {
                        open: true,
                    }
                }
            }
        });
        //load all Npm tasks
        grunt.loadNpmTasks('grunt-contrib-watch');
        grunt.loadNpmTasks('grunt-contrib-connect');

        //register tasks to be run
        grunt.registerTask('serve', ['connect:livereload', 'watch']);
============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 9
============================================================
file: kill_port_3000_listner.sh
============================================================
content:  s kill -9  $(lsof -t -i :3012)

============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 10
============================================================
file: package-lock.json
============================================================
content: {
  "name": "nodeapp",
  "version": "0.0.0",
  "lockfileVersion": 1,
  "requires": true,
  "dependencies": {
    "-": {
      "version": "0.0.1",
      "resolved": "https://registry.npmjs.org/-/-/--0.0.1.tgz",
      "integrity": "sha512-3HfneK3DGAm05fpyj20sT3apkNcvPpCuccOThOPdzz8sY7GgQGe0l93XH9bt+YzibcTIgUAIMoyVJI740RtgyQ==",
      "dev": true
    },
    "@sindresorhus/is": {
      "version": "0.14.0",
      "resolved": "https://registry.npmjs.org/@sindresorhus/is/-/is-0.14.0.tgz",
      "integrity": "sha512-9NET910DNaIPngYnLLPeg+Ogzqsi9uM4mSboU5y6p8S5DzMTVEsJZrawi+BoDNUVBa2DhJqQYUFvMDfgU062LQ=="
    },
    "@szmarczak/http-timer": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/@szmarczak/http-timer/-/http-timer-1.1.2.tgz",
      "integrity": "sha512-XIB2XbzHTN6ieIjfIMV9hlVcfPU26s2vafYWQcZHWXHOxiaRZYEDKEwdl129Zyg50+foYV2jCgtrqSA6qNuNSA==",
      "requires": {
        "defer-to-connect": "^1.0.1"
      }
    },
    "@types/node": {
      "version": "16.10.2",
      "resolved": "https://registry.npmjs.org/@types/node/-/node-16.10.2.tgz",
      "integrity": "sha512-zCclL4/rx+W5SQTzFs9wyvvyCwoK9QtBpratqz2IYJ3O8Umrn0m3nsTv0wQBk9sRGpvUe9CwPDrQFB10f1FIjQ=="
    },
    "@types/webidl-conversions": {
      "version": "6.1.1",
      "resolved": "https://registry.npmjs.org/@types/webidl-conversions/-/webidl-conversions-6.1.1.tgz",
      "integrity": "sha512-XAahCdThVuCFDQLT7R7Pk/vqeObFNL3YqRyFZg+AqAP/W1/w3xHaIxuW7WszQqTbIBOPRcItYJIou3i/mppu3Q=="
    },
    "@types/whatwg-url": {
      "version": "8.2.1",
      "resolved": "https://registry.npmjs.org/@types/whatwg-url/-/whatwg-url-8.2.1.tgz",
      "integrity": "sha512-2YubE1sjj5ifxievI5Ge1sckb9k/Er66HyR2c+3+I6VDUUg1TLPdYYTEbQ+DjRkS4nTxMJhgWfSfMRD2sl2EYQ==",
      "requires": {
        "@types/node": "*",
        "@types/webidl-conversions": "*"
      }
    },
    "abbrev": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/abbrev/-/abbrev-1.1.1.tgz",
      "integrity": "sha512-nne9/IiQ/hzIhY6pdDnbBtz7DjPTKrY00P/zvPSm5pOFkl6xuGrGnXn/VtTNNfNtAfZ9/1RtehkszU9qcTii0Q=="
    },
    "accepts": {
      "version": "1.3.7",
      "resolved": "https://registry.npmjs.org/accepts/-/accepts-1.3.7.tgz",
      "integrity": "sha512-Il80Qs2WjYlJIBNzNkK6KYqlVMTbZLXgHx2oT0pU/fjRHyEp+PEfEPY0R3WCwAGVOtauxh1hOxNgIf5bv7dQpA==",
      "requires": {
        "mime-types": "~2.1.24",
        "negotiator": "0.6.2"
      }
    },
    "ajv": {
      "version": "8.6.3",
      "resolved": "https://registry.npmjs.org/ajv/-/ajv-8.6.3.tgz",
      "integrity": "sha512-SMJOdDP6LqTkD0Uq8qLi+gMwSt0imXLSV080qFVwJCpH9U6Mb+SUGHAXM0KNbcBPguytWyvFxcHgMLe2D2XSpw==",
      "requires": {
        "fast-deep-equal": "^3.1.1",
        "json-schema-traverse": "^1.0.0",
        "require-from-string": "^2.0.2",
        "uri-js": "^4.2.2"
      }
    },
    "align-text": {
      "version": "0.1.4",
      "resolved": "https://registry.npmjs.org/align-text/-/align-text-0.1.4.tgz",
      "integrity": "sha1-DNkKVhCT810KmSVsIrcGlDP60Rc=",
      "requires": {
        "kind-of": "^3.0.2",
        "longest": "^1.0.1",
        "repeat-string": "^1.5.2"
      },
      "dependencies": {
        "kind-of": {
          "version": "3.2.2",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
          "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
          "requires": {
            "is-buffer": "^1.1.5"
          }
        }
      }
    },
    "ansi-align": {
      "version": "3.0.1",
      "resolved": "https://registry.npmjs.org/ansi-align/-/ansi-align-3.0.1.tgz",
      "integrity": "sha512-IOfwwBF5iczOjp/WeY4YxyjqAFMQoZufdQWDd19SEExbVLNXqvpzSJ/M7Za4/sCPmQ0+GRquoA7bGcINcxew6w==",
      "requires": {
        "string-width": "^4.1.0"
      }
    },
    "ansi-regex": {
      "version": "5.0.1",
      "resolved": "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz",
      "integrity": "sha512-quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ=="
    },
    "ansi-styles": {
      "version": "4.3.0",
      "resolved": "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz",
      "integrity": "sha512-zbB9rCJAT1rbjiVDb2hqKFHNYLxgtk8NURxZ3IZwD3F6NtxbXZQCnnSi1Lkx+IDohdPlFp222wVALIheZJQSEg==",
      "requires": {
        "color-convert": "^2.0.1"
      }
    },
    "anymatch": {
      "version": "3.1.2",
      "resolved": "https://registry.npmjs.org/anymatch/-/anymatch-3.1.2.tgz",
      "integrity": "sha512-P43ePfOAIupkguHUycrc4qJ9kz8ZiuOUijaETwX7THt0Y/GNK7v0aa8rY816xWjZ7rJdA5XdMcpVFTKMq+RvWg==",
      "requires": {
        "normalize-path": "^3.0.0",
        "picomatch": "^2.0.4"
      }
    },
    "append-field": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/append-field/-/append-field-1.0.0.tgz",
      "integrity": "sha1-HjRA6RXwsSA9I3SOeO3XubW0PlY="
    },
    "argparse": {
      "version": "1.0.10",
      "resolved": "https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz",
      "integrity": "sha512-o5Roy6tNG4SL/FOkCAN6RzjiakZS25RLYFrcMttJqbdd8BWrnA+fGz57iN5Pb06pvBGvl5gQ0B48dJlslXvoTg==",
      "dev": true,
      "requires": {
        "sprintf-js": "~1.0.2"
      },
      "dependencies": {
        "sprintf-js": {
          "version": "1.0.3",
          "resolved": "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz",
          "integrity": "sha1-BOaSb2YolTVPPdAVIDYzuFcpfiw=",
          "dev": true
        }
      }
    },
    "arr-diff": {
      "version": "4.0.0",
      "resolved": "https://registry.npmjs.org/arr-diff/-/arr-diff-4.0.0.tgz",
      "integrity": "sha1-1kYQdP6/7HHn4VI1dhoyml3HxSA=",
      "dev": true
    },
    "arr-flatten": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/arr-flatten/-/arr-flatten-1.1.0.tgz",
      "integrity": "sha512-L3hKV5R/p5o81R7O02IGnwpDmkp6E982XhtbuwSe3O4qOtMMMtodicASA1Cny2U+aCXcNpml+m4dPsvsJ3jatg==",
      "dev": true
    },
    "arr-union": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/arr-union/-/arr-union-3.1.0.tgz",
      "integrity": "sha1-45sJrqne+Gao8gbiiK9jkZuuOcQ=",
      "dev": true
    },
    "array-differ": {
      "version": "0.1.0",
      "resolved": "https://registry.npmjs.org/array-differ/-/array-differ-0.1.0.tgz",
      "integrity": "sha1-EuLJtwa+1HyLSDtX5IdHP7CGHzo=",
      "dev": true
    },
    "array-each": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/array-each/-/array-each-1.0.1.tgz",
      "integrity": "sha1-p5SvDAWrF1KEbudTofIRoFugxE8="
    },
    "array-flatten": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/array-flatten/-/array-flatten-1.1.1.tgz",
      "integrity": "sha1-ml9pkFGx5wczKPKgCJaLZOopVdI="
    },
    "array-slice": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/array-slice/-/array-slice-1.1.0.tgz",
      "integrity": "sha512-B1qMD3RBP7O8o0H2KbrXDyB0IccejMF15+87Lvlor12ONPRHP6gTjXMNkt/d3ZuOGbAe66hFmaCfECI24Ufp6w=="
    },
    "array-union": {
      "version": "0.1.0",
      "resolved": "https://registry.npmjs.org/array-union/-/array-union-0.1.0.tgz",
      "integrity": "sha1-7emAiDMGZeaZ4evwIny8YDTmJ9s=",
      "dev": true,
      "requires": {
        "array-uniq": "^0.1.0"
      }
    },
    "array-uniq": {
      "version": "0.1.1",
      "resolved": "https://registry.npmjs.org/array-uniq/-/array-uniq-0.1.1.tgz",
      "integrity": "sha1-WGHz7U5LthdVl6TgeOiqeOvpWMc=",
      "dev": true
    },
    "array-unique": {
      "version": "0.3.2",
      "resolved": "https://registry.npmjs.org/array-unique/-/array-unique-0.3.2.tgz",
      "integrity": "sha1-qJS3XUvE9s1nnvMkSp/Y9Gri1Cg=",
      "dev": true
    },
    "assert": {
      "version": "1.4.1",
      "resolved": "https://registry.npmjs.org/assert/-/assert-1.4.1.tgz",
      "integrity": "sha1-mZEtWRg2tab1s0XA8H7vwI/GXZE=",
      "dev": true,
      "requires": {
        "util": "0.10.3"
      },
      "dependencies": {
        "inherits": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz",
          "integrity": "sha1-sX0I0ya0Qj5Wjv9xn5GwscvfafE=",
          "dev": true
        },
        "util": {
          "version": "0.10.3",
          "resolved": "https://registry.npmjs.org/util/-/util-0.10.3.tgz",
          "integrity": "sha1-evsa/lCAUkZInj23/g7TeTNqwPk=",
          "dev": true,
          "requires": {
            "inherits": "2.0.1"
          }
        }
      }
    },
    "assign-symbols": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/assign-symbols/-/assign-symbols-1.0.0.tgz",
      "integrity": "sha1-WWZ/QfrdTyDMvCu5a41Pf3jsA2c=",
      "dev": true
    },
    "astral-regex": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/astral-regex/-/astral-regex-2.0.0.tgz",
      "integrity": "sha512-Z7tMw1ytTXt5jqMcOP+OQteU1VuNK9Y02uuJtKQ1Sv69jXQKKg5cibLwGJow8yzZP+eAc18EmLGPal0bp36rvQ=="
    },
    "async": {
      "version": "3.2.1",
      "resolved": "https://registry.npmjs.org/async/-/async-3.2.1.tgz",
      "integrity": "sha512-XdD5lRO/87udXCMC9meWdYiR+Nq6ZjUfXidViUZGu2F1MO4T3XwZ1et0hb2++BgLfhyJwy44BGB/yx80ABx8hg==",
      "dev": true
    },
    "async-each": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/async-each/-/async-each-1.0.3.tgz",
      "integrity": "sha512-z/WhQ5FPySLdvREByI2vZiTWwCnF0moMJ1hK9YQwDTHKh6I7/uSckMetoRGb5UBZPC1z0jlw+n/XCgjeH7y1AQ==",
      "dev": true
    },
    "async-limiter": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/async-limiter/-/async-limiter-1.0.1.tgz",
      "integrity": "sha512-csOlWGAcRFJaI6m+F2WKdnMKr4HhdhFVBk0H/QbJFMCr+uO2kwohwXQPxw/9OCxp05r5ghVBFSyioixx3gfkNQ==",
      "dev": true
    },
    "atob": {
      "version": "2.1.2",
      "resolved": "https://registry.npmjs.org/atob/-/atob-2.1.2.tgz",
      "integrity": "sha512-Wm6ukoaOGJi/73p/cl2GvLjTI5JM1k/O14isD73YML8StrH/7/lRFgmg8nICZgD3bZZvjwCGxtMOD3wWNAu8cg==",
      "dev": true
    },
    "available-typed-arrays": {
      "version": "1.0.5",
      "resolved": "https://registry.npmjs.org/available-typed-arrays/-/available-typed-arrays-1.0.5.tgz",
      "integrity": "sha512-DMD0KiN46eipeziST1LPP/STfDU0sufISXmjSgvVsoU2tqxctQeASejWcfNtxYKqETM1UxQ8sp2OrSBWpHY6sw=="
    },
    "balanced-match": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz",
      "integrity": "sha512-3oSeUO0TMV67hN1AmbXsK4yaqU7tjiHlbxRDZOpH0KW9+CeX4bRAaX0Anxt0tx2MrpRpWwQaPwIlISEJhYU5Pw=="
    },
    "base": {
      "version": "0.11.2",
      "resolved": "https://registry.npmjs.org/base/-/base-0.11.2.tgz",
      "integrity": "sha512-5T6P4xPgpp0YDFvSWwEZ4NoE3aM4QBQXDzmVbraCkFj8zHM+mba8SyqB5DbZWyR7mYHo6Y7BdQo3MoA4m0TeQg==",
      "dev": true,
      "requires": {
        "cache-base": "^1.0.1",
        "class-utils": "^0.3.5",
        "component-emitter": "^1.2.1",
        "define-property": "^1.0.0",
        "isobject": "^3.0.1",
        "mixin-deep": "^1.2.0",
        "pascalcase": "^0.1.1"
      },
      "dependencies": {
        "define-property": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz",
          "integrity": "sha1-dp66rz9KY6rTr56NMEybvnm/sOY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^1.0.0"
          }
        },
        "is-accessor-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
          "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-data-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
          "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-descriptor": {
          "version": "1.0.2",
          "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
          "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
          "dev": true,
          "requires": {
            "is-accessor-descriptor": "^1.0.0",
            "is-data-descriptor": "^1.0.0",
            "kind-of": "^6.0.2"
          }
        }
      }
    },
    "base64-js": {
      "version": "1.5.1",
      "resolved": "https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz",
      "integrity": "sha512-AKpaYlHn8t4SVbOHCy+b5+KKgvR4vrsD8vbvrbiQJps7fKDTkjkDry6ji0rUJjC0kzbNePLwzxq8iypo41qeWA=="
    },
    "basic-auth": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/basic-auth/-/basic-auth-2.0.1.tgz",
      "integrity": "sha512-NF+epuEdnUYVlGuhaxbbq+dvJttwLnGY+YixlXlME5KpQ5W3CnXA5cVTneY3SPbPDRkcjMbifrwmFYcClgOZeg==",
      "requires": {
        "safe-buffer": "5.1.2"
      }
    },
    "batch": {
      "version": "0.6.1",
      "resolved": "https://registry.npmjs.org/batch/-/batch-0.6.1.tgz",
      "integrity": "sha1-3DQxT05nkxgJP8dgJyUl+UvyXBY=",
      "dev": true
    },
    "beautify": {
      "version": "0.0.8",
      "resolved": "https://registry.npmjs.org/beautify/-/beautify-0.0.8.tgz",
      "integrity": "sha1-5P91XCzVZyfeDMwebMXTygxSCI0=",
      "requires": {
        "cssbeautify": "^0.3.1",
        "html": "^1.0.0",
        "js-beautify": "^1.6.4"
      },
      "dependencies": {
        "js-beautify": {
          "version": "1.14.0",
          "resolved": "https://registry.npmjs.org/js-beautify/-/js-beautify-1.14.0.tgz",
          "integrity": "sha512-yuck9KirNSCAwyNJbqW+BxJqJ0NLJ4PwBUzQQACl5O3qHMBXVkXb/rD0ilh/Lat/tn88zSZ+CAHOlk0DsY7GuQ==",
          "requires": {
            "config-chain": "^1.1.12",
            "editorconfig": "^0.15.3",
            "glob": "^7.1.3",
            "nopt": "^5.0.0"
          }
        },
        "nopt": {
          "version": "5.0.0",
          "resolved": "https://registry.npmjs.org/nopt/-/nopt-5.0.0.tgz",
          "integrity": "sha512-Tbj67rffqceeLpcRXrT7vKAN8CwfPeIBgM7E6iBkmKLV7bEMwpGgYLGv0jACUsECaa/vuxP0IjEont6umdMgtQ==",
          "requires": {
            "abbrev": "1"
          }
        }
      }
    },
    "bignumber.js": {
      "version": "9.0.0",
      "resolved": "https://registry.npmjs.org/bignumber.js/-/bignumber.js-9.0.0.tgz",
      "integrity": "sha512-t/OYhhJ2SD+YGBQcjY8GzzDHEk9f3nerxjtfa6tlMXfe7frs/WozhvCNoGvpM0P3bNf3Gq5ZRMlGr5f3r4/N8A=="
    },
    "binary-extensions": {
      "version": "2.2.0",
      "resolved": "https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.2.0.tgz",
      "integrity": "sha512-jDctJ/IVQbZoJykoeHbhXpOlNBqGNcwXJKJog42E5HDPUwQTSdjCHdihjj0DlnheQ7blbT6dHOafNAiS8ooQKA=="
    },
    "body": {
      "version": "5.1.0",
      "resolved": "https://registry.npmjs.org/body/-/body-5.1.0.tgz",
      "integrity": "sha1-5LoM5BCkaTYyM2dgnstOZVMSUGk=",
      "dev": true,
      "requires": {
        "continuable-cache": "^0.3.1",
        "error": "^7.0.0",
        "raw-body": "~1.1.0",
        "safe-json-parse": "~1.0.1"
      },
      "dependencies": {
        "bytes": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/bytes/-/bytes-1.0.0.tgz",
          "integrity": "sha1-NWnt6Lo0MV+rmcPpLLBMciDeH6g=",
          "dev": true
        },
        "raw-body": {
          "version": "1.1.7",
          "resolved": "https://registry.npmjs.org/raw-body/-/raw-body-1.1.7.tgz",
          "integrity": "sha1-HQJ8K/oRasxmI7yo8AAWVyqH1CU=",
          "dev": true,
          "requires": {
            "bytes": "1",
            "string_decoder": "0.10"
          }
        },
        "string_decoder": {
          "version": "0.10.31",
          "resolved": "https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz",
          "integrity": "sha1-YuIDvEF2bGwoyfyEMB2rHFMQ+pQ=",
          "dev": true
        }
      }
    },
    "body-parser": {
      "version": "1.19.0",
      "resolved": "https://registry.npmjs.org/body-parser/-/body-parser-1.19.0.tgz",
      "integrity": "sha512-dhEPs72UPbDnAQJ9ZKMNTP6ptJaionhP5cBb541nXPlW60Jepo9RV/a4fX4XWW9CuFNK22krhrj1+rgzifNCsw==",
      "requires": {
        "bytes": "3.1.0",
        "content-type": "~1.0.4",
        "debug": "2.6.9",
        "depd": "~1.1.2",
        "http-errors": "1.7.2",
        "iconv-lite": "0.4.24",
        "on-finished": "~2.3.0",
        "qs": "6.7.0",
        "raw-body": "2.4.0",
        "type-is": "~1.6.17"
      },
      "dependencies": {
        "http-errors": {
          "version": "1.7.2",
          "resolved": "https://registry.npmjs.org/http-errors/-/http-errors-1.7.2.tgz",
          "integrity": "sha512-uUQBt3H/cSIVfch6i1EuPNy/YsRSOUBXTVfZ+yR7Zjez3qjBz6i9+i4zjNaoqcoFVI4lQJ5plg63TvGfRSDCRg==",
          "requires": {
            "depd": "~1.1.2",
            "inherits": "2.0.3",
            "setprototypeof": "1.1.1",
            "statuses": ">= 1.5.0 < 2",
            "toidentifier": "1.0.0"
          }
        },
        "iconv-lite": {
          "version": "0.4.24",
          "resolved": "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz",
          "integrity": "sha512-v3MXnZAcvnywkTUEZomIActle7RXXeedOR31wwl7VlyoXO4Qi9arvSenNQWne1TcRwhCL1HwLI21bEqdpj8/rA==",
          "requires": {
            "safer-buffer": ">= 2.1.2 < 3"
          }
        },
        "qs": {
          "version": "6.7.0",
          "resolved": "https://registry.npmjs.org/qs/-/qs-6.7.0.tgz",
          "integrity": "sha512-VCdBRNFTX1fyE7Nb6FYoURo/SPe62QCaAyzJvUjwRaIsc+NePBEniHlvxFmmX56+HZphIGtV0XeCirBtpDrTyQ=="
        },
        "setprototypeof": {
          "version": "1.1.1",
          "resolved": "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.1.1.tgz",
          "integrity": "sha512-JvdAWfbXeIGaZ9cILp38HntZSFSo3mWg6xGcJJsd+d4aRMOqauag1C63dJfDw7OaMYwEbHMOxEZ1lqVRYP2OAw=="
        },
        "statuses": {
          "version": "1.5.0",
          "resolved": "https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz",
          "integrity": "sha1-Fhx9rBd2Wf2YEfQ3cfqZOBR4Yow="
        }
      }
    },
    "boolbase": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/boolbase/-/boolbase-1.0.0.tgz",
      "integrity": "sha1-aN/1++YMUes3cl6p4+0xDcwed24="
    },
    "boxen": {
      "version": "5.1.2",
      "resolved": "https://registry.npmjs.org/boxen/-/boxen-5.1.2.tgz",
      "integrity": "sha512-9gYgQKXx+1nP8mP7CzFyaUARhg7D3n1dF/FnErWmu9l6JvGpNUN278h0aSb+QjoiKSWG+iZ3uHrcqk0qrY9RQQ==",
      "requires": {
        "ansi-align": "^3.0.0",
        "camelcase": "^6.2.0",
        "chalk": "^4.1.0",
        "cli-boxes": "^2.2.1",
        "string-width": "^4.2.2",
        "type-fest": "^0.20.2",
        "widest-line": "^3.1.0",
        "wrap-ansi": "^7.0.0"
      }
    },
    "brace-expansion": {
      "version": "1.1.11",
      "resolved": "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz",
      "integrity": "sha512-iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==",
      "requires": {
        "balanced-match": "^1.0.0",
        "concat-map": "0.0.1"
      }
    },
    "braces": {
      "version": "3.0.2",
      "resolved": "https://registry.npmjs.org/braces/-/braces-3.0.2.tgz",
      "integrity": "sha512-b8um+L1RzM3WDSzvhm6gIz1yfTbBt6YTlcEKAvsmqCZZFw46z626lVj9j1yEPW33H5H+lBQpZMP1k8l+78Ha0A==",
      "requires": {
        "fill-range": "^7.0.1"
      }
    },
    "bson": {
      "version": "4.5.2",
      "resolved": "https://registry.npmjs.org/bson/-/bson-4.5.2.tgz",
      "integrity": "sha512-8CEMJpwc7qlQtrn2rney38jQSEeMar847lz0LyitwRmVknAW8iHXrzW4fTjHfyWm0E3sukyD/zppdH+QU1QefA==",
      "requires": {
        "buffer": "^5.6.0"
      }
    },
    "buffer": {
      "version": "5.7.1",
      "resolved": "https://registry.npmjs.org/buffer/-/buffer-5.7.1.tgz",
      "integrity": "sha512-EHcyIPBQ4BSGlvjB16k5KgAJ27CIsHY/2JBmCRReo48y9rQ3MaUzWX3KVlBa4U7MyX02HdVj0K7C3WaB3ju7FQ==",
      "requires": {
        "base64-js": "^1.3.1",
        "ieee754": "^1.1.13"
      }
    },
    "buffer-from": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz",
      "integrity": "sha512-E+XQCRwSbaaiChtv6k6Dwgc+bx+Bs6vuKJHHl5kox/BaKbhiXzqQOwK4cO22yElGp2OCmjwVhT3HmxgyPGnJfQ=="
    },
    "busboy": {
      "version": "0.2.14",
      "resolved": "https://registry.npmjs.org/busboy/-/busboy-0.2.14.tgz",
      "integrity": "sha1-bCpiLvz0fFe7vh4qnDetNseSVFM=",
      "requires": {
        "dicer": "0.2.5",
        "readable-stream": "1.1.x"
      },
      "dependencies": {
        "isarray": {
          "version": "0.0.1",
          "resolved": "https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz",
          "integrity": "sha1-ihis/Kmo9Bd+Cav8YDiTmwXR7t8="
        },
        "readable-stream": {
          "version": "1.1.14",
          "resolved": "https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tgz",
          "integrity": "sha1-fPTFTvZI44EwhMY23SB54WbAgdk=",
          "requires": {
            "core-util-is": "~1.0.0",
            "inherits": "~2.0.1",
            "isarray": "0.0.1",
            "string_decoder": "~0.10.x"
          }
        },
        "string_decoder": {
          "version": "0.10.31",
          "resolved": "https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz",
          "integrity": "sha1-YuIDvEF2bGwoyfyEMB2rHFMQ+pQ="
        }
      }
    },
    "bytes": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/bytes/-/bytes-3.1.0.tgz",
      "integrity": "sha512-zauLjrfCG+xvoyaqLoV8bLVXXNGC4JqlxFCutSDWA6fJrTo2ZuvLYTqZ7aHBLZSMOopbzwv8f+wZcVzfVTI2Dg=="
    },
    "cache-base": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/cache-base/-/cache-base-1.0.1.tgz",
      "integrity": "sha512-AKcdTnFSWATd5/GCPRxr2ChwIJ85CeyrEyjRHlKxQ56d4XJMGym0uAiKn0xbLOGOl3+yRpOTi484dVCEc5AUzQ==",
      "dev": true,
      "requires": {
        "collection-visit": "^1.0.0",
        "component-emitter": "^1.2.1",
        "get-value": "^2.0.6",
        "has-value": "^1.0.0",
        "isobject": "^3.0.1",
        "set-value": "^2.0.0",
        "to-object-path": "^0.3.0",
        "union-value": "^1.0.0",
        "unset-value": "^1.0.0"
      }
    },
    "cacheable-request": {
      "version": "6.1.0",
      "resolved": "https://registry.npmjs.org/cacheable-request/-/cacheable-request-6.1.0.tgz",
      "integrity": "sha512-Oj3cAGPCqOZX7Rz64Uny2GYAZNliQSqfbePrgAQ1wKAihYmCUnraBtJtKcGR4xz7wF+LoJC+ssFZvv5BgF9Igg==",
      "requires": {
        "clone-response": "^1.0.2",
        "get-stream": "^5.1.0",
        "http-cache-semantics": "^4.0.0",
        "keyv": "^3.0.0",
        "lowercase-keys": "^2.0.0",
        "normalize-url": "^4.1.0",
        "responselike": "^1.0.2"
      },
      "dependencies": {
        "get-stream": {
          "version": "5.2.0",
          "resolved": "https://registry.npmjs.org/get-stream/-/get-stream-5.2.0.tgz",
          "integrity": "sha512-nBF+F1rAZVCu/p7rjzgA+Yb4lfYXrpl7a6VmJrU8wF9I1CKvP/QwPNZHnOlwbTkY6dvtFIzFMSyQXbLoTQPRpA==",
          "requires": {
            "pump": "^3.0.0"
          }
        },
        "lowercase-keys": {
          "version": "2.0.0",
          "resolved": "https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-2.0.0.tgz",
          "integrity": "sha512-tqNXrS78oMOE73NMxK4EMLQsQowWf8jKooH9g7xPavRT706R6bkQJ6DY2Te7QukaZsulxa30wQ7bk0pm4XiHmA=="
        }
      }
    },
    "call-bind": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/call-bind/-/call-bind-1.0.2.tgz",
      "integrity": "sha512-7O+FbCihrB5WGbFYesctwmTKae6rOiIzmz1icreWJ+0aA7LJfuqhEso2T9ncpcFtzMQtzXf2QGGueWJGTYsqrA==",
      "requires": {
        "function-bind": "^1.1.1",
        "get-intrinsic": "^1.0.2"
      }
    },
    "camelcase": {
      "version": "6.2.0",
      "resolved": "https://registry.npmjs.org/camelcase/-/camelcase-6.2.0.tgz",
      "integrity": "sha512-c7wVvbw3f37nuobQNtgsgG9POC9qMbNuMQmTCqZv23b6MIz0fcYpBiOlv9gEN/hdLdnZTDQhg6e9Dq5M1vKvfg=="
    },
    "capture-stack-trace": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/capture-stack-trace/-/capture-stack-trace-1.0.1.tgz",
      "integrity": "sha512-mYQLZnx5Qt1JgB1WEiMCf2647plpGeQ2NMR/5L0HNZzGQo4fuSPnK+wjfPnKZV0aiJDgzmWqqkV/g7JD+DW0qw==",
      "dev": true
    },
    "center-align": {
      "version": "0.1.3",
      "resolved": "https://registry.npmjs.org/center-align/-/center-align-0.1.3.tgz",
      "integrity": "sha1-qg0yYptu6XIgBBHL1EYckHvCt60=",
      "requires": {
        "align-text": "^0.1.3",
        "lazy-cache": "^1.0.3"
      }
    },
    "chalk": {
      "version": "4.1.2",
      "resolved": "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz",
      "integrity": "sha512-oKnbhFyRIXpUuez8iBMmyEa4nbj4IOQyuhc/wy9kY7/WVPcwIO9VA668Pu8RkO7+0G76SLROeyw9CpQ061i4mA==",
      "requires": {
        "ansi-styles": "^4.1.0",
        "supports-color": "^7.1.0"
      }
    },
    "chokidar": {
      "version": "3.5.2",
      "resolved": "https://registry.npmjs.org/chokidar/-/chokidar-3.5.2.tgz",
      "integrity": "sha512-ekGhOnNVPgT77r4K/U3GDhu+FQ2S8TnK/s2KbIGXi0SZWuwkZ2QNyfWdZW+TVfn84DpEP7rLeCt2UI6bJ8GwbQ==",
      "requires": {
        "anymatch": "~3.1.2",
        "braces": "~3.0.2",
        "fsevents": "~2.3.2",
        "glob-parent": "~5.1.2",
        "is-binary-path": "~2.1.0",
        "is-glob": "~4.0.1",
        "normalize-path": "~3.0.0",
        "readdirp": "~3.6.0"
      }
    },
    "ci-info": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/ci-info/-/ci-info-2.0.0.tgz",
      "integrity": "sha512-5tK7EtrZ0N+OLFMthtqOj4fI2Jeb88C4CAZPu25LDVUgXJ0A3Js4PMGqrn0JU1W0Mh1/Z8wZzYPxqUrXeBboCQ=="
    },
    "class-utils": {
      "version": "0.3.6",
      "resolved": "https://registry.npmjs.org/class-utils/-/class-utils-0.3.6.tgz",
      "integrity": "sha512-qOhPa/Fj7s6TY8H8esGu5QNpMMQxz79h+urzrNYN6mn+9BnxlDGf5QZ+XeCDsxSjPqsSR56XOZOJmpeurnLMeg==",
      "dev": true,
      "requires": {
        "arr-union": "^3.1.0",
        "define-property": "^0.2.5",
        "isobject": "^3.0.0",
        "static-extend": "^0.1.1"
      },
      "dependencies": {
        "define-property": {
          "version": "0.2.5",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
          "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^0.1.0"
          }
        }
      }
    },
    "cli-boxes": {
      "version": "2.2.1",
      "resolved": "https://registry.npmjs.org/cli-boxes/-/cli-boxes-2.2.1.tgz",
      "integrity": "sha512-y4coMcylgSCdVinjiDBuR8PCC2bLjyGTwEmPb9NHR/QaNU6EUOXcTY/s6VjGMD6ENSEaeQYHCY0GNGS5jfMwPw=="
    },
    "cliui": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/cliui/-/cliui-2.1.0.tgz",
      "integrity": "sha1-S0dXYP+AJkx2LDoXGQMukcf+oNE=",
      "requires": {
        "center-align": "^0.1.1",
        "right-align": "^0.1.1",
        "wordwrap": "0.0.2"
      }
    },
    "clone-response": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/clone-response/-/clone-response-1.0.2.tgz",
      "integrity": "sha1-0dyXOSAxTfZ/vrlCI7TuNQI56Ws=",
      "requires": {
        "mimic-response": "^1.0.0"
      }
    },
    "collection-visit": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/collection-visit/-/collection-visit-1.0.0.tgz",
      "integrity": "sha1-S8A3PBZLwykbTTaMgpzxqApZ3KA=",
      "dev": true,
      "requires": {
        "map-visit": "^1.0.0",
        "object-visit": "^1.0.0"
      }
    },
    "color-convert": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz",
      "integrity": "sha512-RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==",
      "requires": {
        "color-name": "~1.1.4"
      }
    },
    "color-name": {
      "version": "1.1.4",
      "resolved": "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz",
      "integrity": "sha512-dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA=="
    },
    "colors": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/colors/-/colors-1.1.2.tgz",
      "integrity": "sha1-FopHAXVran9RoSzgyXv6KMCE7WM=",
      "dev": true
    },
    "commander": {
      "version": "2.20.3",
      "resolved": "https://registry.npmjs.org/commander/-/commander-2.20.3.tgz",
      "integrity": "sha512-GpVkmM8vF2vQUkj2LvZmD35JxeJOLCwJ9cUkugyk2nuhbv3+mJvpLYYt+0+USMxE+oj+ey/lJEnhZw75x/OMcQ=="
    },
    "component-emitter": {
      "version": "1.3.0",
      "resolved": "https://registry.npmjs.org/component-emitter/-/component-emitter-1.3.0.tgz",
      "integrity": "sha512-Rd3se6QB+sO1TwqZjscQrurpEPIfO0/yYnSin6Q/rD3mOutHvUrCAhJub3r90uNb+SESBuE0QYoB90YdfatsRg==",
      "dev": true
    },
    "concat-map": {
      "version": "0.0.1",
      "resolved": "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz",
      "integrity": "sha1-2Klr13/Wjfd5OnMDajug1UBdR3s="
    },
    "concat-stream": {
      "version": "1.6.2",
      "resolved": "https://registry.npmjs.org/concat-stream/-/concat-stream-1.6.2.tgz",
      "integrity": "sha512-27HBghJxjiZtIk3Ycvn/4kbJk/1uZuJFfuPEns6LaEvpvG1f0hTea8lilrouyo9mVc2GWdcEZ8OLoGmSADlrCw==",
      "requires": {
        "buffer-from": "^1.0.0",
        "inherits": "^2.0.3",
        "readable-stream": "^2.2.2",
        "typedarray": "^0.0.6"
      }
    },
    "config-chain": {
      "version": "1.1.13",
      "resolved": "https://registry.npmjs.org/config-chain/-/config-chain-1.1.13.tgz",
      "integrity": "sha512-qj+f8APARXHrM0hraqXYb2/bOVSV4PvJQlNZ/DVj0QrmNM2q2euizkeuVckQ57J+W0mRH6Hvi+k50M4Jul2VRQ==",
      "requires": {
        "ini": "^1.3.4",
        "proto-list": "~1.2.1"
      }
    },
    "configstore": {
      "version": "5.0.1",
      "resolved": "https://registry.npmjs.org/configstore/-/configstore-5.0.1.tgz",
      "integrity": "sha512-aMKprgk5YhBNyH25hj8wGt2+D52Sw1DRRIzqBwLp2Ya9mFmY8KPvvtvmna8SxVR9JMZ4kzMD68N22vlaRpkeFA==",
      "requires": {
        "dot-prop": "^5.2.0",
        "graceful-fs": "^4.1.2",
        "make-dir": "^3.0.0",
        "unique-string": "^2.0.0",
        "write-file-atomic": "^3.0.0",
        "xdg-basedir": "^4.0.0"
      }
    },
    "connect": {
      "version": "3.7.0",
      "resolved": "https://registry.npmjs.org/connect/-/connect-3.7.0.tgz",
      "integrity": "sha512-ZqRXc+tZukToSNmh5C2iWMSoV3X1YUcPbqEM4DkEG5tNQXrQUZCNVGGv3IuicnkMtPfGf3Xtp8WCXs295iQ1pQ==",
      "dev": true,
      "requires": {
        "debug": "2.6.9",
        "finalhandler": "1.1.2",
        "parseurl": "~1.3.3",
        "utils-merge": "1.0.1"
      },
      "dependencies": {
        "finalhandler": {
          "version": "1.1.2",
          "resolved": "https://registry.npmjs.org/finalhandler/-/finalhandler-1.1.2.tgz",
          "integrity": "sha512-aAWcW57uxVNrQZqFXjITpW3sIUQmHGG3qSb9mUah9MgMC4NeWhNOlNjXEYq3HjRAvL6arUviZGGJsBg6z0zsWA==",
          "dev": true,
          "requires": {
            "debug": "2.6.9",
            "encodeurl": "~1.0.2",
            "escape-html": "~1.0.3",
            "on-finished": "~2.3.0",
            "parseurl": "~1.3.3",
            "statuses": "~1.5.0",
            "unpipe": "~1.0.0"
          }
        },
        "statuses": {
          "version": "1.5.0",
          "resolved": "https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz",
          "integrity": "sha1-Fhx9rBd2Wf2YEfQ3cfqZOBR4Yow=",
          "dev": true
        }
      }
    },
    "connect-livereload": {
      "version": "0.6.1",
      "resolved": "https://registry.npmjs.org/connect-livereload/-/connect-livereload-0.6.1.tgz",
      "integrity": "sha512-3R0kMOdL7CjJpU66fzAkCe6HNtd3AavCS4m+uW4KtJjrdGPT0SQEZieAYd+cm+lJoBznNQ4lqipYWkhBMgk00g==",
      "dev": true
    },
    "content-disposition": {
      "version": "0.5.2",
      "resolved": "https://registry.npmjs.org/content-disposition/-/content-disposition-0.5.2.tgz",
      "integrity": "sha1-DPaLud318r55YcOoUXjLhdunjLQ="
    },
    "content-type": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/content-type/-/content-type-1.0.4.tgz",
      "integrity": "sha512-hIP3EEPs8tB9AT1L+NUqtwOAps4mk2Zob89MWXMHjHWg9milF/j4osnnQLXBCBFBk/tvIG/tUc9mOUJiPBhPXA=="
    },
    "continuable-cache": {
      "version": "0.3.1",
      "resolved": "https://registry.npmjs.org/continuable-cache/-/continuable-cache-0.3.1.tgz",
      "integrity": "sha1-vXJ6f67XfnH/OYWskzUakSczrQ8=",
      "dev": true
    },
    "cookie": {
      "version": "0.4.0",
      "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.4.0.tgz",
      "integrity": "sha512-+Hp8fLp57wnUSt0tY0tHEXh4voZRDnoIrZPqlo3DPiI4y9lwg/jqx+1Om94/W6ZaPDOUbnjOt/99w66zk+l1Xg=="
    },
    "cookie-parser": {
      "version": "1.4.5",
      "resolved": "https://registry.npmjs.org/cookie-parser/-/cookie-parser-1.4.5.tgz",
      "integrity": "sha512-f13bPUj/gG/5mDr+xLmSxxDsB9DQiTIfhJS/sqjrmfAWiAN+x2O4i/XguTL9yDZ+/IFDanJ+5x7hC4CXT9Tdzw==",
      "requires": {
        "cookie": "0.4.0",
        "cookie-signature": "1.0.6"
      }
    },
    "cookie-signature": {
      "version": "1.0.6",
      "resolved": "https://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.6.tgz",
      "integrity": "sha1-4wOogrNCzD7oylE6eZmXNNqzriw="
    },
    "copy-descriptor": {
      "version": "0.1.1",
      "resolved": "https://registry.npmjs.org/copy-descriptor/-/copy-descriptor-0.1.1.tgz",
      "integrity": "sha1-Z29us8OZl8LuGsOpJP1hJHSPV40=",
      "dev": true
    },
    "core-util-is": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.3.tgz",
      "integrity": "sha512-ZQBvi1DcpJ4GDqanjucZ2Hj3wEO5pZDS89BWbkcrvdxksJorwUDDZamX9ldFkp9aw2lmBDLgkObEA4DWNJ9FYQ=="
    },
    "create-error-class": {
      "version": "3.0.2",
      "resolved": "https://registry.npmjs.org/create-error-class/-/create-error-class-3.0.2.tgz",
      "integrity": "sha1-Br56vvlHo/FKMP1hBnHUAbyot7Y=",
      "dev": true,
      "requires": {
        "capture-stack-trace": "^1.0.0"
      }
    },
    "cross-spawn": {
      "version": "5.1.0",
      "resolved": "https://registry.npmjs.org/cross-spawn/-/cross-spawn-5.1.0.tgz",
      "integrity": "sha1-6L0O/uWPz/b4+UUQoKVUu/ojVEk=",
      "dev": true,
      "requires": {
        "lru-cache": "^4.0.1",
        "shebang-command": "^1.2.0",
        "which": "^1.2.9"
      }
    },
    "crypto-random-string": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/crypto-random-string/-/crypto-random-string-2.0.0.tgz",
      "integrity": "sha512-v1plID3y9r/lPhviJ1wrXpLeyUIGAZ2SHNYTEapm7/8A9nLPoyvVp3RK/EPFqn5kEznyWgYZNsRtYYIWbuG8KA=="
    },
    "css-select": {
      "version": "4.1.3",
      "resolved": "https://registry.npmjs.org/css-select/-/css-select-4.1.3.tgz",
      "integrity": "sha512-gT3wBNd9Nj49rAbmtFHj1cljIAOLYSX1nZ8CB7TBO3INYckygm5B7LISU/szY//YmdiSLbJvDLOx9VnMVpMBxA==",
      "requires": {
        "boolbase": "^1.0.0",
        "css-what": "^5.0.0",
        "domhandler": "^4.2.0",
        "domutils": "^2.6.0",
        "nth-check": "^2.0.0"
      }
    },
    "css-what": {
      "version": "5.0.1",
      "resolved": "https://registry.npmjs.org/css-what/-/css-what-5.0.1.tgz",
      "integrity": "sha512-FYDTSHb/7KXsWICVsxdmiExPjCfRC4qRFBdVwv7Ax9hMnvMmEjP9RfxTEZ3qPZGmADDn2vAKSo9UcN1jKVYscg=="
    },
    "cssbeautify": {
      "version": "0.3.1",
      "resolved": "https://registry.npmjs.org/cssbeautify/-/cssbeautify-0.3.1.tgz",
      "integrity": "sha1-Et0fc0A1wub6ymfcvc73TkKBE5c="
    },
    "cssdom": {
      "version": "1.0.23",
      "resolved": "https://registry.npmjs.org/cssdom/-/cssdom-1.0.23.tgz",
      "integrity": "sha512-8P2hws5szJzMwJQFsqlIBjBzwa63ajZcZjKvd4XrnfAm5pQfmAsfEDsmjYENl2ia/wYtGN3sArxLlDYvYJKMdw==",
      "requires": {
        "utils-extend": "^1.0.7"
      }
    },
    "dateformat": {
      "version": "3.0.3",
      "resolved": "https://registry.npmjs.org/dateformat/-/dateformat-3.0.3.tgz",
      "integrity": "sha512-jyCETtSl3VMZMWeRo7iY1FL19ges1t55hMo5yaam4Jrsm5EPL89UQkoQRyiI+Yf4k8r2ZpdngkV8hr1lIdjb3Q==",
      "dev": true
    },
    "debug": {
      "version": "2.6.9",
      "resolved": "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz",
      "integrity": "sha512-bC7ElrdJaJnPbAP+1EotYvqZsb3ecl5wi6Bfi6BJTUcNowp6cvspg0jXznRTKDjm/E7AdgFBVeAPVMNcKGsHMA==",
      "requires": {
        "ms": "2.0.0"
      }
    },
    "decamelize": {
      "version": "1.2.0",
      "resolved": "https://registry.npmjs.org/decamelize/-/decamelize-1.2.0.tgz",
      "integrity": "sha1-9lNNFRSCabIDUue+4m9QH5oZEpA="
    },
    "decode-html": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/decode-html/-/decode-html-2.0.0.tgz",
      "integrity": "sha1-fQqIfORCgOYJeKcH67f4CB/WHqo="
    },
    "decode-uri-component": {
      "version": "0.2.0",
      "resolved": "https://registry.npmjs.org/decode-uri-component/-/decode-uri-component-0.2.0.tgz",
      "integrity": "sha1-6zkTMzRYd1y4TNGh+uBiEGu4dUU=",
      "dev": true
    },
    "decompress-response": {
      "version": "3.3.0",
      "resolved": "https://registry.npmjs.org/decompress-response/-/decompress-response-3.3.0.tgz",
      "integrity": "sha1-gKTdMjdIOEv6JICDYirt7Jgq3/M=",
      "requires": {
        "mimic-response": "^1.0.0"
      }
    },
    "deep-extend": {
      "version": "0.6.0",
      "resolved": "https://registry.npmjs.org/deep-extend/-/deep-extend-0.6.0.tgz",
      "integrity": "sha512-LOHxIOaPYdHlJRtCQfDIVZtfw/ufM8+rVj649RIHzcm/vGwQRXFt6OPqIFWsm2XEMrNIEtWR64sY1LEKD2vAOA=="
    },
    "defer-to-connect": {
      "version": "1.1.3",
      "resolved": "https://registry.npmjs.org/defer-to-connect/-/defer-to-connect-1.1.3.tgz",
      "integrity": "sha512-0ISdNousHvZT2EiFlZeZAHBUvSxmKswVCEf8hW7KWgG4a8MVEu/3Vb6uWYozkjylyCxe0JBIiRB1jV45S70WVQ=="
    },
    "define-properties": {
      "version": "1.1.3",
      "resolved": "https://registry.npmjs.org/define-properties/-/define-properties-1.1.3.tgz",
      "integrity": "sha512-3MqfYKj2lLzdMSf8ZIZE/V+Zuy+BgD6f164e8K2w7dgnpKArBDerGYpM46IYYcjnkdPNMjPk9A6VFB8+3SKlXQ==",
      "requires": {
        "object-keys": "^1.0.12"
      }
    },
    "define-property": {
      "version": "2.0.2",
      "resolved": "https://registry.npmjs.org/define-property/-/define-property-2.0.2.tgz",
      "integrity": "sha512-jwK2UV4cnPpbcG7+VRARKTZPUWowwXA8bzH5NP6ud0oeAxyYPuGZUAC7hMugpCdz4BeSZl2Dl9k66CHJ/46ZYQ==",
      "dev": true,
      "requires": {
        "is-descriptor": "^1.0.2",
        "isobject": "^3.0.1"
      },
      "dependencies": {
        "is-accessor-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
          "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-data-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
          "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-descriptor": {
          "version": "1.0.2",
          "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
          "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
          "dev": true,
          "requires": {
            "is-accessor-descriptor": "^1.0.0",
            "is-data-descriptor": "^1.0.0",
            "kind-of": "^6.0.2"
          }
        }
      }
    },
    "denque": {
      "version": "1.5.1",
      "resolved": "https://registry.npmjs.org/denque/-/denque-1.5.1.tgz",
      "integrity": "sha512-XwE+iZ4D6ZUB7mfYRMb5wByE8L74HCn30FBN7sWnXksWc1LO1bPDl67pBR9o/kC4z/xSNAwkMYcGgqDV3BE3Hw=="
    },
    "depd": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/depd/-/depd-1.1.2.tgz",
      "integrity": "sha1-m81S4UwJd2PnSbJ0xDRu0uVgtak="
    },
    "destroy": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/destroy/-/destroy-1.0.4.tgz",
      "integrity": "sha1-l4hXRCxEdJ5CBmE+N5RiBYJqvYA="
    },
    "detect-file": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/detect-file/-/detect-file-1.0.0.tgz",
      "integrity": "sha1-8NZtA2cqglyxtzvbP+YjEMjlUrc="
    },
    "dicer": {
      "version": "0.2.5",
      "resolved": "https://registry.npmjs.org/dicer/-/dicer-0.2.5.tgz",
      "integrity": "sha1-WZbAhrszIYyBLAkL3cCc0S+stw8=",
      "requires": {
        "readable-stream": "1.1.x",
        "streamsearch": "0.1.2"
      },
      "dependencies": {
        "isarray": {
          "version": "0.0.1",
          "resolved": "https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz",
          "integrity": "sha1-ihis/Kmo9Bd+Cav8YDiTmwXR7t8="
        },
        "readable-stream": {
          "version": "1.1.14",
          "resolved": "https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tgz",
          "integrity": "sha1-fPTFTvZI44EwhMY23SB54WbAgdk=",
          "requires": {
            "core-util-is": "~1.0.0",
            "inherits": "~2.0.1",
            "isarray": "0.0.1",
            "string_decoder": "~0.10.x"
          }
        },
        "string_decoder": {
          "version": "0.10.31",
          "resolved": "https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz",
          "integrity": "sha1-YuIDvEF2bGwoyfyEMB2rHFMQ+pQ="
        }
      }
    },
    "dom-converter": {
      "version": "0.2.0",
      "resolved": "https://registry.npmjs.org/dom-converter/-/dom-converter-0.2.0.tgz",
      "integrity": "sha512-gd3ypIPfOMr9h5jIKq8E3sHOTCjeirnl0WK5ZdS1AW0Odt0b1PaWaHdJ4Qk4klv+YB9aJBS7mESXjFoDQPu6DA==",
      "requires": {
        "utila": "~0.4"
      }
    },
    "dom-serializer": {
      "version": "1.3.2",
      "resolved": "https://registry.npmjs.org/dom-serializer/-/dom-serializer-1.3.2.tgz",
      "integrity": "sha512-5c54Bk5Dw4qAxNOI1pFEizPSjVsx5+bpJKmL2kPn8JhBUq2q09tTCa3mjijun2NfK78NMouDYNMBkOrPZiS+ig==",
      "requires": {
        "domelementtype": "^2.0.1",
        "domhandler": "^4.2.0",
        "entities": "^2.0.0"
      },
      "dependencies": {
        "entities": {
          "version": "2.2.0",
          "resolved": "https://registry.npmjs.org/entities/-/entities-2.2.0.tgz",
          "integrity": "sha512-p92if5Nz619I0w+akJrLZH0MX0Pb5DX39XOwQTtXSdQQOaYH03S1uIQp4mhOZtAXrxq4ViO67YTiLBo2638o9A=="
        }
      }
    },
    "domelementtype": {
      "version": "2.2.0",
      "resolved": "https://registry.npmjs.org/domelementtype/-/domelementtype-2.2.0.tgz",
      "integrity": "sha512-DtBMo82pv1dFtUmHyr48beiuq792Sxohr+8Hm9zoxklYPfa6n0Z3Byjj2IV7bmr2IyqClnqEQhfgHJJ5QF0R5A=="
    },
    "domhandler": {
      "version": "4.2.2",
      "resolved": "https://registry.npmjs.org/domhandler/-/domhandler-4.2.2.tgz",
      "integrity": "sha512-PzE9aBMsdZO8TK4BnuJwH0QT41wgMbRzuZrHUcpYncEjmQazq8QEaBWgLG7ZyC/DAZKEgglpIA6j4Qn/HmxS3w==",
      "requires": {
        "domelementtype": "^2.2.0"
      }
    },
    "domutils": {
      "version": "2.8.0",
      "resolved": "https://registry.npmjs.org/domutils/-/domutils-2.8.0.tgz",
      "integrity": "sha512-w96Cjofp72M5IIhpjgobBimYEfoPjx1Vx0BSX9P30WBdZW2WIKU0T1Bd0kz2eNZ9ikjKgHbEyKx8BB6H1L3h3A==",
      "requires": {
        "dom-serializer": "^1.0.1",
        "domelementtype": "^2.2.0",
        "domhandler": "^4.2.0"
      }
    },
    "dot-prop": {
      "version": "5.3.0",
      "resolved": "https://registry.npmjs.org/dot-prop/-/dot-prop-5.3.0.tgz",
      "integrity": "sha512-QM8q3zDe58hqUqjraQOmzZ1LIH9SWQJTlEKCH4kJ2oQvLZk7RbQXvtDM2XEq3fwkV9CCvvH4LA0AV+ogFsBM2Q==",
      "requires": {
        "is-obj": "^2.0.0"
      }
    },
    "duplexer3": {
      "version": "0.1.4",
      "resolved": "https://registry.npmjs.org/duplexer3/-/duplexer3-0.1.4.tgz",
      "integrity": "sha1-7gHdHKwO08vH/b6jfcCo8c4ALOI="
    },
    "duplexify": {
      "version": "3.7.1",
      "resolved": "https://registry.npmjs.org/duplexify/-/duplexify-3.7.1.tgz",
      "integrity": "sha512-07z8uv2wMyS51kKhD1KsdXJg5WQ6t93RneqRxUHnskXVtlYYkLqM0gqStQZ3pj073g687jPCHrqNfCzawLYh5g==",
      "dev": true,
      "requires": {
        "end-of-stream": "^1.0.0",
        "inherits": "^2.0.1",
        "readable-stream": "^2.0.0",
        "stream-shift": "^1.0.0"
      }
    },
    "editorconfig": {
      "version": "0.15.3",
      "resolved": "https://registry.npmjs.org/editorconfig/-/editorconfig-0.15.3.tgz",
      "integrity": "sha512-M9wIMFx96vq0R4F+gRpY3o2exzb8hEj/n9S8unZtHSvYjibBp/iMufSzvmOcV/laG0ZtuTVGtiJggPOSW2r93g==",
      "requires": {
        "commander": "^2.19.0",
        "lru-cache": "^4.1.5",
        "semver": "^5.6.0",
        "sigmund": "^1.0.1"
      }
    },
    "ee-first": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz",
      "integrity": "sha1-WQxhFWsK4vTwJVcyoViyZrxWsh0="
    },
    "ejs": {
      "version": "2.6.2",
      "resolved": "https://registry.npmjs.org/ejs/-/ejs-2.6.2.tgz",
      "integrity": "sha512-PcW2a0tyTuPHz3tWyYqtK6r1fZ3gp+3Sop8Ph+ZYN81Ob5rwmbHEzaqs10N3BEsaGTkh/ooniXK+WwszGlc2+Q=="
    },
    "emoji-regex": {
      "version": "8.0.0",
      "resolved": "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz",
      "integrity": "sha512-MSjYzcWNOA0ewAHpz0MxpYFvwg6yjy1NG3xteoqz644VCo/RPgnr1/GGt+ic3iJTzQ8Eu3TdM14SawnVUmGE6A=="
    },
    "encodeurl": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz",
      "integrity": "sha1-rT/0yG7C0CkyL1oCw6mmBslbP1k="
    },
    "end-of-stream": {
      "version": "1.4.4",
      "resolved": "https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz",
      "integrity": "sha512-+uw1inIHVPQoaVuHzRyXd21icM+cnt4CzD5rW+NC1wjOUSTOs+Te7FOv7AhN7vS9x/oIyhLP5PR1H+phQAHu5Q==",
      "requires": {
        "once": "^1.4.0"
      }
    },
    "entities": {
      "version": "3.0.1",
      "resolved": "https://registry.npmjs.org/entities/-/entities-3.0.1.tgz",
      "integrity": "sha512-WiyBqoomrwMdFG1e0kqvASYfnlb0lp8M5o5Fw2OFq1hNZxxcNk8Ik0Xm7LxzBhuidnZB/UtBqVCgUz3kBOP51Q==",
      "dev": true
    },
    "error": {
      "version": "7.2.1",
      "resolved": "https://registry.npmjs.org/error/-/error-7.2.1.tgz",
      "integrity": "sha512-fo9HBvWnx3NGUKMvMwB/CBCMMrfEJgbDTVDEkPygA3Bdd3lM1OyCd+rbQ8BwnpF6GdVeOLDNmyL4N5Bg80ZvdA==",
      "dev": true,
      "requires": {
        "string-template": "~0.2.1"
      }
    },
    "es-abstract": {
      "version": "1.18.6",
      "resolved": "https://registry.npmjs.org/es-abstract/-/es-abstract-1.18.6.tgz",
      "integrity": "sha512-kAeIT4cku5eNLNuUKhlmtuk1/TRZvQoYccn6TO0cSVdf1kzB0T7+dYuVK9MWM7l+/53W2Q8M7N2c6MQvhXFcUQ==",
      "requires": {
        "call-bind": "^1.0.2",
        "es-to-primitive": "^1.2.1",
        "function-bind": "^1.1.1",
        "get-intrinsic": "^1.1.1",
        "get-symbol-description": "^1.0.0",
        "has": "^1.0.3",
        "has-symbols": "^1.0.2",
        "internal-slot": "^1.0.3",
        "is-callable": "^1.2.4",
        "is-negative-zero": "^2.0.1",
        "is-regex": "^1.1.4",
        "is-string": "^1.0.7",
        "object-inspect": "^1.11.0",
        "object-keys": "^1.1.1",
        "object.assign": "^4.1.2",
        "string.prototype.trimend": "^1.0.4",
        "string.prototype.trimstart": "^1.0.4",
        "unbox-primitive": "^1.0.1"
      }
    },
    "es-to-primitive": {
      "version": "1.2.1",
      "resolved": "https://registry.npmjs.org/es-to-primitive/-/es-to-primitive-1.2.1.tgz",
      "integrity": "sha512-QCOllgZJtaUo9miYBcLChTUaHNjJF3PYs1VidD7AwiEj1kYxKeQTctLAezAOH5ZKRH0g2IgPn6KwB4IT8iRpvA==",
      "requires": {
        "is-callable": "^1.1.4",
        "is-date-object": "^1.0.1",
        "is-symbol": "^1.0.2"
      }
    },
    "escape-goat": {
      "version": "2.1.1",
      "resolved": "https://registry.npmjs.org/escape-goat/-/escape-goat-2.1.1.tgz",
      "integrity": "sha512-8/uIhbG12Csjy2JEW7D9pHbreaVaS/OpN3ycnyvElTdwM5n6GY6W6e2IPemfvGZeUMqZ9A/3GqIZMgKnBhAw/Q=="
    },
    "escape-html": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz",
      "integrity": "sha1-Aljq5NPQwJdN4cFpGI7wBR0dGYg="
    },
    "escape-string-regexp": {
      "version": "1.0.5",
      "resolved": "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz",
      "integrity": "sha1-G2HAViGQqN/2rjuyzwIAyhMLhtQ=",
      "dev": true
    },
    "esprima": {
      "version": "4.0.1",
      "resolved": "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz",
      "integrity": "sha512-eGuFFw7Upda+g4p+QHvnW0RyTX/SVeJBDM/gCtMARO0cLuT2HcEKnTPvhjV6aGeqrCB/sbNop0Kszm0jsaWU4A==",
      "dev": true
    },
    "etag": {
      "version": "1.8.1",
      "resolved": "https://registry.npmjs.org/etag/-/etag-1.8.1.tgz",
      "integrity": "sha1-Qa4u62XvpiJorr/qg6x9eSmbCIc="
    },
    "eventemitter2": {
      "version": "0.4.14",
      "resolved": "https://registry.npmjs.org/eventemitter2/-/eventemitter2-0.4.14.tgz",
      "integrity": "sha1-j2G3XN4BKy6esoTUVFWDtWQ7Yas=",
      "dev": true
    },
    "events": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/events/-/events-1.1.1.tgz",
      "integrity": "sha1-nr23Y1rQmccNzEwqH1AEKI6L2SQ=",
      "dev": true
    },
    "execa": {
      "version": "0.7.0",
      "resolved": "https://registry.npmjs.org/execa/-/execa-0.7.0.tgz",
      "integrity": "sha1-lEvs00zEHuMqY6n68nrVpl/Fl3c=",
      "dev": true,
      "requires": {
        "cross-spawn": "^5.0.1",
        "get-stream": "^3.0.0",
        "is-stream": "^1.1.0",
        "npm-run-path": "^2.0.0",
        "p-finally": "^1.0.0",
        "signal-exit": "^3.0.0",
        "strip-eof": "^1.0.0"
      },
      "dependencies": {
        "get-stream": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/get-stream/-/get-stream-3.0.0.tgz",
          "integrity": "sha1-jpQ9E1jcN1VQVOy+LtsFqhdO3hQ=",
          "dev": true
        }
      }
    },
    "exit": {
      "version": "0.1.2",
      "resolved": "https://registry.npmjs.org/exit/-/exit-0.1.2.tgz",
      "integrity": "sha1-BjJjj42HfMghB9MKD/8aF8uhzQw=",
      "dev": true
    },
    "expand-brackets": {
      "version": "2.1.4",
      "resolved": "https://registry.npmjs.org/expand-brackets/-/expand-brackets-2.1.4.tgz",
      "integrity": "sha1-t3c14xXOMPa27/D4OwQVGiJEliI=",
      "dev": true,
      "requires": {
        "debug": "^2.3.3",
        "define-property": "^0.2.5",
        "extend-shallow": "^2.0.1",
        "posix-character-classes": "^0.1.0",
        "regex-not": "^1.0.0",
        "snapdragon": "^0.8.1",
        "to-regex": "^3.0.1"
      },
      "dependencies": {
        "define-property": {
          "version": "0.2.5",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
          "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^0.1.0"
          }
        },
        "extend-shallow": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
          "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
          "dev": true,
          "requires": {
            "is-extendable": "^0.1.0"
          }
        }
      }
    },
    "expand-tilde": {
      "version": "2.0.2",
      "resolved": "https://registry.npmjs.org/expand-tilde/-/expand-tilde-2.0.2.tgz",
      "integrity": "sha1-l+gBqgUt8CRU3kawK/YhZCzchQI=",
      "requires": {
        "homedir-polyfill": "^1.0.1"
      }
    },
    "express": {
      "version": "4.16.4",
      "resolved": "https://registry.npmjs.org/express/-/express-4.16.4.tgz",
      "integrity": "sha512-j12Uuyb4FMrd/qQAm6uCHAkPtO8FDTRJZBDd5D2KOL2eLaz1yUNdUB/NOIyq0iU4q4cFarsUCrnFDPBcnksuOg==",
      "requires": {
        "accepts": "~1.3.5",
        "array-flatten": "1.1.1",
        "body-parser": "1.18.3",
        "content-disposition": "0.5.2",
        "content-type": "~1.0.4",
        "cookie": "0.3.1",
        "cookie-signature": "1.0.6",
        "debug": "2.6.9",
        "depd": "~1.1.2",
        "encodeurl": "~1.0.2",
        "escape-html": "~1.0.3",
        "etag": "~1.8.1",
        "finalhandler": "1.1.1",
        "fresh": "0.5.2",
        "merge-descriptors": "1.0.1",
        "methods": "~1.1.2",
        "on-finished": "~2.3.0",
        "parseurl": "~1.3.2",
        "path-to-regexp": "0.1.7",
        "proxy-addr": "~2.0.4",
        "qs": "6.5.2",
        "range-parser": "~1.2.0",
        "safe-buffer": "5.1.2",
        "send": "0.16.2",
        "serve-static": "1.13.2",
        "setprototypeof": "1.1.0",
        "statuses": "~1.4.0",
        "type-is": "~1.6.16",
        "utils-merge": "1.0.1",
        "vary": "~1.1.2"
      },
      "dependencies": {
        "body-parser": {
          "version": "1.18.3",
          "resolved": "https://registry.npmjs.org/body-parser/-/body-parser-1.18.3.tgz",
          "integrity": "sha1-WykhmP/dVTs6DyDe0FkrlWlVyLQ=",
          "requires": {
            "bytes": "3.0.0",
            "content-type": "~1.0.4",
            "debug": "2.6.9",
            "depd": "~1.1.2",
            "http-errors": "~1.6.3",
            "iconv-lite": "0.4.23",
            "on-finished": "~2.3.0",
            "qs": "6.5.2",
            "raw-body": "2.3.3",
            "type-is": "~1.6.16"
          }
        },
        "bytes": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/bytes/-/bytes-3.0.0.tgz",
          "integrity": "sha1-0ygVQE1olpn4Wk6k+odV3ROpYEg="
        },
        "cookie": {
          "version": "0.3.1",
          "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.3.1.tgz",
          "integrity": "sha1-5+Ch+e9DtMi6klxcWpboBtFoc7s="
        },
        "raw-body": {
          "version": "2.3.3",
          "resolved": "https://registry.npmjs.org/raw-body/-/raw-body-2.3.3.tgz",
          "integrity": "sha512-9esiElv1BrZoI3rCDuOuKCBRbuApGGaDPQfjSflGxdy4oyzqghxu6klEkkVIvBje+FF0BX9coEv8KqW6X/7njw==",
          "requires": {
            "bytes": "3.0.0",
            "http-errors": "1.6.3",
            "iconv-lite": "0.4.23",
            "unpipe": "1.0.0"
          }
        }
      }
    },
    "express-prettier": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/express-prettier/-/express-prettier-1.0.3.tgz",
      "integrity": "sha512-KN7Tz+Sap2WVCnQE6Obm5zB53s2X//jsWFOXL/2OBVXYEWEWO9An/nJW9RBw7lgMo/cKedW2DVqzr4surdMNCQ==",
      "requires": {
        "express": "^4.17.1",
        "is-stream": "^2.0.0",
        "prettier": "^2.3.0"
      },
      "dependencies": {
        "content-disposition": {
          "version": "0.5.3",
          "resolved": "https://registry.npmjs.org/content-disposition/-/content-disposition-0.5.3.tgz",
          "integrity": "sha512-ExO0774ikEObIAEV9kDo50o+79VCUdEB6n6lzKgGwupcVeRlhrj3qGAfwq8G6uBJjkqLrhT0qEYFcWng8z1z0g==",
          "requires": {
            "safe-buffer": "5.1.2"
          }
        },
        "express": {
          "version": "4.17.1",
          "resolved": "https://registry.npmjs.org/express/-/express-4.17.1.tgz",
          "integrity": "sha512-mHJ9O79RqluphRrcw2X/GTh3k9tVv8YcoyY4Kkh4WDMUYKRZUq0h1o0w2rrrxBqM7VoeUVqgb27xlEMXTnYt4g==",
          "requires": {
            "accepts": "~1.3.7",
            "array-flatten": "1.1.1",
            "body-parser": "1.19.0",
            "content-disposition": "0.5.3",
            "content-type": "~1.0.4",
            "cookie": "0.4.0",
            "cookie-signature": "1.0.6",
            "debug": "2.6.9",
            "depd": "~1.1.2",
            "encodeurl": "~1.0.2",
            "escape-html": "~1.0.3",
            "etag": "~1.8.1",
            "finalhandler": "~1.1.2",
            "fresh": "0.5.2",
            "merge-descriptors": "1.0.1",
            "methods": "~1.1.2",
            "on-finished": "~2.3.0",
            "parseurl": "~1.3.3",
            "path-to-regexp": "0.1.7",
            "proxy-addr": "~2.0.5",
            "qs": "6.7.0",
            "range-parser": "~1.2.1",
            "safe-buffer": "5.1.2",
            "send": "0.17.1",
            "serve-static": "1.14.1",
            "setprototypeof": "1.1.1",
            "statuses": "~1.5.0",
            "type-is": "~1.6.18",
            "utils-merge": "1.0.1",
            "vary": "~1.1.2"
          }
        },
        "finalhandler": {
          "version": "1.1.2",
          "resolved": "https://registry.npmjs.org/finalhandler/-/finalhandler-1.1.2.tgz",
          "integrity": "sha512-aAWcW57uxVNrQZqFXjITpW3sIUQmHGG3qSb9mUah9MgMC4NeWhNOlNjXEYq3HjRAvL6arUviZGGJsBg6z0zsWA==",
          "requires": {
            "debug": "2.6.9",
            "encodeurl": "~1.0.2",
            "escape-html": "~1.0.3",
            "on-finished": "~2.3.0",
            "parseurl": "~1.3.3",
            "statuses": "~1.5.0",
            "unpipe": "~1.0.0"
          }
        },
        "http-errors": {
          "version": "1.7.3",
          "resolved": "https://registry.npmjs.org/http-errors/-/http-errors-1.7.3.tgz",
          "integrity": "sha512-ZTTX0MWrsQ2ZAhA1cejAwDLycFsd7I7nVtnkT3Ol0aqodaKW+0CTZDQ1uBv5whptCnc8e8HeRRJxRs0kmm/Qfw==",
          "requires": {
            "depd": "~1.1.2",
            "inherits": "2.0.4",
            "setprototypeof": "1.1.1",
            "statuses": ">= 1.5.0 < 2",
            "toidentifier": "1.0.0"
          }
        },
        "inherits": {
          "version": "2.0.4",
          "resolved": "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz",
          "integrity": "sha512-k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ=="
        },
        "is-stream": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/is-stream/-/is-stream-2.0.1.tgz",
          "integrity": "sha512-hFoiJiTl63nn+kstHGBtewWSKnQLpyb155KHheA1l39uvtO9nWIop1p3udqPcUd/xbF1VLMO4n7OI6p7RbngDg=="
        },
        "mime": {
          "version": "1.6.0",
          "resolved": "https://registry.npmjs.org/mime/-/mime-1.6.0.tgz",
          "integrity": "sha512-x0Vn8spI+wuJ1O6S7gnbaQg8Pxh4NNHb7KSINmEWKiPE4RKOplvijn+NkmYmmRgP68mc70j2EbeTFRsrswaQeg=="
        },
        "ms": {
          "version": "2.1.1",
          "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.1.tgz",
          "integrity": "sha512-tgp+dl5cGk28utYktBsrFqA7HKgrhgPsg6Z/EfhWI4gl1Hwq8B/GmY/0oXZ6nF8hDVesS/FpnYaD/kOWhYQvyg=="
        },
        "qs": {
          "version": "6.7.0",
          "resolved": "https://registry.npmjs.org/qs/-/qs-6.7.0.tgz",
          "integrity": "sha512-VCdBRNFTX1fyE7Nb6FYoURo/SPe62QCaAyzJvUjwRaIsc+NePBEniHlvxFmmX56+HZphIGtV0XeCirBtpDrTyQ=="
        },
        "send": {
          "version": "0.17.1",
          "resolved": "https://registry.npmjs.org/send/-/send-0.17.1.tgz",
          "integrity": "sha512-BsVKsiGcQMFwT8UxypobUKyv7irCNRHk1T0G680vk88yf6LBByGcZJOTJCrTP2xVN6yI+XjPJcNuE3V4fT9sAg==",
          "requires": {
            "debug": "2.6.9",
            "depd": "~1.1.2",
            "destroy": "~1.0.4",
            "encodeurl": "~1.0.2",
            "escape-html": "~1.0.3",
            "etag": "~1.8.1",
            "fresh": "0.5.2",
            "http-errors": "~1.7.2",
            "mime": "1.6.0",
            "ms": "2.1.1",
            "on-finished": "~2.3.0",
            "range-parser": "~1.2.1",
            "statuses": "~1.5.0"
          }
        },
        "serve-static": {
          "version": "1.14.1",
          "resolved": "https://registry.npmjs.org/serve-static/-/serve-static-1.14.1.tgz",
          "integrity": "sha512-JMrvUwE54emCYWlTI+hGrGv5I8dEwmco/00EvkzIIsR7MqrHonbD9pO2MOfFnpFntl7ecpZs+3mW+XbQZu9QCg==",
          "requires": {
            "encodeurl": "~1.0.2",
            "escape-html": "~1.0.3",
            "parseurl": "~1.3.3",
            "send": "0.17.1"
          }
        },
        "setprototypeof": {
          "version": "1.1.1",
          "resolved": "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.1.1.tgz",
          "integrity": "sha512-JvdAWfbXeIGaZ9cILp38HntZSFSo3mWg6xGcJJsd+d4aRMOqauag1C63dJfDw7OaMYwEbHMOxEZ1lqVRYP2OAw=="
        },
        "statuses": {
          "version": "1.5.0",
          "resolved": "https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz",
          "integrity": "sha1-Fhx9rBd2Wf2YEfQ3cfqZOBR4Yow="
        }
      }
    },
    "express-session": {
      "version": "1.17.2",
      "resolved": "https://registry.npmjs.org/express-session/-/express-session-1.17.2.tgz",
      "integrity": "sha512-mPcYcLA0lvh7D4Oqr5aNJFMtBMKPLl++OKKxkHzZ0U0oDq1rpKBnkR5f5vCHR26VeArlTOEF9td4x5IjICksRQ==",
      "requires": {
        "cookie": "0.4.1",
        "cookie-signature": "1.0.6",
        "debug": "2.6.9",
        "depd": "~2.0.0",
        "on-headers": "~1.0.2",
        "parseurl": "~1.3.3",
        "safe-buffer": "5.2.1",
        "uid-safe": "~2.1.5"
      },
      "dependencies": {
        "cookie": {
          "version": "0.4.1",
          "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.4.1.tgz",
          "integrity": "sha512-ZwrFkGJxUR3EIoXtO+yVE69Eb7KlixbaeAWfBQB9vVsNn/o+Yw69gBWSSDK825hQNdN+wF8zELf3dFNl/kxkUA=="
        },
        "depd": {
          "version": "2.0.0",
          "resolved": "https://registry.npmjs.org/depd/-/depd-2.0.0.tgz",
          "integrity": "sha512-g7nH6P6dyDioJogAAGprGpCtVImJhpPk/roCzdb3fIh61/s/nPsfR6onyMwkCAR/OlC3yBC0lESvUoQEAssIrw=="
        },
        "safe-buffer": {
          "version": "5.2.1",
          "resolved": "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz",
          "integrity": "sha512-rp3So07KcdmmKbGvgaNxQSJr7bGVSVk5S9Eq1F+ppbRo70+YeaDxkw5Dd8NPN+GD6bjnYm2VuPuCXmpuYvmCXQ=="
        }
      }
    },
    "extend": {
      "version": "3.0.2",
      "resolved": "https://registry.npmjs.org/extend/-/extend-3.0.2.tgz",
      "integrity": "sha512-fjquC59cD7CyW6urNXK0FBufkZcoiGG80wTuPujX590cB5Ttln20E2UB4S/WARVqhXffZl2LNgS+gQdPIIim/g=="
    },
    "extend-shallow": {
      "version": "3.0.2",
      "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-3.0.2.tgz",
      "integrity": "sha1-Jqcarwc7OfshJxcnRhMcJwQCjbg=",
      "dev": true,
      "requires": {
        "assign-symbols": "^1.0.0",
        "is-extendable": "^1.0.1"
      },
      "dependencies": {
        "is-extendable": {
          "version": "1.0.1",
          "resolved": "https://registry.npmjs.org/is-extendable/-/is-extendable-1.0.1.tgz",
          "integrity": "sha512-arnXMxT1hhoKo9k1LZdmlNyJdDDfy2v0fXjFlmok4+i8ul/6WlbVge9bhM74OpNPQPMGUToDtz+KXa1PneJxOA==",
          "dev": true,
          "requires": {
            "is-plain-object": "^2.0.4"
          }
        }
      }
    },
    "extglob": {
      "version": "2.0.4",
      "resolved": "https://registry.npmjs.org/extglob/-/extglob-2.0.4.tgz",
      "integrity": "sha512-Nmb6QXkELsuBr24CJSkilo6UHHgbekK5UiZgfE6UHD3Eb27YC6oD+bhcT+tJ6cl8dmsgdQxnWlcry8ksBIBLpw==",
      "dev": true,
      "requires": {
        "array-unique": "^0.3.2",
        "define-property": "^1.0.0",
        "expand-brackets": "^2.1.4",
        "extend-shallow": "^2.0.1",
        "fragment-cache": "^0.2.1",
        "regex-not": "^1.0.0",
        "snapdragon": "^0.8.1",
        "to-regex": "^3.0.1"
      },
      "dependencies": {
        "define-property": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz",
          "integrity": "sha1-dp66rz9KY6rTr56NMEybvnm/sOY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^1.0.0"
          }
        },
        "extend-shallow": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
          "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
          "dev": true,
          "requires": {
            "is-extendable": "^0.1.0"
          }
        },
        "is-accessor-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
          "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-data-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
          "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-descriptor": {
          "version": "1.0.2",
          "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
          "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
          "dev": true,
          "requires": {
            "is-accessor-descriptor": "^1.0.0",
            "is-data-descriptor": "^1.0.0",
            "kind-of": "^6.0.2"
          }
        }
      }
    },
    "fast-deep-equal": {
      "version": "3.1.3",
      "resolved": "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz",
      "integrity": "sha512-f3qQ9oQy9j2AhBe/H9VC91wLmKBCCU/gDOnKNAYG5hswO7BLKj09Hc5HYNz9cGI++xlpDCIgDaitVs03ATR84Q=="
    },
    "faye-websocket": {
      "version": "0.10.0",
      "resolved": "https://registry.npmjs.org/faye-websocket/-/faye-websocket-0.10.0.tgz",
      "integrity": "sha1-TkkvjQTftviQA1B/btvy1QHnxvQ=",
      "dev": true,
      "requires": {
        "websocket-driver": ">=0.5.1"
      }
    },
    "file-match": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/file-match/-/file-match-1.0.2.tgz",
      "integrity": "sha1-ycrSZdLIrfOoFHWw30dYWQafrvc=",
      "requires": {
        "utils-extend": "^1.0.6"
      }
    },
    "file-system": {
      "version": "2.2.2",
      "resolved": "https://registry.npmjs.org/file-system/-/file-system-2.2.2.tgz",
      "integrity": "sha1-fWWDPjojR9zZVqgTxncVPtPt2Yc=",
      "requires": {
        "file-match": "^1.0.1",
        "utils-extend": "^1.0.4"
      }
    },
    "fill-range": {
      "version": "7.0.1",
      "resolved": "https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz",
      "integrity": "sha512-qOo9F+dMUmC2Lcb4BbVvnKJxTPjCm+RRpe4gDuGrzkL7mEVl/djYSu2OdQ2Pa302N4oqkSg9ir6jaLWJ2USVpQ==",
      "requires": {
        "to-regex-range": "^5.0.1"
      }
    },
    "finalhandler": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/finalhandler/-/finalhandler-1.1.1.tgz",
      "integrity": "sha512-Y1GUDo39ez4aHAw7MysnUD5JzYX+WaIj8I57kO3aEPT1fFRL4sr7mjei97FgnwhAyyzRYmQZaTHb2+9uZ1dPtg==",
      "requires": {
        "debug": "2.6.9",
        "encodeurl": "~1.0.2",
        "escape-html": "~1.0.3",
        "on-finished": "~2.3.0",
        "parseurl": "~1.3.2",
        "statuses": "~1.4.0",
        "unpipe": "~1.0.0"
      }
    },
    "findup-sync": {
      "version": "0.3.0",
      "resolved": "https://registry.npmjs.org/findup-sync/-/findup-sync-0.3.0.tgz",
      "integrity": "sha1-N5MKpdgWt3fANEXhlmzGeQpMCxY=",
      "dev": true,
      "requires": {
        "glob": "~5.0.0"
      },
      "dependencies": {
        "glob": {
          "version": "5.0.15",
          "resolved": "https://registry.npmjs.org/glob/-/glob-5.0.15.tgz",
          "integrity": "sha1-G8k2ueAvSmA/zCIuz3Yz0wuLk7E=",
          "dev": true,
          "requires": {
            "inflight": "^1.0.4",
            "inherits": "2",
            "minimatch": "2 || 3",
            "once": "^1.3.0",
            "path-is-absolute": "^1.0.0"
          }
        }
      }
    },
    "fined": {
      "version": "1.2.0",
      "resolved": "https://registry.npmjs.org/fined/-/fined-1.2.0.tgz",
      "integrity": "sha512-ZYDqPLGxDkDhDZBjZBb+oD1+j0rA4E0pXY50eplAAOPg2N/gUBSSk5IM1/QhPfyVo19lJ+CvXpqfvk+b2p/8Ng==",
      "requires": {
        "expand-tilde": "^2.0.2",
        "is-plain-object": "^2.0.3",
        "object.defaults": "^1.1.0",
        "object.pick": "^1.2.0",
        "parse-filepath": "^1.0.1"
      }
    },
    "flagged-respawn": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/flagged-respawn/-/flagged-respawn-1.0.1.tgz",
      "integrity": "sha512-lNaHNVymajmk0OJMBn8fVUAU1BtDeKIqKoVhk4xAALB57aALg6b4W0MfJ/cUE0g9YBXy5XhSlPIpYIJ7HaY/3Q=="
    },
    "for-in": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/for-in/-/for-in-1.0.2.tgz",
      "integrity": "sha1-gQaNKVqBQuwKxybG4iAMMPttXoA="
    },
    "for-own": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/for-own/-/for-own-1.0.0.tgz",
      "integrity": "sha1-xjMy9BXO3EsE2/5wz4NklMU8tEs=",
      "requires": {
        "for-in": "^1.0.1"
      }
    },
    "foreach": {
      "version": "2.0.5",
      "resolved": "https://registry.npmjs.org/foreach/-/foreach-2.0.5.tgz",
      "integrity": "sha1-C+4AUBiusmDQo6865ljdATbsG5k="
    },
    "forwarded": {
      "version": "0.2.0",
      "resolved": "https://registry.npmjs.org/forwarded/-/forwarded-0.2.0.tgz",
      "integrity": "sha512-buRG0fpBtRHSTCOASe6hD258tEubFoRLb4ZNA6NxMVHNw2gOcwHo9wyablzMzOA5z9xA9L1KNjk/Nt6MT9aYow=="
    },
    "fragment-cache": {
      "version": "0.2.1",
      "resolved": "https://registry.npmjs.org/fragment-cache/-/fragment-cache-0.2.1.tgz",
      "integrity": "sha1-QpD60n8T6Jvn8zeZxrxaCr//DRk=",
      "dev": true,
      "requires": {
        "map-cache": "^0.2.2"
      }
    },
    "fresh": {
      "version": "0.5.2",
      "resolved": "https://registry.npmjs.org/fresh/-/fresh-0.5.2.tgz",
      "integrity": "sha1-PYyt2Q2XZWn6g1qx+OSyOhBWBac="
    },
    "fs": {
      "version": "0.0.1-security",
      "resolved": "https://registry.npmjs.org/fs/-/fs-0.0.1-security.tgz",
      "integrity": "sha1-invTcYa23d84E/I4WLV+yq9eQdQ="
    },
    "fs.realpath": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz",
      "integrity": "sha1-FQStJSMVjKpA20onh8sBQRmU6k8="
    },
    "fsevents": {
      "version": "2.3.2",
      "resolved": "https://registry.npmjs.org/fsevents/-/fsevents-2.3.2.tgz",
      "integrity": "sha512-xiqMQR4xAeHTuB9uWm+fFRcIOgKBMiOBP+eXiyT7jsgVCq1bkVygt00oASowB7EdtpOHaaPgKt812P9ab+DDKA==",
      "optional": true
    },
    "function-bind": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz",
      "integrity": "sha512-yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A=="
    },
    "gaze": {
      "version": "1.1.3",
      "resolved": "https://registry.npmjs.org/gaze/-/gaze-1.1.3.tgz",
      "integrity": "sha512-BRdNm8hbWzFzWHERTrejLqwHDfS4GibPoq5wjTPIoJHoBtKGPg3xAFfxmM+9ztbXelxcf2hwQcaz1PtmFeue8g==",
      "dev": true,
      "requires": {
        "globule": "^1.0.0"
      }
    },
    "get-intrinsic": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.1.1.tgz",
      "integrity": "sha512-kWZrnVM42QCiEA2Ig1bG8zjoIMOgxWwYCEeNdwY6Tv/cOSeGpcoX4pXHfKUxNKVoArnrEr2e9srnAxxGIraS9Q==",
      "requires": {
        "function-bind": "^1.1.1",
        "has": "^1.0.3",
        "has-symbols": "^1.0.1"
      }
    },
    "get-stream": {
      "version": "4.1.0",
      "resolved": "https://registry.npmjs.org/get-stream/-/get-stream-4.1.0.tgz",
      "integrity": "sha512-GMat4EJ5161kIy2HevLlr4luNjBgvmj413KaQA7jt4V8B4RDsfpHk7WQ9GVqfYyyx8OS/L66Kox+rJRNklLK7w==",
      "requires": {
        "pump": "^3.0.0"
      }
    },
    "get-symbol-description": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/get-symbol-description/-/get-symbol-description-1.0.0.tgz",
      "integrity": "sha512-2EmdH1YvIQiZpltCNgkuiUnyukzxM/R6NDJX31Ke3BG1Nq5b0S2PhX59UKi9vZpPDQVdqn+1IcaAwnzTT5vCjw==",
      "requires": {
        "call-bind": "^1.0.2",
        "get-intrinsic": "^1.1.1"
      }
    },
    "get-value": {
      "version": "2.0.6",
      "resolved": "https://registry.npmjs.org/get-value/-/get-value-2.0.6.tgz",
      "integrity": "sha1-3BXKHGcjh8p2vTesCjlbogQqLCg=",
      "dev": true
    },
    "getobject": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/getobject/-/getobject-1.0.2.tgz",
      "integrity": "sha512-2zblDBaFcb3rB4rF77XVnuINOE2h2k/OnqXAiy0IrTxUfV1iFp3la33oAQVY9pCpWU268WFYVt2t71hlMuLsOg==",
      "dev": true
    },
    "glob": {
      "version": "7.1.7",
      "resolved": "https://registry.npmjs.org/glob/-/glob-7.1.7.tgz",
      "integrity": "sha512-OvD9ENzPLbegENnYP5UUfJIirTg4+XwMWGaQfQTY0JenxNvvIKP3U3/tAQSPIu/lHxXYSZmpXlUHeqAIdKzBLQ==",
      "requires": {
        "fs.realpath": "^1.0.0",
        "inflight": "^1.0.4",
        "inherits": "2",
        "minimatch": "^3.0.4",
        "once": "^1.3.0",
        "path-is-absolute": "^1.0.0"
      }
    },
    "glob-parent": {
      "version": "5.1.2",
      "resolved": "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz",
      "integrity": "sha512-AOIgSQCepiJYwP3ARnGx+5VnTu2HBYdzbGP45eLw1vr3zB3vZLeyed1sC9hnbcOc9/SrMyM5RPQrkGz4aS9Zow==",
      "requires": {
        "is-glob": "^4.0.1"
      }
    },
    "global-dirs": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/global-dirs/-/global-dirs-3.0.0.tgz",
      "integrity": "sha512-v8ho2DS5RiCjftj1nD9NmnfaOzTdud7RRnVd9kFNOjqZbISlx5DQ+OrTkywgd0dIt7oFCvKetZSHoHcP3sDdiA==",
      "requires": {
        "ini": "2.0.0"
      },
      "dependencies": {
        "ini": {
          "version": "2.0.0",
          "resolved": "https://registry.npmjs.org/ini/-/ini-2.0.0.tgz",
          "integrity": "sha512-7PnF4oN3CvZF23ADhA5wRaYEQpJ8qygSkbtTXWBeXWXmEVRXK+1ITciHWwHhsjv1TmW0MgacIv6hEi5pX5NQdA=="
        }
      }
    },
    "global-modules": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/global-modules/-/global-modules-1.0.0.tgz",
      "integrity": "sha512-sKzpEkf11GpOFuw0Zzjzmt4B4UZwjOcG757PPvrfhxcLFbq0wpsgpOqxpxtxFiCG4DtG93M6XRVbF2oGdev7bg==",
      "requires": {
        "global-prefix": "^1.0.1",
        "is-windows": "^1.0.1",
        "resolve-dir": "^1.0.0"
      }
    },
    "global-prefix": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/global-prefix/-/global-prefix-1.0.2.tgz",
      "integrity": "sha1-2/dDxsFJklk8ZVVoy2btMsASLr4=",
      "requires": {
        "expand-tilde": "^2.0.2",
        "homedir-polyfill": "^1.0.1",
        "ini": "^1.3.4",
        "is-windows": "^1.0.1",
        "which": "^1.2.14"
      }
    },
    "globby": {
      "version": "0.1.1",
      "resolved": "https://registry.npmjs.org/globby/-/globby-0.1.1.tgz",
      "integrity": "sha1-y+xj33JLS+pFi3mhbMDjsfLKhiA=",
      "dev": true,
      "requires": {
        "array-differ": "^0.1.0",
        "array-union": "^0.1.0",
        "async": "^0.9.0",
        "glob": "^4.0.2"
      },
      "dependencies": {
        "async": {
          "version": "0.9.2",
          "resolved": "https://registry.npmjs.org/async/-/async-0.9.2.tgz",
          "integrity": "sha1-rqdNXmHB+JlhO/ZL2mbUx48v0X0=",
          "dev": true
        },
        "glob": {
          "version": "4.5.3",
          "resolved": "https://registry.npmjs.org/glob/-/glob-4.5.3.tgz",
          "integrity": "sha1-xstz0yJsHv7wTePFbQEvAzd+4V8=",
          "dev": true,
          "requires": {
            "inflight": "^1.0.4",
            "inherits": "2",
            "minimatch": "^2.0.1",
            "once": "^1.3.0"
          }
        },
        "minimatch": {
          "version": "2.0.10",
          "resolved": "https://registry.npmjs.org/minimatch/-/minimatch-2.0.10.tgz",
          "integrity": "sha1-jQh8OcazjAAbl/ynzm0OHoCvusc=",
          "dev": true,
          "requires": {
            "brace-expansion": "^1.0.0"
          }
        }
      }
    },
    "globule": {
      "version": "1.3.3",
      "resolved": "https://registry.npmjs.org/globule/-/globule-1.3.3.tgz",
      "integrity": "sha512-mb1aYtDbIjTu4ShMB85m3UzjX9BVKe9WCzsnfMSZk+K5GpIbBOexgg4PPCt5eHDEG5/ZQAUX2Kct02zfiPLsKg==",
      "dev": true,
      "requires": {
        "glob": "~7.1.1",
        "lodash": "~4.17.10",
        "minimatch": "~3.0.2"
      }
    },
    "got": {
      "version": "9.6.0",
      "resolved": "https://registry.npmjs.org/got/-/got-9.6.0.tgz",
      "integrity": "sha512-R7eWptXuGYxwijs0eV+v3o6+XH1IqVK8dJOEecQfTmkncw9AV4dcw/Dhxi8MdlqPthxxpZyizMzyg8RTmEsG+Q==",
      "requires": {
        "@sindresorhus/is": "^0.14.0",
        "@szmarczak/http-timer": "^1.1.2",
        "cacheable-request": "^6.0.0",
        "decompress-response": "^3.3.0",
        "duplexer3": "^0.1.4",
        "get-stream": "^4.1.0",
        "lowercase-keys": "^1.0.1",
        "mimic-response": "^1.0.1",
        "p-cancelable": "^1.0.0",
        "to-readable-stream": "^1.0.0",
        "url-parse-lax": "^3.0.0"
      }
    },
    "graceful-fs": {
      "version": "4.2.8",
      "resolved": "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.8.tgz",
      "integrity": "sha512-qkIilPUYcNhJpd33n0GBXTB1MMPp14TxEsEs0pTrsSVucApsYzW5V+Q8Qxhik6KU3evy+qkAAowTByymK0avdg=="
    },
    "grunt": {
      "version": "1.4.1",
      "resolved": "https://registry.npmjs.org/grunt/-/grunt-1.4.1.tgz",
      "integrity": "sha512-ZXIYXTsAVrA7sM+jZxjQdrBOAg7DyMUplOMhTaspMRExei+fD0BTwdWXnn0W5SXqhb/Q/nlkzXclSi3IH55PIA==",
      "dev": true,
      "requires": {
        "dateformat": "~3.0.3",
        "eventemitter2": "~0.4.13",
        "exit": "~0.1.2",
        "findup-sync": "~0.3.0",
        "glob": "~7.1.6",
        "grunt-cli": "~1.4.2",
        "grunt-known-options": "~2.0.0",
        "grunt-legacy-log": "~3.0.0",
        "grunt-legacy-util": "~2.0.1",
        "iconv-lite": "~0.4.13",
        "js-yaml": "~3.14.0",
        "minimatch": "~3.0.4",
        "mkdirp": "~1.0.4",
        "nopt": "~3.0.6",
        "rimraf": "~3.0.2"
      }
    },
    "grunt-cli": {
      "version": "1.4.3",
      "resolved": "https://registry.npmjs.org/grunt-cli/-/grunt-cli-1.4.3.tgz",
      "integrity": "sha512-9Dtx/AhVeB4LYzsViCjUQkd0Kw0McN2gYpdmGYKtE2a5Yt7v1Q+HYZVWhqXc/kGnxlMtqKDxSwotiGeFmkrCoQ==",
      "requires": {
        "grunt-known-options": "~2.0.0",
        "interpret": "~1.1.0",
        "liftup": "~3.0.1",
        "nopt": "~4.0.1",
        "v8flags": "~3.2.0"
      },
      "dependencies": {
        "nopt": {
          "version": "4.0.3",
          "resolved": "https://registry.npmjs.org/nopt/-/nopt-4.0.3.tgz",
          "integrity": "sha512-CvaGwVMztSMJLOeXPrez7fyfObdZqNUK1cPAEzLHrTybIua9pMdmmPR5YwtfNftIOMv3DPUhFaxsZMNTQO20Kg==",
          "requires": {
            "abbrev": "1",
            "osenv": "^0.1.4"
          }
        }
      }
    },
    "grunt-contrib-connect": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/grunt-contrib-connect/-/grunt-contrib-connect-3.0.0.tgz",
      "integrity": "sha512-L1GXk6PqDP/meX0IOX1MByBvOph6h8Pvx4/iBIYD7dpokVCAAQPR/IIV1jkTONEM09xig/Y8/y3R9Fqc8U3HSA==",
      "dev": true,
      "requires": {
        "async": "^3.2.0",
        "connect": "^3.7.0",
        "connect-livereload": "^0.6.1",
        "morgan": "^1.10.0",
        "node-http2": "^4.0.1",
        "opn": "^6.0.0",
        "portscanner": "^2.2.0",
        "serve-index": "^1.9.1",
        "serve-static": "^1.14.1"
      },
      "dependencies": {
        "depd": {
          "version": "2.0.0",
          "resolved": "https://registry.npmjs.org/depd/-/depd-2.0.0.tgz",
          "integrity": "sha512-g7nH6P6dyDioJogAAGprGpCtVImJhpPk/roCzdb3fIh61/s/nPsfR6onyMwkCAR/OlC3yBC0lESvUoQEAssIrw==",
          "dev": true
        },
        "http-errors": {
          "version": "1.7.3",
          "resolved": "https://registry.npmjs.org/http-errors/-/http-errors-1.7.3.tgz",
          "integrity": "sha512-ZTTX0MWrsQ2ZAhA1cejAwDLycFsd7I7nVtnkT3Ol0aqodaKW+0CTZDQ1uBv5whptCnc8e8HeRRJxRs0kmm/Qfw==",
          "dev": true,
          "requires": {
            "depd": "~1.1.2",
            "inherits": "2.0.4",
            "setprototypeof": "1.1.1",
            "statuses": ">= 1.5.0 < 2",
            "toidentifier": "1.0.0"
          },
          "dependencies": {
            "depd": {
              "version": "1.1.2",
              "resolved": "https://registry.npmjs.org/depd/-/depd-1.1.2.tgz",
              "integrity": "sha1-m81S4UwJd2PnSbJ0xDRu0uVgtak=",
              "dev": true
            }
          }
        },
        "inherits": {
          "version": "2.0.4",
          "resolved": "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz",
          "integrity": "sha512-k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==",
          "dev": true
        },
        "mime": {
          "version": "1.6.0",
          "resolved": "https://registry.npmjs.org/mime/-/mime-1.6.0.tgz",
          "integrity": "sha512-x0Vn8spI+wuJ1O6S7gnbaQg8Pxh4NNHb7KSINmEWKiPE4RKOplvijn+NkmYmmRgP68mc70j2EbeTFRsrswaQeg==",
          "dev": true
        },
        "morgan": {
          "version": "1.10.0",
          "resolved": "https://registry.npmjs.org/morgan/-/morgan-1.10.0.tgz",
          "integrity": "sha512-AbegBVI4sh6El+1gNwvD5YIck7nSA36weD7xvIxG4in80j/UoK8AEGaWnnz8v1GxonMCltmlNs5ZKbGvl9b1XQ==",
          "dev": true,
          "requires": {
            "basic-auth": "~2.0.1",
            "debug": "2.6.9",
            "depd": "~2.0.0",
            "on-finished": "~2.3.0",
            "on-headers": "~1.0.2"
          }
        },
        "ms": {
          "version": "2.1.1",
          "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.1.tgz",
          "integrity": "sha512-tgp+dl5cGk28utYktBsrFqA7HKgrhgPsg6Z/EfhWI4gl1Hwq8B/GmY/0oXZ6nF8hDVesS/FpnYaD/kOWhYQvyg==",
          "dev": true
        },
        "send": {
          "version": "0.17.1",
          "resolved": "https://registry.npmjs.org/send/-/send-0.17.1.tgz",
          "integrity": "sha512-BsVKsiGcQMFwT8UxypobUKyv7irCNRHk1T0G680vk88yf6LBByGcZJOTJCrTP2xVN6yI+XjPJcNuE3V4fT9sAg==",
          "dev": true,
          "requires": {
            "debug": "2.6.9",
            "depd": "~1.1.2",
            "destroy": "~1.0.4",
            "encodeurl": "~1.0.2",
            "escape-html": "~1.0.3",
            "etag": "~1.8.1",
            "fresh": "0.5.2",
            "http-errors": "~1.7.2",
            "mime": "1.6.0",
            "ms": "2.1.1",
            "on-finished": "~2.3.0",
            "range-parser": "~1.2.1",
            "statuses": "~1.5.0"
          },
          "dependencies": {
            "depd": {
              "version": "1.1.2",
              "resolved": "https://registry.npmjs.org/depd/-/depd-1.1.2.tgz",
              "integrity": "sha1-m81S4UwJd2PnSbJ0xDRu0uVgtak=",
              "dev": true
            }
          }
        },
        "serve-static": {
          "version": "1.14.1",
          "resolved": "https://registry.npmjs.org/serve-static/-/serve-static-1.14.1.tgz",
          "integrity": "sha512-JMrvUwE54emCYWlTI+hGrGv5I8dEwmco/00EvkzIIsR7MqrHonbD9pO2MOfFnpFntl7ecpZs+3mW+XbQZu9QCg==",
          "dev": true,
          "requires": {
            "encodeurl": "~1.0.2",
            "escape-html": "~1.0.3",
            "parseurl": "~1.3.3",
            "send": "0.17.1"
          }
        },
        "setprototypeof": {
          "version": "1.1.1",
          "resolved": "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.1.1.tgz",
          "integrity": "sha512-JvdAWfbXeIGaZ9cILp38HntZSFSo3mWg6xGcJJsd+d4aRMOqauag1C63dJfDw7OaMYwEbHMOxEZ1lqVRYP2OAw==",
          "dev": true
        },
        "statuses": {
          "version": "1.5.0",
          "resolved": "https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz",
          "integrity": "sha1-Fhx9rBd2Wf2YEfQ3cfqZOBR4Yow=",
          "dev": true
        }
      }
    },
    "grunt-contrib-watch": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/grunt-contrib-watch/-/grunt-contrib-watch-1.1.0.tgz",
      "integrity": "sha512-yGweN+0DW5yM+oo58fRu/XIRrPcn3r4tQx+nL7eMRwjpvk+rQY6R8o94BPK0i2UhTg9FN21hS+m8vR8v9vXfeg==",
      "dev": true,
      "requires": {
        "async": "^2.6.0",
        "gaze": "^1.1.0",
        "lodash": "^4.17.10",
        "tiny-lr": "^1.1.1"
      },
      "dependencies": {
        "async": {
          "version": "2.6.3",
          "resolved": "https://registry.npmjs.org/async/-/async-2.6.3.tgz",
          "integrity": "sha512-zflvls11DCy+dQWzTW2dzuilv8Z5X/pjfmZOWba6TNIVDm+2UDaJmXSOXlasHKfNBs8oo3M0aT50fDEWfKZjXg==",
          "dev": true,
          "requires": {
            "lodash": "^4.17.14"
          }
        }
      }
    },
    "grunt-known-options": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/grunt-known-options/-/grunt-known-options-2.0.0.tgz",
      "integrity": "sha512-GD7cTz0I4SAede1/+pAbmJRG44zFLPipVtdL9o3vqx9IEyb7b4/Y3s7r6ofI3CchR5GvYJ+8buCSioDv5dQLiA=="
    },
    "grunt-legacy-log": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/grunt-legacy-log/-/grunt-legacy-log-3.0.0.tgz",
      "integrity": "sha512-GHZQzZmhyq0u3hr7aHW4qUH0xDzwp2YXldLPZTCjlOeGscAOWWPftZG3XioW8MasGp+OBRIu39LFx14SLjXRcA==",
      "dev": true,
      "requires": {
        "colors": "~1.1.2",
        "grunt-legacy-log-utils": "~2.1.0",
        "hooker": "~0.2.3",
        "lodash": "~4.17.19"
      }
    },
    "grunt-legacy-log-utils": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/grunt-legacy-log-utils/-/grunt-legacy-log-utils-2.1.0.tgz",
      "integrity": "sha512-lwquaPXJtKQk0rUM1IQAop5noEpwFqOXasVoedLeNzaibf/OPWjKYvvdqnEHNmU+0T0CaReAXIbGo747ZD+Aaw==",
      "dev": true,
      "requires": {
        "chalk": "~4.1.0",
        "lodash": "~4.17.19"
      }
    },
    "grunt-legacy-util": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/grunt-legacy-util/-/grunt-legacy-util-2.0.1.tgz",
      "integrity": "sha512-2bQiD4fzXqX8rhNdXkAywCadeqiPiay0oQny77wA2F3WF4grPJXCvAcyoWUJV+po/b15glGkxuSiQCK299UC2w==",
      "dev": true,
      "requires": {
        "async": "~3.2.0",
        "exit": "~0.1.2",
        "getobject": "~1.0.0",
        "hooker": "~0.2.3",
        "lodash": "~4.17.21",
        "underscore.string": "~3.3.5",
        "which": "~2.0.2"
      },
      "dependencies": {
        "which": {
          "version": "2.0.2",
          "resolved": "https://registry.npmjs.org/which/-/which-2.0.2.tgz",
          "integrity": "sha512-BLI3Tl1TW3Pvl70l3yq3Y64i+awpwXqsGBYWkkqMtnbXgrMD+yj7rhW0kuEDxzJaYXGjEW5ogapKNMEKNMjibA==",
          "dev": true,
          "requires": {
            "isexe": "^2.0.0"
          }
        }
      }
    },
    "grunt-nodemon": {
      "version": "0.4.2",
      "resolved": "https://registry.npmjs.org/grunt-nodemon/-/grunt-nodemon-0.4.2.tgz",
      "integrity": "sha1-rrwSq2bXtbOwVM3Yxfgi7BpCPvk=",
      "dev": true,
      "requires": {
        "nodemon": "^1.7.1"
      },
      "dependencies": {
        "ansi-align": {
          "version": "2.0.0",
          "resolved": "https://registry.npmjs.org/ansi-align/-/ansi-align-2.0.0.tgz",
          "integrity": "sha1-w2rsy6VjuJzrVW82kPCx2eNUf38=",
          "dev": true,
          "requires": {
            "string-width": "^2.0.0"
          }
        },
        "ansi-regex": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/ansi-regex/-/ansi-regex-3.0.0.tgz",
          "integrity": "sha1-7QMXwyIGT3lGbAKWa922Bas32Zg=",
          "dev": true
        },
        "ansi-styles": {
          "version": "3.2.1",
          "resolved": "https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz",
          "integrity": "sha512-VT0ZI6kZRdTh8YyJw3SMbYm/u+NqfsAxEpWO0Pf9sq8/e94WxxOpPKx9FR1FlyCtOVDNOQ+8ntlqFxiRc+r5qA==",
          "dev": true,
          "requires": {
            "color-convert": "^1.9.0"
          }
        },
        "anymatch": {
          "version": "2.0.0",
          "resolved": "https://registry.npmjs.org/anymatch/-/anymatch-2.0.0.tgz",
          "integrity": "sha512-5teOsQWABXHHBFP9y3skS5P3d/WfWXpv3FUpy+LorMrNYaT9pI4oLMQX7jzQ2KklNpGpWHzdCXTDT2Y3XGlZBw==",
          "dev": true,
          "requires": {
            "micromatch": "^3.1.4",
            "normalize-path": "^2.1.1"
          },
          "dependencies": {
            "normalize-path": {
              "version": "2.1.1",
              "resolved": "https://registry.npmjs.org/normalize-path/-/normalize-path-2.1.1.tgz",
              "integrity": "sha1-GrKLVW4Zg2Oowab35vogE3/mrtk=",
              "dev": true,
              "requires": {
                "remove-trailing-separator": "^1.0.1"
              }
            }
          }
        },
        "binary-extensions": {
          "version": "1.13.1",
          "resolved": "https://registry.npmjs.org/binary-extensions/-/binary-extensions-1.13.1.tgz",
          "integrity": "sha512-Un7MIEDdUC5gNpcGDV97op1Ywk748MpHcFTHoYs6qnj1Z3j7I53VG3nwZhKzoBZmbdRNnb6WRdFlwl7tSDuZGw==",
          "dev": true
        },
        "boxen": {
          "version": "1.3.0",
          "resolved": "https://registry.npmjs.org/boxen/-/boxen-1.3.0.tgz",
          "integrity": "sha512-TNPjfTr432qx7yOjQyaXm3dSR0MH9vXp7eT1BFSl/C51g+EFnOR9hTg1IreahGBmDNCehscshe45f+C1TBZbLw==",
          "dev": true,
          "requires": {
            "ansi-align": "^2.0.0",
            "camelcase": "^4.0.0",
            "chalk": "^2.0.1",
            "cli-boxes": "^1.0.0",
            "string-width": "^2.0.0",
            "term-size": "^1.2.0",
            "widest-line": "^2.0.0"
          }
        },
        "braces": {
          "version": "2.3.2",
          "resolved": "https://registry.npmjs.org/braces/-/braces-2.3.2.tgz",
          "integrity": "sha512-aNdbnj9P8PjdXU4ybaWLK2IF3jc/EoDYbC7AazW6to3TRsfXxscC9UXOB5iDiEQrkyIbWp2SLQda4+QAa7nc3w==",
          "dev": true,
          "requires": {
            "arr-flatten": "^1.1.0",
            "array-unique": "^0.3.2",
            "extend-shallow": "^2.0.1",
            "fill-range": "^4.0.0",
            "isobject": "^3.0.1",
            "repeat-element": "^1.1.2",
            "snapdragon": "^0.8.1",
            "snapdragon-node": "^2.0.1",
            "split-string": "^3.0.2",
            "to-regex": "^3.0.1"
          },
          "dependencies": {
            "extend-shallow": {
              "version": "2.0.1",
              "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
              "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
              "dev": true,
              "requires": {
                "is-extendable": "^0.1.0"
              }
            }
          }
        },
        "camelcase": {
          "version": "4.1.0",
          "resolved": "https://registry.npmjs.org/camelcase/-/camelcase-4.1.0.tgz",
          "integrity": "sha1-1UVjW+HjPFQmScaRc+Xeas+uNN0=",
          "dev": true
        },
        "chalk": {
          "version": "2.4.2",
          "resolved": "https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz",
          "integrity": "sha512-Mti+f9lpJNcwF4tWV8/OrTTtF1gZi+f8FqlyAdouralcFWFQWF2+NgCHShjkCb+IFBLq9buZwE1xckQU4peSuQ==",
          "dev": true,
          "requires": {
            "ansi-styles": "^3.2.1",
            "escape-string-regexp": "^1.0.5",
            "supports-color": "^5.3.0"
          }
        },
        "chokidar": {
          "version": "2.1.8",
          "resolved": "https://registry.npmjs.org/chokidar/-/chokidar-2.1.8.tgz",
          "integrity": "sha512-ZmZUazfOzf0Nve7duiCKD23PFSCs4JPoYyccjUFF3aQkQadqBhfzhjkwBH2mNOG9cTBwhamM37EIsIkZw3nRgg==",
          "dev": true,
          "requires": {
            "anymatch": "^2.0.0",
            "async-each": "^1.0.1",
            "braces": "^2.3.2",
            "fsevents": "^1.2.7",
            "glob-parent": "^3.1.0",
            "inherits": "^2.0.3",
            "is-binary-path": "^1.0.0",
            "is-glob": "^4.0.0",
            "normalize-path": "^3.0.0",
            "path-is-absolute": "^1.0.0",
            "readdirp": "^2.2.1",
            "upath": "^1.1.1"
          }
        },
        "ci-info": {
          "version": "1.6.0",
          "resolved": "https://registry.npmjs.org/ci-info/-/ci-info-1.6.0.tgz",
          "integrity": "sha512-vsGdkwSCDpWmP80ncATX7iea5DWQemg1UgCW5J8tqjU3lYw4FBYuj89J0CTVomA7BEfvSZd84GmHko+MxFQU2A==",
          "dev": true
        },
        "cli-boxes": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/cli-boxes/-/cli-boxes-1.0.0.tgz",
          "integrity": "sha1-T6kXw+WclKAEzWH47lCdplFocUM=",
          "dev": true
        },
        "color-convert": {
          "version": "1.9.3",
          "resolved": "https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz",
          "integrity": "sha512-QfAUtd+vFdAtFQcC8CCyYt1fYWxSqAiK2cSD6zDB8N3cpsEBAvRxp9zOGg6G/SHHJYAT88/az/IuDGALsNVbGg==",
          "dev": true,
          "requires": {
            "color-name": "1.1.3"
          }
        },
        "color-name": {
          "version": "1.1.3",
          "resolved": "https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz",
          "integrity": "sha1-p9BVi9icQveV3UIyj3QIMcpTvCU=",
          "dev": true
        },
        "configstore": {
          "version": "3.1.5",
          "resolved": "https://registry.npmjs.org/configstore/-/configstore-3.1.5.tgz",
          "integrity": "sha512-nlOhI4+fdzoK5xmJ+NY+1gZK56bwEaWZr8fYuXohZ9Vkc1o3a4T/R3M+yE/w7x/ZVJ1zF8c+oaOvF0dztdUgmA==",
          "dev": true,
          "requires": {
            "dot-prop": "^4.2.1",
            "graceful-fs": "^4.1.2",
            "make-dir": "^1.0.0",
            "unique-string": "^1.0.0",
            "write-file-atomic": "^2.0.0",
            "xdg-basedir": "^3.0.0"
          }
        },
        "crypto-random-string": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/crypto-random-string/-/crypto-random-string-1.0.0.tgz",
          "integrity": "sha1-ojD2T1aDEOFJgAmUB5DsmVRbyn4=",
          "dev": true
        },
        "debug": {
          "version": "3.2.7",
          "resolved": "https://registry.npmjs.org/debug/-/debug-3.2.7.tgz",
          "integrity": "sha512-CFjzYYAi4ThfiQvizrFQevTTXHtnCqWfe7x1AhgEscTz6ZbLbfoLRLPugTQyBth6f8ZERVUSyWHFD/7Wu4t1XQ==",
          "dev": true,
          "requires": {
            "ms": "^2.1.1"
          }
        },
        "dot-prop": {
          "version": "4.2.1",
          "resolved": "https://registry.npmjs.org/dot-prop/-/dot-prop-4.2.1.tgz",
          "integrity": "sha512-l0p4+mIuJIua0mhxGoh4a+iNL9bmeK5DvnSVQa6T0OhrVmaEa1XScX5Etc673FePCJOArq/4Pa2cLGODUWTPOQ==",
          "dev": true,
          "requires": {
            "is-obj": "^1.0.0"
          }
        },
        "fill-range": {
          "version": "4.0.0",
          "resolved": "https://registry.npmjs.org/fill-range/-/fill-range-4.0.0.tgz",
          "integrity": "sha1-1USBHUKPmOsGpj3EAtJAPDKMOPc=",
          "dev": true,
          "requires": {
            "extend-shallow": "^2.0.1",
            "is-number": "^3.0.0",
            "repeat-string": "^1.6.1",
            "to-regex-range": "^2.1.0"
          },
          "dependencies": {
            "extend-shallow": {
              "version": "2.0.1",
              "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
              "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
              "dev": true,
              "requires": {
                "is-extendable": "^0.1.0"
              }
            }
          }
        },
        "fsevents": {
          "version": "1.2.13",
          "resolved": "https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz",
          "integrity": "sha512-oWb1Z6mkHIskLzEJ/XWX0srkpkTQ7vaopMQkyaEIoq0fmtFVxOthb8cCxeT+p3ynTdkk/RZwbgG4brR5BeWECw==",
          "dev": true,
          "optional": true
        },
        "get-stream": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/get-stream/-/get-stream-3.0.0.tgz",
          "integrity": "sha1-jpQ9E1jcN1VQVOy+LtsFqhdO3hQ=",
          "dev": true
        },
        "glob-parent": {
          "version": "3.1.0",
          "resolved": "https://registry.npmjs.org/glob-parent/-/glob-parent-3.1.0.tgz",
          "integrity": "sha1-nmr2KZ2NO9K9QEMIMr0RPfkGxa4=",
          "dev": true,
          "requires": {
            "is-glob": "^3.1.0",
            "path-dirname": "^1.0.0"
          },
          "dependencies": {
            "is-glob": {
              "version": "3.1.0",
              "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-3.1.0.tgz",
              "integrity": "sha1-e6WuJCF4BKxwcHuWkiVnSGzD6Eo=",
              "dev": true,
              "requires": {
                "is-extglob": "^2.1.0"
              }
            }
          }
        },
        "global-dirs": {
          "version": "0.1.1",
          "resolved": "https://registry.npmjs.org/global-dirs/-/global-dirs-0.1.1.tgz",
          "integrity": "sha1-sxnA3UYH81PzvpzKTHL8FIxJ9EU=",
          "dev": true,
          "requires": {
            "ini": "^1.3.4"
          }
        },
        "got": {
          "version": "6.7.1",
          "resolved": "https://registry.npmjs.org/got/-/got-6.7.1.tgz",
          "integrity": "sha1-JAzQV4WpoY5WHcG0S0HHY+8ejbA=",
          "dev": true,
          "requires": {
            "create-error-class": "^3.0.0",
            "duplexer3": "^0.1.4",
            "get-stream": "^3.0.0",
            "is-redirect": "^1.0.0",
            "is-retry-allowed": "^1.0.0",
            "is-stream": "^1.0.0",
            "lowercase-keys": "^1.0.0",
            "safe-buffer": "^5.0.1",
            "timed-out": "^4.0.0",
            "unzip-response": "^2.0.1",
            "url-parse-lax": "^1.0.0"
          }
        },
        "has-flag": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz",
          "integrity": "sha1-tdRU3CGZriJWmfNGfloH87lVuv0=",
          "dev": true
        },
        "is-binary-path": {
          "version": "1.0.1",
          "resolved": "https://registry.npmjs.org/is-binary-path/-/is-binary-path-1.0.1.tgz",
          "integrity": "sha1-dfFmQrSA8YenEcgUFh/TpKdlWJg=",
          "dev": true,
          "requires": {
            "binary-extensions": "^1.0.0"
          }
        },
        "is-ci": {
          "version": "1.2.1",
          "resolved": "https://registry.npmjs.org/is-ci/-/is-ci-1.2.1.tgz",
          "integrity": "sha512-s6tfsaQaQi3JNciBH6shVqEDvhGut0SUXr31ag8Pd8BBbVVlcGfWhpPmEOoM6RJ5TFhbypvf5yyRw/VXW1IiWg==",
          "dev": true,
          "requires": {
            "ci-info": "^1.5.0"
          }
        },
        "is-fullwidth-code-point": {
          "version": "2.0.0",
          "resolved": "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz",
          "integrity": "sha1-o7MKXE8ZkYMWeqq5O+764937ZU8=",
          "dev": true
        },
        "is-installed-globally": {
          "version": "0.1.0",
          "resolved": "https://registry.npmjs.org/is-installed-globally/-/is-installed-globally-0.1.0.tgz",
          "integrity": "sha1-Df2Y9akRFxbdU13aZJL2e/PSWoA=",
          "dev": true,
          "requires": {
            "global-dirs": "^0.1.0",
            "is-path-inside": "^1.0.0"
          }
        },
        "is-npm": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-npm/-/is-npm-1.0.0.tgz",
          "integrity": "sha1-8vtjpl5JBbQGyGBydloaTceTufQ=",
          "dev": true
        },
        "is-number": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/is-number/-/is-number-3.0.0.tgz",
          "integrity": "sha1-JP1iAaR4LPUFYcgQJ2r8fRLXEZU=",
          "dev": true,
          "requires": {
            "kind-of": "^3.0.2"
          },
          "dependencies": {
            "kind-of": {
              "version": "3.2.2",
              "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
              "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
              "dev": true,
              "requires": {
                "is-buffer": "^1.1.5"
              }
            }
          }
        },
        "is-obj": {
          "version": "1.0.1",
          "resolved": "https://registry.npmjs.org/is-obj/-/is-obj-1.0.1.tgz",
          "integrity": "sha1-PkcprB9f3gJc19g6iW2rn09n2w8=",
          "dev": true
        },
        "is-path-inside": {
          "version": "1.0.1",
          "resolved": "https://registry.npmjs.org/is-path-inside/-/is-path-inside-1.0.1.tgz",
          "integrity": "sha1-jvW33lBDej/cprToZe96pVy0gDY=",
          "dev": true,
          "requires": {
            "path-is-inside": "^1.0.1"
          }
        },
        "latest-version": {
          "version": "3.1.0",
          "resolved": "https://registry.npmjs.org/latest-version/-/latest-version-3.1.0.tgz",
          "integrity": "sha1-ogU4P+oyKzO1rjsYq+4NwvNW7hU=",
          "dev": true,
          "requires": {
            "package-json": "^4.0.0"
          }
        },
        "make-dir": {
          "version": "1.3.0",
          "resolved": "https://registry.npmjs.org/make-dir/-/make-dir-1.3.0.tgz",
          "integrity": "sha512-2w31R7SJtieJJnQtGc7RVL2StM2vGYVfqUOvUDxH6bC6aJTxPxTF0GnIgCyu7tjockiUWAYQRbxa7vKn34s5sQ==",
          "dev": true,
          "requires": {
            "pify": "^3.0.0"
          }
        },
        "micromatch": {
          "version": "3.1.10",
          "resolved": "https://registry.npmjs.org/micromatch/-/micromatch-3.1.10.tgz",
          "integrity": "sha512-MWikgl9n9M3w+bpsY3He8L+w9eF9338xRl8IAO5viDizwSzziFEyUzo2xrrloB64ADbTf8uA8vRqqttDTOmccg==",
          "dev": true,
          "requires": {
            "arr-diff": "^4.0.0",
            "array-unique": "^0.3.2",
            "braces": "^2.3.1",
            "define-property": "^2.0.2",
            "extend-shallow": "^3.0.2",
            "extglob": "^2.0.4",
            "fragment-cache": "^0.2.1",
            "kind-of": "^6.0.2",
            "nanomatch": "^1.2.9",
            "object.pick": "^1.3.0",
            "regex-not": "^1.0.0",
            "snapdragon": "^0.8.1",
            "to-regex": "^3.0.2"
          }
        },
        "ms": {
          "version": "2.1.3",
          "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz",
          "integrity": "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==",
          "dev": true
        },
        "nodemon": {
          "version": "1.19.4",
          "resolved": "https://registry.npmjs.org/nodemon/-/nodemon-1.19.4.tgz",
          "integrity": "sha512-VGPaqQBNk193lrJFotBU8nvWZPqEZY2eIzymy2jjY0fJ9qIsxA0sxQ8ATPl0gZC645gijYEc1jtZvpS8QWzJGQ==",
          "dev": true,
          "requires": {
            "chokidar": "^2.1.8",
            "debug": "^3.2.6",
            "ignore-by-default": "^1.0.1",
            "minimatch": "^3.0.4",
            "pstree.remy": "^1.1.7",
            "semver": "^5.7.1",
            "supports-color": "^5.5.0",
            "touch": "^3.1.0",
            "undefsafe": "^2.0.2",
            "update-notifier": "^2.5.0"
          }
        },
        "package-json": {
          "version": "4.0.1",
          "resolved": "https://registry.npmjs.org/package-json/-/package-json-4.0.1.tgz",
          "integrity": "sha1-iGmgQBJTZhxMTKPabCEh7VVfXu0=",
          "dev": true,
          "requires": {
            "got": "^6.7.1",
            "registry-auth-token": "^3.0.1",
            "registry-url": "^3.0.3",
            "semver": "^5.1.0"
          }
        },
        "prepend-http": {
          "version": "1.0.4",
          "resolved": "https://registry.npmjs.org/prepend-http/-/prepend-http-1.0.4.tgz",
          "integrity": "sha1-1PRWKwzjaW5BrFLQ4ALlemNdxtw=",
          "dev": true
        },
        "readdirp": {
          "version": "2.2.1",
          "resolved": "https://registry.npmjs.org/readdirp/-/readdirp-2.2.1.tgz",
          "integrity": "sha512-1JU/8q+VgFZyxwrJ+SVIOsh+KywWGpds3NTqikiKpDMZWScmAYyKIgqkO+ARvNWJfXeXR1zxz7aHF4u4CyH6vQ==",
          "dev": true,
          "requires": {
            "graceful-fs": "^4.1.11",
            "micromatch": "^3.1.10",
            "readable-stream": "^2.0.2"
          }
        },
        "registry-auth-token": {
          "version": "3.4.0",
          "resolved": "https://registry.npmjs.org/registry-auth-token/-/registry-auth-token-3.4.0.tgz",
          "integrity": "sha512-4LM6Fw8eBQdwMYcES4yTnn2TqIasbXuwDx3um+QRs7S55aMKCBKBxvPXl2RiUjHwuJLTyYfxSpmfSAjQpcuP+A==",
          "dev": true,
          "requires": {
            "rc": "^1.1.6",
            "safe-buffer": "^5.0.1"
          }
        },
        "registry-url": {
          "version": "3.1.0",
          "resolved": "https://registry.npmjs.org/registry-url/-/registry-url-3.1.0.tgz",
          "integrity": "sha1-PU74cPc93h138M+aOBQyRE4XSUI=",
          "dev": true,
          "requires": {
            "rc": "^1.0.1"
          }
        },
        "semver-diff": {
          "version": "2.1.0",
          "resolved": "https://registry.npmjs.org/semver-diff/-/semver-diff-2.1.0.tgz",
          "integrity": "sha1-S7uEN8jTfksM8aaP1ybsbWRdbTY=",
          "dev": true,
          "requires": {
            "semver": "^5.0.3"
          }
        },
        "string-width": {
          "version": "2.1.1",
          "resolved": "https://registry.npmjs.org/string-width/-/string-width-2.1.1.tgz",
          "integrity": "sha512-nOqH59deCq9SRHlxq1Aw85Jnt4w6KvLKqWVik6oA9ZklXLNIOlqg4F2yrT1MVaTjAqvVwdfeZ7w7aCvJD7ugkw==",
          "dev": true,
          "requires": {
            "is-fullwidth-code-point": "^2.0.0",
            "strip-ansi": "^4.0.0"
          }
        },
        "strip-ansi": {
          "version": "4.0.0",
          "resolved": "https://registry.npmjs.org/strip-ansi/-/strip-ansi-4.0.0.tgz",
          "integrity": "sha1-qEeQIusaw2iocTibY1JixQXuNo8=",
          "dev": true,
          "requires": {
            "ansi-regex": "^3.0.0"
          }
        },
        "supports-color": {
          "version": "5.5.0",
          "resolved": "https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz",
          "integrity": "sha512-QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==",
          "dev": true,
          "requires": {
            "has-flag": "^3.0.0"
          }
        },
        "to-regex-range": {
          "version": "2.1.1",
          "resolved": "https://registry.npmjs.org/to-regex-range/-/to-regex-range-2.1.1.tgz",
          "integrity": "sha1-fIDBe53+vlmeJzZ+DU3VWQFB2zg=",
          "dev": true,
          "requires": {
            "is-number": "^3.0.0",
            "repeat-string": "^1.6.1"
          }
        },
        "unique-string": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/unique-string/-/unique-string-1.0.0.tgz",
          "integrity": "sha1-nhBXzKhRq7kzmPizOuGHuZyuwRo=",
          "dev": true,
          "requires": {
            "crypto-random-string": "^1.0.0"
          }
        },
        "update-notifier": {
          "version": "2.5.0",
          "resolved": "https://registry.npmjs.org/update-notifier/-/update-notifier-2.5.0.tgz",
          "integrity": "sha512-gwMdhgJHGuj/+wHJJs9e6PcCszpxR1b236igrOkUofGhqJuG+amlIKwApH1IW1WWl7ovZxsX49lMBWLxSdm5Dw==",
          "dev": true,
          "requires": {
            "boxen": "^1.2.1",
            "chalk": "^2.0.1",
            "configstore": "^3.0.0",
            "import-lazy": "^2.1.0",
            "is-ci": "^1.0.10",
            "is-installed-globally": "^0.1.0",
            "is-npm": "^1.0.0",
            "latest-version": "^3.0.0",
            "semver-diff": "^2.0.0",
            "xdg-basedir": "^3.0.0"
          }
        },
        "url-parse-lax": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/url-parse-lax/-/url-parse-lax-1.0.0.tgz",
          "integrity": "sha1-evjzA2Rem9eaJy56FKxovAYJ2nM=",
          "dev": true,
          "requires": {
            "prepend-http": "^1.0.1"
          }
        },
        "widest-line": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/widest-line/-/widest-line-2.0.1.tgz",
          "integrity": "sha512-Ba5m9/Fa4Xt9eb2ELXt77JxVDV8w7qQrH0zS/TWSJdLyAwQjWoOzpzj5lwVftDz6n/EOu3tNACS84v509qwnJA==",
          "dev": true,
          "requires": {
            "string-width": "^2.1.1"
          }
        },
        "write-file-atomic": {
          "version": "2.4.3",
          "resolved": "https://registry.npmjs.org/write-file-atomic/-/write-file-atomic-2.4.3.tgz",
          "integrity": "sha512-GaETH5wwsX+GcnzhPgKcKjJ6M2Cq3/iZp1WyY/X1CSqrW+jVNM9Y7D8EC2sM4ZG/V8wZlSniJnCKWPmBYAucRQ==",
          "dev": true,
          "requires": {
            "graceful-fs": "^4.1.11",
            "imurmurhash": "^0.1.4",
            "signal-exit": "^3.0.2"
          }
        },
        "xdg-basedir": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/xdg-basedir/-/xdg-basedir-3.0.0.tgz",
          "integrity": "sha1-SWsswQnsqNus/i3HK2A8F8WHCtQ=",
          "dev": true
        }
      }
    },
    "grunt-prettify": {
      "version": "0.4.0",
      "resolved": "https://registry.npmjs.org/grunt-prettify/-/grunt-prettify-0.4.0.tgz",
      "integrity": "sha1-/IU9tCRdSQirbjWvtSdyE+3cGUs=",
      "dev": true,
      "requires": {
        "async": "~0.9.0",
        "globby": "^0.1.1",
        "js-beautify": "~1.5.4",
        "lodash": "~2.4.1",
        "underscore.string": "~2.3.3"
      },
      "dependencies": {
        "async": {
          "version": "0.9.2",
          "resolved": "https://registry.npmjs.org/async/-/async-0.9.2.tgz",
          "integrity": "sha1-rqdNXmHB+JlhO/ZL2mbUx48v0X0=",
          "dev": true
        },
        "lodash": {
          "version": "2.4.2",
          "resolved": "https://registry.npmjs.org/lodash/-/lodash-2.4.2.tgz",
          "integrity": "sha1-+t2DS5aDBz2hebPq5tnA0VBT9z4=",
          "dev": true
        },
        "underscore.string": {
          "version": "2.3.3",
          "resolved": "https://registry.npmjs.org/underscore.string/-/underscore.string-2.3.3.tgz",
          "integrity": "sha1-ccCL9rQosRM/N+ePo6Icgvcymw0=",
          "dev": true
        }
      }
    },
    "has": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/has/-/has-1.0.3.tgz",
      "integrity": "sha512-f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==",
      "requires": {
        "function-bind": "^1.1.1"
      }
    },
    "has-bigints": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/has-bigints/-/has-bigints-1.0.1.tgz",
      "integrity": "sha512-LSBS2LjbNBTf6287JEbEzvJgftkF5qFkmCo9hDRpAzKhUOlJ+hx8dd4USs00SgsUNwc4617J9ki5YtEClM2ffA=="
    },
    "has-flag": {
      "version": "4.0.0",
      "resolved": "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz",
      "integrity": "sha512-EykJT/Q1KjTWctppgIAgfSO0tKVuZUjhgMr17kqTumMl6Afv3EISleU7qZUzoXDFTAHTDC4NOoG/ZxU3EvlMPQ=="
    },
    "has-symbols": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/has-symbols/-/has-symbols-1.0.2.tgz",
      "integrity": "sha512-chXa79rL/UC2KlX17jo3vRGz0azaWEx5tGqZg5pO3NUyEJVB17dMruQlzCCOfUvElghKcm5194+BCRvi2Rv/Gw=="
    },
    "has-tostringtag": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.0.tgz",
      "integrity": "sha512-kFjcSNhnlGV1kyoGk7OXKSawH5JOb/LzUc5w9B02hOTO0dfFRjbHQKvg1d6cf3HbeUmtU9VbbV3qzZ2Teh97WQ==",
      "requires": {
        "has-symbols": "^1.0.2"
      }
    },
    "has-value": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/has-value/-/has-value-1.0.0.tgz",
      "integrity": "sha1-GLKB2lhbHFxR3vJMkw7SmgvmsXc=",
      "dev": true,
      "requires": {
        "get-value": "^2.0.6",
        "has-values": "^1.0.0",
        "isobject": "^3.0.0"
      }
    },
    "has-values": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/has-values/-/has-values-1.0.0.tgz",
      "integrity": "sha1-lbC2P+whRmGab+V/51Yo1aOe/k8=",
      "dev": true,
      "requires": {
        "is-number": "^3.0.0",
        "kind-of": "^4.0.0"
      },
      "dependencies": {
        "is-number": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/is-number/-/is-number-3.0.0.tgz",
          "integrity": "sha1-JP1iAaR4LPUFYcgQJ2r8fRLXEZU=",
          "dev": true,
          "requires": {
            "kind-of": "^3.0.2"
          },
          "dependencies": {
            "kind-of": {
              "version": "3.2.2",
              "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
              "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
              "dev": true,
              "requires": {
                "is-buffer": "^1.1.5"
              }
            }
          }
        },
        "kind-of": {
          "version": "4.0.0",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-4.0.0.tgz",
          "integrity": "sha1-IIE989cSkosgc3hpGkUGb65y3Vc=",
          "dev": true,
          "requires": {
            "is-buffer": "^1.1.5"
          }
        }
      }
    },
    "has-yarn": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/has-yarn/-/has-yarn-2.1.0.tgz",
      "integrity": "sha512-UqBRqi4ju7T+TqGNdqAO0PaSVGsDGJUBQvk9eUWNGRY1CFGDzYhLWoM7JQEemnlvVcv/YEmc2wNW8BC24EnUsw=="
    },
    "highlight.js": {
      "version": "11.2.0",
      "resolved": "https://registry.npmjs.org/highlight.js/-/highlight.js-11.2.0.tgz",
      "integrity": "sha512-JOySjtOEcyG8s4MLR2MNbLUyaXqUunmSnL2kdV/KuGJOmHZuAR5xC54Ko7goAXBWNhf09Vy3B+U7vR62UZ/0iw=="
    },
    "homedir-polyfill": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/homedir-polyfill/-/homedir-polyfill-1.0.3.tgz",
      "integrity": "sha512-eSmmWE5bZTK2Nou4g0AI3zZ9rswp7GRKoKXS1BLUkvPviOqs4YTN1djQIqrXy9k5gEtdLPy86JjRwsNM9tnDcA==",
      "requires": {
        "parse-passwd": "^1.0.0"
      }
    },
    "hooker": {
      "version": "0.2.3",
      "resolved": "https://registry.npmjs.org/hooker/-/hooker-0.2.3.tgz",
      "integrity": "sha1-uDT3I8xKJCqmWWNFnfbZhMXT2Vk=",
      "dev": true
    },
    "html": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/html/-/html-1.0.0.tgz",
      "integrity": "sha1-pUT6nqVJK/s6LMqCEKEL57WvH2E=",
      "requires": {
        "concat-stream": "^1.4.7"
      }
    },
    "html-prettier": {
      "version": "0.0.5",
      "resolved": "https://registry.npmjs.org/html-prettier/-/html-prettier-0.0.5.tgz",
      "integrity": "sha512-lxPjiKYbdfbgrsPX1XugBJ5t1emE/6BicNtnOksac210vcxL29R7E0Wm1VBp0TN/gtqqXd+347ulOlSoN6TuOw==",
      "requires": {
        "file-system": "^2.2.2",
        "htmldom": "^3.0.5"
      }
    },
    "htmldom": {
      "version": "3.0.9",
      "resolved": "https://registry.npmjs.org/htmldom/-/htmldom-3.0.9.tgz",
      "integrity": "sha512-3giRmBYY0DKOUh/Jdcua7II8beLi/PBwh1cyYqSs3+d2iL+yvD2tnbywSAQlvhtaHN99vA+bZvlvUIKIi0caFQ==",
      "requires": {
        "cssdom": "^1.0.17",
        "js-beautify": "^1.5.5",
        "uglify-js": "^2.4.20",
        "utils-extend": "^1.0.8"
      }
    },
    "htmlparser2": {
      "version": "7.1.2",
      "resolved": "https://registry.npmjs.org/htmlparser2/-/htmlparser2-7.1.2.tgz",
      "integrity": "sha512-d6cqsbJba2nRdg8WW2okyD4ceonFHn9jLFxhwlNcLhQWcFPdxXeJulgOLjLKtAK9T6ahd+GQNZwG9fjmGW7lyg==",
      "dev": true,
      "requires": {
        "domelementtype": "^2.0.1",
        "domhandler": "^4.2.2",
        "domutils": "^2.8.0",
        "entities": "^3.0.1"
      }
    },
    "http-cache-semantics": {
      "version": "4.1.0",
      "resolved": "https://registry.npmjs.org/http-cache-semantics/-/http-cache-semantics-4.1.0.tgz",
      "integrity": "sha512-carPklcUh7ROWRK7Cv27RPtdhYhUsela/ue5/jKzjegVvXDqM2ILE9Q2BGn9JZJh1g87cp56su/FgQSzcWS8cQ=="
    },
    "http-errors": {
      "version": "1.6.3",
      "resolved": "https://registry.npmjs.org/http-errors/-/http-errors-1.6.3.tgz",
      "integrity": "sha1-i1VoC7S+KDoLW/TqLjhYC+HZMg0=",
      "requires": {
        "depd": "~1.1.2",
        "inherits": "2.0.3",
        "setprototypeof": "1.1.0",
        "statuses": ">= 1.4.0 < 2"
      }
    },
    "http-parser-js": {
      "version": "0.5.3",
      "resolved": "https://registry.npmjs.org/http-parser-js/-/http-parser-js-0.5.3.tgz",
      "integrity": "sha512-t7hjvef/5HEK7RWTdUzVUhl8zkEu+LlaE0IYzdMuvbSDipxBRpOn4Uhw8ZyECEa808iVT8XCjzo6xmYt4CiLZg==",
      "dev": true
    },
    "https-browserify": {
      "version": "0.0.1",
      "resolved": "https://registry.npmjs.org/https-browserify/-/https-browserify-0.0.1.tgz",
      "integrity": "sha1-P5E2XKvmC3ftDruiS0VOPgnZWoI=",
      "dev": true
    },
    "iconv-lite": {
      "version": "0.4.23",
      "resolved": "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.23.tgz",
      "integrity": "sha512-neyTUVFtahjf0mB3dZT77u+8O0QB89jFdnBkd5P1JgYPbPaia3gXXOVL2fq8VyU2gMMD7SaN7QukTB/pmXYvDA==",
      "requires": {
        "safer-buffer": ">= 2.1.2 < 3"
      }
    },
    "ieee754": {
      "version": "1.2.1",
      "resolved": "https://registry.npmjs.org/ieee754/-/ieee754-1.2.1.tgz",
      "integrity": "sha512-dcyqhDvX1C46lXZcVqCpK+FtMRQVdIMN6/Df5js2zouUsqG7I6sFxitIC+7KYK29KdXOLHdu9zL4sFnoVQnqaA=="
    },
    "ignore-by-default": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/ignore-by-default/-/ignore-by-default-1.0.1.tgz",
      "integrity": "sha1-SMptcvbGo68Aqa1K5odr44ieKwk="
    },
    "import-lazy": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/import-lazy/-/import-lazy-2.1.0.tgz",
      "integrity": "sha1-BWmOPUXIjo1+nZLLBYTnfwlvPkM="
    },
    "imurmurhash": {
      "version": "0.1.4",
      "resolved": "https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz",
      "integrity": "sha1-khi5srkoojixPcT7a21XbyMUU+o="
    },
    "indent.js": {
      "version": "0.3.5",
      "resolved": "https://registry.npmjs.org/indent.js/-/indent.js-0.3.5.tgz",
      "integrity": "sha512-wiTA5fEz0kc8tHzY6CSujl/k62WVNvTxAZzmPe5V7MYxRCeGGibPCIYWYBzPp/bcJh3CXUO/8qrTrO/x9s1i2Q=="
    },
    "inflight": {
      "version": "1.0.6",
      "resolved": "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz",
      "integrity": "sha1-Sb1jMdfQLQwJvJEKEHW6gWW1bfk=",
      "requires": {
        "once": "^1.3.0",
        "wrappy": "1"
      }
    },
    "inherits": {
      "version": "2.0.3",
      "resolved": "https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz",
      "integrity": "sha1-Yzwsg+PaQqUC9SRmAiSA9CCCYd4="
    },
    "ini": {
      "version": "1.3.8",
      "resolved": "https://registry.npmjs.org/ini/-/ini-1.3.8.tgz",
      "integrity": "sha512-JV/yugV2uzW5iMRSiZAyDtQd+nxtUnjeLt0acNdw98kKLrvuRVyB80tsREOE7yvGVgalhZ6RNXCmEHkUKBKxew=="
    },
    "internal-slot": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/internal-slot/-/internal-slot-1.0.3.tgz",
      "integrity": "sha512-O0DB1JC/sPyZl7cIo78n5dR7eUSwwpYPiXRhTzNxZVAMUuB8vlnRFyLxdrVToks6XPLVnFfbzaVd5WLjhgg+vA==",
      "requires": {
        "get-intrinsic": "^1.1.0",
        "has": "^1.0.3",
        "side-channel": "^1.0.4"
      }
    },
    "interpret": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/interpret/-/interpret-1.1.0.tgz",
      "integrity": "sha1-ftGxQQxqDg94z5XTuEQMY/eLhhQ="
    },
    "ipaddr.js": {
      "version": "1.9.1",
      "resolved": "https://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.9.1.tgz",
      "integrity": "sha512-0KI/607xoxSToH7GjN1FfSbLoU0+btTicjsQSWQlh/hZykN8KpmMf7uYwPW3R+akZ6R/w18ZlXSHBYXiYUPO3g=="
    },
    "is-absolute": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/is-absolute/-/is-absolute-1.0.0.tgz",
      "integrity": "sha512-dOWoqflvcydARa360Gvv18DZ/gRuHKi2NU/wU5X1ZFzdYfH29nkiNZsF3mp4OJ3H4yo9Mx8A/uAGNzpzPN3yBA==",
      "requires": {
        "is-relative": "^1.0.0",
        "is-windows": "^1.0.1"
      }
    },
    "is-accessor-descriptor": {
      "version": "0.1.6",
      "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz",
      "integrity": "sha1-qeEss66Nh2cn7u84Q/igiXtcmNY=",
      "dev": true,
      "requires": {
        "kind-of": "^3.0.2"
      },
      "dependencies": {
        "kind-of": {
          "version": "3.2.2",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
          "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
          "dev": true,
          "requires": {
            "is-buffer": "^1.1.5"
          }
        }
      }
    },
    "is-arguments": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/is-arguments/-/is-arguments-1.1.1.tgz",
      "integrity": "sha512-8Q7EARjzEnKpt/PCD7e1cgUS0a6X8u5tdSiMqXhojOdoV9TsMsiO+9VLC5vAmO8N7/GmXn7yjR8qnA6bVAEzfA==",
      "requires": {
        "call-bind": "^1.0.2",
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-bigint": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/is-bigint/-/is-bigint-1.0.4.tgz",
      "integrity": "sha512-zB9CruMamjym81i2JZ3UMn54PKGsQzsJeo6xvN3HJJ4CAsQNB6iRutp2To77OfCNuoxspsIhzaPoO1zyCEhFOg==",
      "requires": {
        "has-bigints": "^1.0.1"
      }
    },
    "is-binary-path": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz",
      "integrity": "sha512-ZMERYes6pDydyuGidse7OsHxtbI7WVeUEozgR/g7rd0xUimYNlvZRE/K2MgZTjWy725IfelLeVcEM97mmtRGXw==",
      "requires": {
        "binary-extensions": "^2.0.0"
      }
    },
    "is-boolean-object": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/is-boolean-object/-/is-boolean-object-1.1.2.tgz",
      "integrity": "sha512-gDYaKHJmnj4aWxyj6YHyXVpdQawtVLHU5cb+eztPGczf6cjuTdwve5ZIEfgXqH4e57An1D1AKf8CZ3kYrQRqYA==",
      "requires": {
        "call-bind": "^1.0.2",
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-buffer": {
      "version": "1.1.6",
      "resolved": "https://registry.npmjs.org/is-buffer/-/is-buffer-1.1.6.tgz",
      "integrity": "sha512-NcdALwpXkTm5Zvvbk7owOUSvVvBKDgKP5/ewfXEznmQFfs4ZRmanOeKBTjRVjka3QFoN6XJ+9F3USqfHqTaU5w=="
    },
    "is-callable": {
      "version": "1.2.4",
      "resolved": "https://registry.npmjs.org/is-callable/-/is-callable-1.2.4.tgz",
      "integrity": "sha512-nsuwtxZfMX67Oryl9LCQ+upnC0Z0BgpwntpS89m1H/TLF0zNfzfLMV/9Wa/6MZsj0acpEjAO0KF1xT6ZdLl95w=="
    },
    "is-ci": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/is-ci/-/is-ci-2.0.0.tgz",
      "integrity": "sha512-YfJT7rkpQB0updsdHLGWrvhBJfcfzNNawYDNIyQXJz0IViGf75O8EBPKSdvw2rF+LGCsX4FZ8tcr3b19LcZq4w==",
      "requires": {
        "ci-info": "^2.0.0"
      }
    },
    "is-core-module": {
      "version": "2.6.0",
      "resolved": "https://registry.npmjs.org/is-core-module/-/is-core-module-2.6.0.tgz",
      "integrity": "sha512-wShG8vs60jKfPWpF2KZRaAtvt3a20OAn7+IJ6hLPECpSABLcKtFKTTI4ZtH5QcBruBHlq+WsdHWyz0BCZW7svQ==",
      "requires": {
        "has": "^1.0.3"
      }
    },
    "is-data-descriptor": {
      "version": "0.1.4",
      "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz",
      "integrity": "sha1-C17mSDiOLIYCgueT8YVv7D8wG1Y=",
      "dev": true,
      "requires": {
        "kind-of": "^3.0.2"
      },
      "dependencies": {
        "kind-of": {
          "version": "3.2.2",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
          "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
          "dev": true,
          "requires": {
            "is-buffer": "^1.1.5"
          }
        }
      }
    },
    "is-date-object": {
      "version": "1.0.5",
      "resolved": "https://registry.npmjs.org/is-date-object/-/is-date-object-1.0.5.tgz",
      "integrity": "sha512-9YQaSxsAiSwcvS33MBk3wTCVnWK+HhF8VZR2jRxehM16QcVOdHqPn4VPHmRK4lSr38n9JriurInLcP90xsYNfQ==",
      "requires": {
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-descriptor": {
      "version": "0.1.6",
      "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-0.1.6.tgz",
      "integrity": "sha512-avDYr0SB3DwO9zsMov0gKCESFYqCnE4hq/4z3TdUlukEy5t9C0YRq7HLrsN52NAcqXKaepeCD0n+B0arnVG3Hg==",
      "dev": true,
      "requires": {
        "is-accessor-descriptor": "^0.1.6",
        "is-data-descriptor": "^0.1.4",
        "kind-of": "^5.0.0"
      },
      "dependencies": {
        "kind-of": {
          "version": "5.1.0",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-5.1.0.tgz",
          "integrity": "sha512-NGEErnH6F2vUuXDh+OlbcKW7/wOcfdRHaZ7VWtqCztfHri/++YKmP51OdWeGPuqCOba6kk2OTe5d02VmTB80Pw==",
          "dev": true
        }
      }
    },
    "is-extendable": {
      "version": "0.1.1",
      "resolved": "https://registry.npmjs.org/is-extendable/-/is-extendable-0.1.1.tgz",
      "integrity": "sha1-YrEQ4omkcUGOPsNqYX1HLjAd/Ik=",
      "dev": true
    },
    "is-extglob": {
      "version": "2.1.1",
      "resolved": "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz",
      "integrity": "sha1-qIwCU1eR8C7TfHahueqXc8gz+MI="
    },
    "is-fullwidth-code-point": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz",
      "integrity": "sha512-zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg=="
    },
    "is-generator-function": {
      "version": "1.0.10",
      "resolved": "https://registry.npmjs.org/is-generator-function/-/is-generator-function-1.0.10.tgz",
      "integrity": "sha512-jsEjy9l3yiXEQ+PsXdmBwEPcOxaXWLspKdplFUVI9vq1iZgIekeC0L167qeu86czQaxed3q/Uzuw0swL0irL8A==",
      "requires": {
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-glob": {
      "version": "4.0.1",
      "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-4.0.1.tgz",
      "integrity": "sha512-5G0tKtBTFImOqDnLB2hG6Bp2qcKEFduo4tZu9MT/H6NQv/ghhy30o55ufafxJ/LdH79LLs2Kfrn85TLKyA7BUg==",
      "requires": {
        "is-extglob": "^2.1.1"
      }
    },
    "is-installed-globally": {
      "version": "0.4.0",
      "resolved": "https://registry.npmjs.org/is-installed-globally/-/is-installed-globally-0.4.0.tgz",
      "integrity": "sha512-iwGqO3J21aaSkC7jWnHP/difazwS7SFeIqxv6wEtLU8Y5KlzFTjyqcSIT0d8s4+dDhKytsk9PJZ2BkS5eZwQRQ==",
      "requires": {
        "global-dirs": "^3.0.0",
        "is-path-inside": "^3.0.2"
      }
    },
    "is-json": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/is-json/-/is-json-2.0.1.tgz",
      "integrity": "sha1-a+Fm0USCihMdaGiRuYPfYsOUkf8=",
      "dev": true
    },
    "is-negative-zero": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/is-negative-zero/-/is-negative-zero-2.0.1.tgz",
      "integrity": "sha512-2z6JzQvZRa9A2Y7xC6dQQm4FSTSTNWjKIYYTt4246eMTJmIo0Q+ZyOsU66X8lxK1AbB92dFeglPLrhwpeRKO6w=="
    },
    "is-npm": {
      "version": "5.0.0",
      "resolved": "https://registry.npmjs.org/is-npm/-/is-npm-5.0.0.tgz",
      "integrity": "sha512-WW/rQLOazUq+ST/bCAVBp/2oMERWLsR7OrKyt052dNDk4DHcDE0/7QSXITlmi+VBcV13DfIbysG3tZJm5RfdBA=="
    },
    "is-number": {
      "version": "7.0.0",
      "resolved": "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz",
      "integrity": "sha512-41Cifkg6e8TylSpdtTpeLVMqvSBEVzTttHvERD741+pnZ8ANv0004MRL43QKPDlK9cGvNp6NZWZUBlbGXYxxng=="
    },
    "is-number-like": {
      "version": "1.0.8",
      "resolved": "https://registry.npmjs.org/is-number-like/-/is-number-like-1.0.8.tgz",
      "integrity": "sha512-6rZi3ezCyFcn5L71ywzz2bS5b2Igl1En3eTlZlvKjpz1n3IZLAYMbKYAIQgFmEu0GENg92ziU/faEOA/aixjbA==",
      "dev": true,
      "requires": {
        "lodash.isfinite": "^3.3.2"
      }
    },
    "is-number-object": {
      "version": "1.0.6",
      "resolved": "https://registry.npmjs.org/is-number-object/-/is-number-object-1.0.6.tgz",
      "integrity": "sha512-bEVOqiRcvo3zO1+G2lVMy+gkkEm9Yh7cDMRusKKu5ZJKPUYSJwICTKZrNKHA2EbSP0Tu0+6B/emsYNHZyn6K8g==",
      "requires": {
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-obj": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/is-obj/-/is-obj-2.0.0.tgz",
      "integrity": "sha512-drqDG3cbczxxEJRoOXcOjtdp1J/lyp1mNn0xaznRs8+muBhgQcrnbspox5X5fOw0HnMnbfDzvnEMEtqDEJEo8w=="
    },
    "is-path-inside": {
      "version": "3.0.3",
      "resolved": "https://registry.npmjs.org/is-path-inside/-/is-path-inside-3.0.3.tgz",
      "integrity": "sha512-Fd4gABb+ycGAmKou8eMftCupSir5lRxqf4aD/vd0cD2qc4HL07OjCeuHMr8Ro4CoMaeCKDB0/ECBOVWjTwUvPQ=="
    },
    "is-plain-object": {
      "version": "2.0.4",
      "resolved": "https://registry.npmjs.org/is-plain-object/-/is-plain-object-2.0.4.tgz",
      "integrity": "sha512-h5PpgXkWitc38BBMYawTYMWJHFZJVnBquFE57xFpjB8pJFiF6gZ+bU+WyI/yqXiFR5mdLsgYNaPe8uao6Uv9Og==",
      "requires": {
        "isobject": "^3.0.1"
      }
    },
    "is-redirect": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/is-redirect/-/is-redirect-1.0.0.tgz",
      "integrity": "sha1-HQPd7VO9jbDzDCbk+V02/HyH3CQ=",
      "dev": true
    },
    "is-regex": {
      "version": "1.1.4",
      "resolved": "https://registry.npmjs.org/is-regex/-/is-regex-1.1.4.tgz",
      "integrity": "sha512-kvRdxDsxZjhzUX07ZnLydzS1TU/TJlTUHHY4YLL87e37oUA49DfkLqgy+VjFocowy29cKvcSiu+kIv728jTTVg==",
      "requires": {
        "call-bind": "^1.0.2",
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-relative": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/is-relative/-/is-relative-1.0.0.tgz",
      "integrity": "sha512-Kw/ReK0iqwKeu0MITLFuj0jbPAmEiOsIwyIXvvbfa6QfmN9pkD1M+8pdk7Rl/dTKbH34/XBFMbgD4iMJhLQbGA==",
      "requires": {
        "is-unc-path": "^1.0.0"
      }
    },
    "is-retry-allowed": {
      "version": "1.2.0",
      "resolved": "https://registry.npmjs.org/is-retry-allowed/-/is-retry-allowed-1.2.0.tgz",
      "integrity": "sha512-RUbUeKwvm3XG2VYamhJL1xFktgjvPzL0Hq8C+6yrWIswDy3BIXGqCxhxkc30N9jqK311gVU137K8Ei55/zVJRg==",
      "dev": true
    },
    "is-stream": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/is-stream/-/is-stream-1.1.0.tgz",
      "integrity": "sha1-EtSj3U5o4Lec6428hBc66A2RykQ=",
      "dev": true
    },
    "is-string": {
      "version": "1.0.7",
      "resolved": "https://registry.npmjs.org/is-string/-/is-string-1.0.7.tgz",
      "integrity": "sha512-tE2UXzivje6ofPW7l23cjDOMa09gb7xlAqG6jG5ej6uPV32TlWP3NKPigtaGeHNu9fohccRYvIiZMfOOnOYUtg==",
      "requires": {
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-symbol": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/is-symbol/-/is-symbol-1.0.4.tgz",
      "integrity": "sha512-C/CPBqKWnvdcxqIARxyOh4v1UUEOCHpgDa0WYgpKDFMszcrPcffg5uhwSgPCLD2WWxmq6isisz87tzT01tuGhg==",
      "requires": {
        "has-symbols": "^1.0.2"
      }
    },
    "is-typed-array": {
      "version": "1.1.8",
      "resolved": "https://registry.npmjs.org/is-typed-array/-/is-typed-array-1.1.8.tgz",
      "integrity": "sha512-HqH41TNZq2fgtGT8WHVFVJhBVGuY3AnP3Q36K8JKXUxSxRgk/d+7NjmwG2vo2mYmXK8UYZKu0qH8bVP5gEisjA==",
      "requires": {
        "available-typed-arrays": "^1.0.5",
        "call-bind": "^1.0.2",
        "es-abstract": "^1.18.5",
        "foreach": "^2.0.5",
        "has-tostringtag": "^1.0.0"
      }
    },
    "is-typedarray": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz",
      "integrity": "sha1-5HnICFjfDBsR3dppQPlgEfzaSpo="
    },
    "is-unc-path": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/is-unc-path/-/is-unc-path-1.0.0.tgz",
      "integrity": "sha512-mrGpVd0fs7WWLfVsStvgF6iEJnbjDFZh9/emhRDcGWTduTfNHd9CHeUwH3gYIjdbwo4On6hunkztwOaAw0yllQ==",
      "requires": {
        "unc-path-regex": "^0.1.2"
      }
    },
    "is-windows": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/is-windows/-/is-windows-1.0.2.tgz",
      "integrity": "sha512-eXK1UInq2bPmjyX6e3VHIzMLobc4J94i4AWn+Hpq3OU5KkrRC96OAcR3PRJ/pGu6m8TRnBHP9dkXQVsT/COVIA=="
    },
    "is-wsl": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/is-wsl/-/is-wsl-1.1.0.tgz",
      "integrity": "sha1-HxbkqiKwTRM2tmGIpmrzxgDDpm0=",
      "dev": true
    },
    "is-yarn-global": {
      "version": "0.3.0",
      "resolved": "https://registry.npmjs.org/is-yarn-global/-/is-yarn-global-0.3.0.tgz",
      "integrity": "sha512-VjSeb/lHmkoyd8ryPVIKvOCn4D1koMqY+vqyjjUfc3xyKtP4dYOxM44sZrnqQSzSds3xyOrUTLTC9LVCVgLngw=="
    },
    "isarray": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz",
      "integrity": "sha1-u5NdSFgsuhaMBoNJV6VKPgcSTxE="
    },
    "isexe": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz",
      "integrity": "sha1-6PvzdNxVb/iUehDcsFctYz8s+hA="
    },
    "isobject": {
      "version": "3.0.1",
      "resolved": "https://registry.npmjs.org/isobject/-/isobject-3.0.1.tgz",
      "integrity": "sha1-TkMekrEalzFjaqH5yNHMvP2reN8="
    },
    "js-beautify": {
      "version": "1.5.10",
      "resolved": "https://registry.npmjs.org/js-beautify/-/js-beautify-1.5.10.tgz",
      "integrity": "sha1-TZU3FwJpk0SlFsomv1nwonu3Vxk=",
      "requires": {
        "config-chain": "~1.1.5",
        "mkdirp": "~0.5.0",
        "nopt": "~3.0.1"
      },
      "dependencies": {
        "mkdirp": {
          "version": "0.5.5",
          "resolved": "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz",
          "integrity": "sha512-NKmAlESf6jMGym1++R0Ra7wvhV+wFW63FaSOFPwRahvea0gMUcGUhVeAg/0BC0wiv9ih5NYPB1Wn1UEI1/L+xQ==",
          "requires": {
            "minimist": "^1.2.5"
          }
        }
      }
    },
    "js-yaml": {
      "version": "3.14.1",
      "resolved": "https://registry.npmjs.org/js-yaml/-/js-yaml-3.14.1.tgz",
      "integrity": "sha512-okMH7OXXJ7YrN9Ok3/SXrnu4iX9yOk+25nqX4imS2npuvTYDmo/QEZoqwZkYaIDk3jVvBOTOIEgEhaLOynBS9g==",
      "dev": true,
      "requires": {
        "argparse": "^1.0.7",
        "esprima": "^4.0.0"
      }
    },
    "json-buffer": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/json-buffer/-/json-buffer-3.0.0.tgz",
      "integrity": "sha1-Wx85evx11ne96Lz8Dkfh+aPZqJg="
    },
    "json-schema-traverse": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz",
      "integrity": "sha512-NM8/P9n3XjXhIZn1lLhkFaACTOURQXjWhV4BA/RnOv8xvgqtqpAX9IO4mRQxSx1Rlo4tqzeqb0sOlruaOy3dug=="
    },
    "kareem": {
      "version": "2.3.2",
      "resolved": "https://registry.npmjs.org/kareem/-/kareem-2.3.2.tgz",
      "integrity": "sha512-STHz9P7X2L4Kwn72fA4rGyqyXdmrMSdxqHx9IXon/FXluXieaFA6KJ2upcHAHxQPQ0LeM/OjLrhFxifHewOALQ=="
    },
    "keyv": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/keyv/-/keyv-3.1.0.tgz",
      "integrity": "sha512-9ykJ/46SN/9KPM/sichzQ7OvXyGDYKGTaDlKMGCAlg2UK8KRy4jb0d8sFc+0Tt0YYnThq8X2RZgCg74RPxgcVA==",
      "requires": {
        "json-buffer": "3.0.0"
      }
    },
    "kind-of": {
      "version": "6.0.3",
      "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-6.0.3.tgz",
      "integrity": "sha512-dcS1ul+9tmeD95T+x28/ehLgd9mENa3LsvDTtzm3vyBEO7RPptvAD+t44WVXaUjTBRcrpFeFlC8WCruUR456hw=="
    },
    "latest-version": {
      "version": "5.1.0",
      "resolved": "https://registry.npmjs.org/latest-version/-/latest-version-5.1.0.tgz",
      "integrity": "sha512-weT+r0kTkRQdCdYCNtkMwWXQTMEswKrFBkm4ckQOMVhhqhIMI1UT2hMj+1iigIhgSZm5gTmrRXBNoGUgaTY1xA==",
      "requires": {
        "package-json": "^6.3.0"
      }
    },
    "lazy-cache": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/lazy-cache/-/lazy-cache-1.0.4.tgz",
      "integrity": "sha1-odePw6UEdMuAhF07O24dpJpEbo4="
    },
    "liftup": {
      "version": "3.0.1",
      "resolved": "https://registry.npmjs.org/liftup/-/liftup-3.0.1.tgz",
      "integrity": "sha512-yRHaiQDizWSzoXk3APcA71eOI/UuhEkNN9DiW2Tt44mhYzX4joFoCZlxsSOF7RyeLlfqzFLQI1ngFq3ggMPhOw==",
      "requires": {
        "extend": "^3.0.2",
        "findup-sync": "^4.0.0",
        "fined": "^1.2.0",
        "flagged-respawn": "^1.0.1",
        "is-plain-object": "^2.0.4",
        "object.map": "^1.0.1",
        "rechoir": "^0.7.0",
        "resolve": "^1.19.0"
      },
      "dependencies": {
        "findup-sync": {
          "version": "4.0.0",
          "resolved": "https://registry.npmjs.org/findup-sync/-/findup-sync-4.0.0.tgz",
          "integrity": "sha512-6jvvn/12IC4quLBL1KNokxC7wWTvYncaVUYSoxWw7YykPLuRrnv4qdHcSOywOI5RpkOVGeQRtWM8/q+G6W6qfQ==",
          "requires": {
            "detect-file": "^1.0.0",
            "is-glob": "^4.0.0",
            "micromatch": "^4.0.2",
            "resolve-dir": "^1.0.1"
          }
        }
      }
    },
    "livereload-js": {
      "version": "2.4.0",
      "resolved": "https://registry.npmjs.org/livereload-js/-/livereload-js-2.4.0.tgz",
      "integrity": "sha512-XPQH8Z2GDP/Hwz2PCDrh2mth4yFejwA1OZ/81Ti3LgKyhDcEjsSsqFWZojHG0va/duGd+WyosY7eXLDoOyqcPw==",
      "dev": true
    },
    "lodash": {
      "version": "4.17.21",
      "resolved": "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz",
      "integrity": "sha512-v2kDEe57lecTulaDIuNTPy3Ry4gLGJ6Z1O3vE1krgXZNrsQ+LFTGHVxVjcXPs17LhbZVGedAJv8XZ1tvj5FvSg=="
    },
    "lodash.clonedeep": {
      "version": "4.5.0",
      "resolved": "https://registry.npmjs.org/lodash.clonedeep/-/lodash.clonedeep-4.5.0.tgz",
      "integrity": "sha1-4j8/nE+Pvd6HJSnBBxhXoIblzO8="
    },
    "lodash.isfinite": {
      "version": "3.3.2",
      "resolved": "https://registry.npmjs.org/lodash.isfinite/-/lodash.isfinite-3.3.2.tgz",
      "integrity": "sha1-+4m2WpqAKBgz8LdHizpRBPiY67M=",
      "dev": true
    },
    "lodash.truncate": {
      "version": "4.4.2",
      "resolved": "https://registry.npmjs.org/lodash.truncate/-/lodash.truncate-4.4.2.tgz",
      "integrity": "sha1-WjUNoLERO4N+z//VgSy+WNbq4ZM="
    },
    "longest": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/longest/-/longest-1.0.1.tgz",
      "integrity": "sha1-MKCy2jj3N3DoKUoNIuZiXtd9AJc="
    },
    "lowercase-keys": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-1.0.1.tgz",
      "integrity": "sha512-G2Lj61tXDnVFFOi8VZds+SoQjtQC3dgokKdDG2mTm1tx4m50NUHBOZSBwQQHyy0V12A0JTG4icfZQH+xPyh8VA=="
    },
    "lru-cache": {
      "version": "4.1.5",
      "resolved": "https://registry.npmjs.org/lru-cache/-/lru-cache-4.1.5.tgz",
      "integrity": "sha512-sWZlbEP2OsHNkXrMl5GYk/jKk70MBng6UU4YI/qGDYbgf6YbP4EvmqISbXCoJiRKs+1bSpFHVgQxvJ17F2li5g==",
      "requires": {
        "pseudomap": "^1.0.2",
        "yallist": "^2.1.2"
      }
    },
    "make-dir": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/make-dir/-/make-dir-3.1.0.tgz",
      "integrity": "sha512-g3FeP20LNwhALb/6Cz6Dd4F2ngze0jz7tbzrD2wAV+o9FeNHe4rL+yK2md0J/fiSf1sa1ADhXqi5+oVwOM/eGw==",
      "requires": {
        "semver": "^6.0.0"
      },
      "dependencies": {
        "semver": {
          "version": "6.3.0",
          "resolved": "https://registry.npmjs.org/semver/-/semver-6.3.0.tgz",
          "integrity": "sha512-b39TBaTSfV6yBrapU89p5fKekE2m/NwnDocOVruQFS1/veMgdzuPcnOM34M6CwxW8jH/lxEa5rBoDeUwu5HHTw=="
        }
      }
    },
    "make-iterator": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/make-iterator/-/make-iterator-1.0.1.tgz",
      "integrity": "sha512-pxiuXh0iVEq7VM7KMIhs5gxsfxCux2URptUQaXo4iZZJxBAzTPOLE2BumO5dbfVYq/hBJFBR/a1mFDmOx5AGmw==",
      "requires": {
        "kind-of": "^6.0.2"
      }
    },
    "map-cache": {
      "version": "0.2.2",
      "resolved": "https://registry.npmjs.org/map-cache/-/map-cache-0.2.2.tgz",
      "integrity": "sha1-wyq9C9ZSXZsFFkW7TyasXcmKDb8="
    },
    "map-visit": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/map-visit/-/map-visit-1.0.0.tgz",
      "integrity": "sha1-7Nyo8TFE5mDxtb1B8S80edmN+48=",
      "dev": true,
      "requires": {
        "object-visit": "^1.0.0"
      }
    },
    "media-typer": {
      "version": "0.3.0",
      "resolved": "https://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz",
      "integrity": "sha1-hxDXrwqmJvj/+hzgAWhUUmMlV0g="
    },
    "memory-pager": {
      "version": "1.5.0",
      "resolved": "https://registry.npmjs.org/memory-pager/-/memory-pager-1.5.0.tgz",
      "integrity": "sha512-ZS4Bp4r/Zoeq6+NLJpP+0Zzm0pR8whtGPf1XExKLJBAczGMnSi3It14OiNCStjQjM6NU1okjQGSxgEZN8eBYKg==",
      "optional": true
    },
    "merge-descriptors": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/merge-descriptors/-/merge-descriptors-1.0.1.tgz",
      "integrity": "sha1-sAqqVW3YtEVoFQ7J0blT8/kMu2E="
    },
    "methods": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/methods/-/methods-1.1.2.tgz",
      "integrity": "sha1-VSmk1nZUE07cxSZmVoNbD4Ua/O4="
    },
    "micromatch": {
      "version": "4.0.4",
      "resolved": "https://registry.npmjs.org/micromatch/-/micromatch-4.0.4.tgz",
      "integrity": "sha512-pRmzw/XUcwXGpD9aI9q/0XOwLNygjETJ8y0ao0wdqprrzDa4YnxLcz7fQRZr8voh8V10kGhABbNcHVk5wHgWwg==",
      "requires": {
        "braces": "^3.0.1",
        "picomatch": "^2.2.3"
      }
    },
    "mime": {
      "version": "1.4.1",
      "resolved": "https://registry.npmjs.org/mime/-/mime-1.4.1.tgz",
      "integrity": "sha512-KI1+qOZu5DcW6wayYHSzR/tXKCDC5Om4s1z2QJjDULzLcmf3DvzS7oluY4HCTrc+9FiKmWUgeNLg7W3uIQvxtQ=="
    },
    "mime-db": {
      "version": "1.49.0",
      "resolved": "https://registry.npmjs.org/mime-db/-/mime-db-1.49.0.tgz",
      "integrity": "sha512-CIc8j9URtOVApSFCQIF+VBkX1RwXp/oMMOrqdyXSBXq5RWNEsRfyj1kiRnQgmNXmHxPoFIxOroKA3zcU9P+nAA=="
    },
    "mime-types": {
      "version": "2.1.32",
      "resolved": "https://registry.npmjs.org/mime-types/-/mime-types-2.1.32.tgz",
      "integrity": "sha512-hJGaVS4G4c9TSMYh2n6SQAGrC4RnfU+daP8G7cSCmaqNjiOoUY0VHCMS42pxnQmVF1GWwFhbHWn3RIxCqTmZ9A==",
      "requires": {
        "mime-db": "1.49.0"
      }
    },
    "mimic-response": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/mimic-response/-/mimic-response-1.0.1.tgz",
      "integrity": "sha512-j5EctnkH7amfV/q5Hgmoal1g2QHFJRraOtmx0JpIqkxhBhI/lJSl1nMpQ45hVarwNETOoWEimndZ4QK0RHxuxQ=="
    },
    "minimatch": {
      "version": "3.0.4",
      "resolved": "https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz",
      "integrity": "sha512-yJHVQEhyqPLUTgt9B83PXu6W3rx4MvvHvSUvToogpwoGDOUQ+yDrR0HRot+yOCdCO7u4hX3pWft6kWBBcqh0UA==",
      "requires": {
        "brace-expansion": "^1.1.7"
      }
    },
    "minimist": {
      "version": "1.2.5",
      "resolved": "https://registry.npmjs.org/minimist/-/minimist-1.2.5.tgz",
      "integrity": "sha512-FM9nNUYrRBAELZQT3xeZQ7fmMOBg6nWNmJKTcgsJeaLstP/UODVpGsr5OhXhhXg6f+qtJ8uiZ+PUxkDWcgIXLw=="
    },
    "mixin-deep": {
      "version": "1.3.2",
      "resolved": "https://registry.npmjs.org/mixin-deep/-/mixin-deep-1.3.2.tgz",
      "integrity": "sha512-WRoDn//mXBiJ1H40rqa3vH0toePwSsGb45iInWlTySa+Uu4k3tYUSxa2v1KqAiLtvlrSzaExqS1gtk96A9zvEA==",
      "dev": true,
      "requires": {
        "for-in": "^1.0.2",
        "is-extendable": "^1.0.1"
      },
      "dependencies": {
        "is-extendable": {
          "version": "1.0.1",
          "resolved": "https://registry.npmjs.org/is-extendable/-/is-extendable-1.0.1.tgz",
          "integrity": "sha512-arnXMxT1hhoKo9k1LZdmlNyJdDDfy2v0fXjFlmok4+i8ul/6WlbVge9bhM74OpNPQPMGUToDtz+KXa1PneJxOA==",
          "dev": true,
          "requires": {
            "is-plain-object": "^2.0.4"
          }
        }
      }
    },
    "mkdirp": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz",
      "integrity": "sha512-vVqVZQyf3WLx2Shd0qJ9xuvqgAyKPLAiqITEtqW0oIUjzo3PePDd6fW9iFz30ef7Ysp/oiWqbhszeGWW2T6Gzw==",
      "dev": true
    },
    "mongodb": {
      "version": "4.1.1",
      "resolved": "https://registry.npmjs.org/mongodb/-/mongodb-4.1.1.tgz",
      "integrity": "sha512-fbACrWEyvr6yl0sSiCGV0sqEiBwTtDJ8iSojmkDjAfw9JnOZSAkUyv9seFSPYhPPKwxp1PDtyjvBNfMDz0WBLQ==",
      "requires": {
        "bson": "^4.5.1",
        "denque": "^1.5.0",
        "mongodb-connection-string-url": "^2.0.0",
        "saslprep": "^1.0.0"
      }
    },
    "mongodb-connection-string-url": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/mongodb-connection-string-url/-/mongodb-connection-string-url-2.1.0.tgz",
      "integrity": "sha512-Qf9Zw7KGiRljWvMrrUFDdVqo46KIEiDuCzvEN97rh/PcKzk2bd6n9KuzEwBwW9xo5glwx69y1mI6s+jFUD/aIQ==",
      "requires": {
        "@types/whatwg-url": "^8.2.1",
        "whatwg-url": "^9.1.0"
      }
    },
    "mongoose": {
      "version": "6.0.8",
      "resolved": "https://registry.npmjs.org/mongoose/-/mongoose-6.0.8.tgz",
      "integrity": "sha512-7XZ5TUoDtF8af7+mKfL58s8dN2BKmldQPTlmkb41PaRAleBVGeAck7Mj6JlIh9SOCi+64GT+afebiJaeyXe1Lw==",
      "requires": {
        "bson": "^4.2.2",
        "kareem": "2.3.2",
        "mongodb": "4.1.1",
        "mpath": "0.8.4",
        "mquery": "4.0.0",
        "ms": "2.1.2",
        "regexp-clone": "1.0.0",
        "sift": "13.5.2",
        "sliced": "1.0.1"
      },
      "dependencies": {
        "ms": {
          "version": "2.1.2",
          "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz",
          "integrity": "sha512-sGkPx+VjMtmA6MX27oA4FBFELFCZZ4S4XqeGOXCv68tT+jb3vk/RyaKWP0PTKyWtmLSM0b+adUTEvbs1PEaH2w=="
        }
      }
    },
    "morgan": {
      "version": "1.9.1",
      "resolved": "https://registry.npmjs.org/morgan/-/morgan-1.9.1.tgz",
      "integrity": "sha512-HQStPIV4y3afTiCYVxirakhlCfGkI161c76kKFca7Fk1JusM//Qeo1ej2XaMniiNeaZklMVrh3vTtIzpzwbpmA==",
      "requires": {
        "basic-auth": "~2.0.0",
        "debug": "2.6.9",
        "depd": "~1.1.2",
        "on-finished": "~2.3.0",
        "on-headers": "~1.0.1"
      }
    },
    "mpath": {
      "version": "0.8.4",
      "resolved": "https://registry.npmjs.org/mpath/-/mpath-0.8.4.tgz",
      "integrity": "sha512-DTxNZomBcTWlrMW76jy1wvV37X/cNNxPW1y2Jzd4DZkAaC5ZGsm8bfGfNOthcDuRJujXLqiuS6o3Tpy0JEoh7g=="
    },
    "mquery": {
      "version": "4.0.0",
      "resolved": "https://registry.npmjs.org/mquery/-/mquery-4.0.0.tgz",
      "integrity": "sha512-nGjm89lHja+T/b8cybAby6H0YgA4qYC/lx6UlwvHGqvTq8bDaNeCwl1sY8uRELrNbVWJzIihxVd+vphGGn1vBw==",
      "requires": {
        "debug": "4.x",
        "regexp-clone": "^1.0.0",
        "sliced": "1.0.1"
      },
      "dependencies": {
        "debug": {
          "version": "4.3.2",
          "resolved": "https://registry.npmjs.org/debug/-/debug-4.3.2.tgz",
          "integrity": "sha512-mOp8wKcvj7XxC78zLgw/ZA+6TSgkoE2C/ienthhRD298T7UNwAg9diBpLRxC0mOezLl4B0xV7M0cCO6P/O0Xhw==",
          "requires": {
            "ms": "2.1.2"
          }
        },
        "ms": {
          "version": "2.1.2",
          "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz",
          "integrity": "sha512-sGkPx+VjMtmA6MX27oA4FBFELFCZZ4S4XqeGOXCv68tT+jb3vk/RyaKWP0PTKyWtmLSM0b+adUTEvbs1PEaH2w=="
        }
      }
    },
    "ms": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz",
      "integrity": "sha1-VgiurfwAvmwpAd9fmGF4jeDVl8g="
    },
    "multer": {
      "version": "1.4.3",
      "resolved": "https://registry.npmjs.org/multer/-/multer-1.4.3.tgz",
      "integrity": "sha512-np0YLKncuZoTzufbkM6wEKp68EhWJXcU6fq6QqrSwkckd2LlMgd1UqhUJLj6NS/5sZ8dE8LYDWslsltJznnXlg==",
      "requires": {
        "append-field": "^1.0.0",
        "busboy": "^0.2.11",
        "concat-stream": "^1.5.2",
        "mkdirp": "^0.5.4",
        "object-assign": "^4.1.1",
        "on-finished": "^2.3.0",
        "type-is": "^1.6.4",
        "xtend": "^4.0.0"
      },
      "dependencies": {
        "mkdirp": {
          "version": "0.5.5",
          "resolved": "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz",
          "integrity": "sha512-NKmAlESf6jMGym1++R0Ra7wvhV+wFW63FaSOFPwRahvea0gMUcGUhVeAg/0BC0wiv9ih5NYPB1Wn1UEI1/L+xQ==",
          "requires": {
            "minimist": "^1.2.5"
          }
        }
      }
    },
    "mysql": {
      "version": "2.18.1",
      "resolved": "https://registry.npmjs.org/mysql/-/mysql-2.18.1.tgz",
      "integrity": "sha512-Bca+gk2YWmqp2Uf6k5NFEurwY/0td0cpebAucFpY/3jhrwrVGuxU2uQFCHjU19SJfje0yQvi+rVWdq78hR5lig==",
      "requires": {
        "bignumber.js": "9.0.0",
        "readable-stream": "2.3.7",
        "safe-buffer": "5.1.2",
        "sqlstring": "2.3.1"
      }
    },
    "nanomatch": {
      "version": "1.2.13",
      "resolved": "https://registry.npmjs.org/nanomatch/-/nanomatch-1.2.13.tgz",
      "integrity": "sha512-fpoe2T0RbHwBTBUOftAfBPaDEi06ufaUai0mE6Yn1kacc3SnTErfb/h+X94VXzI64rKFHYImXSvdwGGCmwOqCA==",
      "dev": true,
      "requires": {
        "arr-diff": "^4.0.0",
        "array-unique": "^0.3.2",
        "define-property": "^2.0.2",
        "extend-shallow": "^3.0.2",
        "fragment-cache": "^0.2.1",
        "is-windows": "^1.0.2",
        "kind-of": "^6.0.2",
        "object.pick": "^1.3.0",
        "regex-not": "^1.0.0",
        "snapdragon": "^0.8.1",
        "to-regex": "^3.0.1"
      }
    },
    "negotiator": {
      "version": "0.6.2",
      "resolved": "https://registry.npmjs.org/negotiator/-/negotiator-0.6.2.tgz",
      "integrity": "sha512-hZXc7K2e+PgeI1eDBe/10Ard4ekbfrrqG8Ep+8Jmf4JID2bNg7NvCPOZN+kfF574pFQI7mum2AUqDidoKqcTOw=="
    },
    "nl2br": {
      "version": "0.0.3",
      "resolved": "https://registry.npmjs.org/nl2br/-/nl2br-0.0.3.tgz",
      "integrity": "sha1-d3jWE4l54FGGat4LO/YA98RjJO4="
    },
    "node-http2": {
      "version": "4.0.1",
      "resolved": "https://registry.npmjs.org/node-http2/-/node-http2-4.0.1.tgz",
      "integrity": "sha1-Fk/1O13SLITwrxQrh3xerraAmVk=",
      "dev": true,
      "requires": {
        "assert": "1.4.1",
        "events": "1.1.1",
        "https-browserify": "0.0.1",
        "setimmediate": "^1.0.5",
        "stream-browserify": "2.0.1",
        "timers-browserify": "2.0.2",
        "url": "^0.11.0",
        "websocket-stream": "^5.0.1"
      }
    },
    "nodemailer": {
      "version": "6.6.5",
      "resolved": "https://registry.npmjs.org/nodemailer/-/nodemailer-6.6.5.tgz",
      "integrity": "sha512-C/v856DBijUzHcHIgGpQoTrfsH3suKIRAGliIzCstatM2cAa+MYX3LuyCrABiO/cdJTxgBBHXxV1ztiqUwst5A=="
    },
    "nodemon": {
      "version": "2.0.13",
      "resolved": "https://registry.npmjs.org/nodemon/-/nodemon-2.0.13.tgz",
      "integrity": "sha512-UMXMpsZsv1UXUttCn6gv8eQPhn6DR4BW+txnL3IN5IHqrCwcrT/yWHfL35UsClGXknTH79r5xbu+6J1zNHuSyA==",
      "requires": {
        "chokidar": "^3.2.2",
        "debug": "^3.2.6",
        "ignore-by-default": "^1.0.1",
        "minimatch": "^3.0.4",
        "pstree.remy": "^1.1.7",
        "semver": "^5.7.1",
        "supports-color": "^5.5.0",
        "touch": "^3.1.0",
        "undefsafe": "^2.0.3",
        "update-notifier": "^5.1.0"
      },
      "dependencies": {
        "debug": {
          "version": "3.2.7",
          "resolved": "https://registry.npmjs.org/debug/-/debug-3.2.7.tgz",
          "integrity": "sha512-CFjzYYAi4ThfiQvizrFQevTTXHtnCqWfe7x1AhgEscTz6ZbLbfoLRLPugTQyBth6f8ZERVUSyWHFD/7Wu4t1XQ==",
          "requires": {
            "ms": "^2.1.1"
          }
        },
        "has-flag": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz",
          "integrity": "sha1-tdRU3CGZriJWmfNGfloH87lVuv0="
        },
        "ms": {
          "version": "2.1.3",
          "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz",
          "integrity": "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA=="
        },
        "supports-color": {
          "version": "5.5.0",
          "resolved": "https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz",
          "integrity": "sha512-QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==",
          "requires": {
            "has-flag": "^3.0.0"
          }
        }
      }
    },
    "nopt": {
      "version": "3.0.6",
      "resolved": "https://registry.npmjs.org/nopt/-/nopt-3.0.6.tgz",
      "integrity": "sha1-xkZdvwirzU2zWTF/eaxopkayj/k=",
      "requires": {
        "abbrev": "1"
      }
    },
    "normalize-path": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz",
      "integrity": "sha512-6eZs5Ls3WtCisHWp9S2GUy8dqkpGi4BVSz3GaqiE6ezub0512ESztXUwUB6C6IKbQkY2Pnb/mD4WYojCRwcwLA=="
    },
    "normalize-url": {
      "version": "4.5.1",
      "resolved": "https://registry.npmjs.org/normalize-url/-/normalize-url-4.5.1.tgz",
      "integrity": "sha512-9UZCFRHQdNrfTpGg8+1INIg93B6zE0aXMVFkw1WFwvO4SlZywU6aLg5Of0Ap/PgcbSw4LNxvMWXMeugwMCX0AA=="
    },
    "npm-run-path": {
      "version": "2.0.2",
      "resolved": "https://registry.npmjs.org/npm-run-path/-/npm-run-path-2.0.2.tgz",
      "integrity": "sha1-NakjLfo11wZ7TLLd8jV7GHFTbF8=",
      "dev": true,
      "requires": {
        "path-key": "^2.0.0"
      }
    },
    "nth-check": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/nth-check/-/nth-check-2.0.1.tgz",
      "integrity": "sha512-it1vE95zF6dTT9lBsYbxvqh0Soy4SPowchj0UBGj/V6cTPnXXtQOPUbhZ6CmGzAD/rW22LQK6E96pcdJXk4A4w==",
      "requires": {
        "boolbase": "^1.0.0"
      }
    },
    "object-assign": {
      "version": "4.1.1",
      "resolved": "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz",
      "integrity": "sha1-IQmtx5ZYh8/AXLvUQsrIv7s2CGM="
    },
    "object-copy": {
      "version": "0.1.0",
      "resolved": "https://registry.npmjs.org/object-copy/-/object-copy-0.1.0.tgz",
      "integrity": "sha1-fn2Fi3gb18mRpBupde04EnVOmYw=",
      "dev": true,
      "requires": {
        "copy-descriptor": "^0.1.0",
        "define-property": "^0.2.5",
        "kind-of": "^3.0.3"
      },
      "dependencies": {
        "define-property": {
          "version": "0.2.5",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
          "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^0.1.0"
          }
        },
        "kind-of": {
          "version": "3.2.2",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
          "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
          "dev": true,
          "requires": {
            "is-buffer": "^1.1.5"
          }
        }
      }
    },
    "object-inspect": {
      "version": "1.11.0",
      "resolved": "https://registry.npmjs.org/object-inspect/-/object-inspect-1.11.0.tgz",
      "integrity": "sha512-jp7ikS6Sd3GxQfZJPyH3cjcbJF6GZPClgdV+EFygjFLQ5FmW/dRUnTd9PQ9k0JhoNDabWFbpF1yCdSWCC6gexg=="
    },
    "object-keys": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/object-keys/-/object-keys-1.1.1.tgz",
      "integrity": "sha512-NuAESUOUMrlIXOfHKzD6bpPu3tYt3xvjNdRIQ+FeT0lNb4K8WR70CaDxhuNguS2XG+GjkyMwOzsN5ZktImfhLA=="
    },
    "object-visit": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/object-visit/-/object-visit-1.0.1.tgz",
      "integrity": "sha1-95xEk68MU3e1n+OdOV5BBC3QRbs=",
      "dev": true,
      "requires": {
        "isobject": "^3.0.0"
      }
    },
    "object.assign": {
      "version": "4.1.2",
      "resolved": "https://registry.npmjs.org/object.assign/-/object.assign-4.1.2.tgz",
      "integrity": "sha512-ixT2L5THXsApyiUPYKmW+2EHpXXe5Ii3M+f4e+aJFAHao5amFRW6J0OO6c/LU8Be47utCx2GL89hxGB6XSmKuQ==",
      "requires": {
        "call-bind": "^1.0.0",
        "define-properties": "^1.1.3",
        "has-symbols": "^1.0.1",
        "object-keys": "^1.1.1"
      }
    },
    "object.defaults": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/object.defaults/-/object.defaults-1.1.0.tgz",
      "integrity": "sha1-On+GgzS0B96gbaFtiNXNKeQ1/s8=",
      "requires": {
        "array-each": "^1.0.1",
        "array-slice": "^1.0.0",
        "for-own": "^1.0.0",
        "isobject": "^3.0.0"
      }
    },
    "object.map": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/object.map/-/object.map-1.0.1.tgz",
      "integrity": "sha1-z4Plncj8wK1fQlDh94s7gb2AHTc=",
      "requires": {
        "for-own": "^1.0.0",
        "make-iterator": "^1.0.0"
      }
    },
    "object.pick": {
      "version": "1.3.0",
      "resolved": "https://registry.npmjs.org/object.pick/-/object.pick-1.3.0.tgz",
      "integrity": "sha1-h6EKxMFpS9Lhy/U1kaZhQftd10c=",
      "requires": {
        "isobject": "^3.0.1"
      }
    },
    "on-finished": {
      "version": "2.3.0",
      "resolved": "https://registry.npmjs.org/on-finished/-/on-finished-2.3.0.tgz",
      "integrity": "sha1-IPEzZIGwg811M3mSoWlxqi2QaUc=",
      "requires": {
        "ee-first": "1.1.1"
      }
    },
    "on-headers": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/on-headers/-/on-headers-1.0.2.tgz",
      "integrity": "sha512-pZAE+FJLoyITytdqK0U5s+FIpjN0JP3OzFi/u8Rx+EV5/W+JTWGXG8xFzevE7AjBfDqHv/8vL8qQsIhHnqRkrA=="
    },
    "once": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/once/-/once-1.4.0.tgz",
      "integrity": "sha1-WDsap3WWHUsROsF9nFC6753Xa9E=",
      "requires": {
        "wrappy": "1"
      }
    },
    "opn": {
      "version": "6.0.0",
      "resolved": "https://registry.npmjs.org/opn/-/opn-6.0.0.tgz",
      "integrity": "sha512-I9PKfIZC+e4RXZ/qr1RhgyCnGgYX0UEIlXgWnCOVACIvFgaC9rz6Won7xbdhoHrd8IIhV7YEpHjreNUNkqCGkQ==",
      "dev": true,
      "requires": {
        "is-wsl": "^1.1.0"
      }
    },
    "os-homedir": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/os-homedir/-/os-homedir-1.0.2.tgz",
      "integrity": "sha1-/7xJiDNuDoM94MFox+8VISGqf7M="
    },
    "os-tmpdir": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/os-tmpdir/-/os-tmpdir-1.0.2.tgz",
      "integrity": "sha1-u+Z0BseaqFxc/sdm/lc0VV36EnQ="
    },
    "osenv": {
      "version": "0.1.5",
      "resolved": "https://registry.npmjs.org/osenv/-/osenv-0.1.5.tgz",
      "integrity": "sha512-0CWcCECdMVc2Rw3U5w9ZjqX6ga6ubk1xDVKxtBQPK7wis/0F2r9T6k4ydGYhecl7YUBxBVxhL5oisPsNxAPe2g==",
      "requires": {
        "os-homedir": "^1.0.0",
        "os-tmpdir": "^1.0.0"
      }
    },
    "p-cancelable": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/p-cancelable/-/p-cancelable-1.1.0.tgz",
      "integrity": "sha512-s73XxOZ4zpt1edZYZzvhqFa6uvQc1vwUa0K0BdtIZgQMAJj9IbebH+JkgKZc9h+B05PKHLOTl4ajG1BmNrVZlw=="
    },
    "p-finally": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/p-finally/-/p-finally-1.0.0.tgz",
      "integrity": "sha1-P7z7FbiZpEEjs0ttzBi3JDNqLK4=",
      "dev": true
    },
    "package-json": {
      "version": "6.5.0",
      "resolved": "https://registry.npmjs.org/package-json/-/package-json-6.5.0.tgz",
      "integrity": "sha512-k3bdm2n25tkyxcjSKzB5x8kfVxlMdgsbPr0GkZcwHsLpba6cBjqCt1KlcChKEvxHIcTB1FVMuwoijZ26xex5MQ==",
      "requires": {
        "got": "^9.6.0",
        "registry-auth-token": "^4.0.0",
        "registry-url": "^5.0.0",
        "semver": "^6.2.0"
      },
      "dependencies": {
        "semver": {
          "version": "6.3.0",
          "resolved": "https://registry.npmjs.org/semver/-/semver-6.3.0.tgz",
          "integrity": "sha512-b39TBaTSfV6yBrapU89p5fKekE2m/NwnDocOVruQFS1/veMgdzuPcnOM34M6CwxW8jH/lxEa5rBoDeUwu5HHTw=="
        }
      }
    },
    "parse-filepath": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/parse-filepath/-/parse-filepath-1.0.2.tgz",
      "integrity": "sha1-pjISf1Oq89FYdvWHLz/6x2PWyJE=",
      "requires": {
        "is-absolute": "^1.0.0",
        "map-cache": "^0.2.0",
        "path-root": "^0.1.1"
      }
    },
    "parse-passwd": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/parse-passwd/-/parse-passwd-1.0.0.tgz",
      "integrity": "sha1-bVuTSkVpk7I9N/QKOC1vFmao5cY="
    },
    "parseurl": {
      "version": "1.3.3",
      "resolved": "https://registry.npmjs.org/parseurl/-/parseurl-1.3.3.tgz",
      "integrity": "sha512-CiyeOxFT/JZyN5m0z9PfXw4SCBJ6Sygz1Dpl0wqjlhDEGGBP1GnsUVEL0p63hoG1fcj3fHynXi9NYO4nWOL+qQ=="
    },
    "pascalcase": {
      "version": "0.1.1",
      "resolved": "https://registry.npmjs.org/pascalcase/-/pascalcase-0.1.1.tgz",
      "integrity": "sha1-s2PlXoAGym/iF4TS2yK9FdeRfxQ=",
      "dev": true
    },
    "path-dirname": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/path-dirname/-/path-dirname-1.0.2.tgz",
      "integrity": "sha1-zDPSTVJeCZpTiMAzbG4yuRYGCeA=",
      "dev": true
    },
    "path-is-absolute": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz",
      "integrity": "sha1-F0uSaHNVNP+8es5r9TpanhtcX18="
    },
    "path-is-inside": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/path-is-inside/-/path-is-inside-1.0.2.tgz",
      "integrity": "sha1-NlQX3t5EQw0cEa9hAn+s8HS9/FM=",
      "dev": true
    },
    "path-key": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/path-key/-/path-key-2.0.1.tgz",
      "integrity": "sha1-QRyttXTFoUDTpLGRDUDYDMn0C0A=",
      "dev": true
    },
    "path-parse": {
      "version": "1.0.7",
      "resolved": "https://registry.npmjs.org/path-parse/-/path-parse-1.0.7.tgz",
      "integrity": "sha512-LDJzPVEEEPR+y48z93A0Ed0yXb8pAByGWo/k5YYdYgpY2/2EsOsksJrq7lOHxryrVOn1ejG6oAp8ahvOIQD8sw=="
    },
    "path-root": {
      "version": "0.1.1",
      "resolved": "https://registry.npmjs.org/path-root/-/path-root-0.1.1.tgz",
      "integrity": "sha1-mkpoFMrBwM1zNgqV8yCDyOpHRbc=",
      "requires": {
        "path-root-regex": "^0.1.0"
      }
    },
    "path-root-regex": {
      "version": "0.1.2",
      "resolved": "https://registry.npmjs.org/path-root-regex/-/path-root-regex-0.1.2.tgz",
      "integrity": "sha1-v8zcjfWxLcUsi0PsONGNcsBLqW0="
    },
    "path-to-regexp": {
      "version": "0.1.7",
      "resolved": "https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.7.tgz",
      "integrity": "sha1-32BBeABfUi8V60SQ5yR6G/qmf4w="
    },
    "picomatch": {
      "version": "2.3.0",
      "resolved": "https://registry.npmjs.org/picomatch/-/picomatch-2.3.0.tgz",
      "integrity": "sha512-lY1Q/PiJGC2zOv/z391WOTD+Z02bCgsFfvxoXXf6h7kv9o+WmsmzYqrAwY63sNgOxE4xEdq0WyUnXfKeBrSvYw=="
    },
    "pify": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/pify/-/pify-3.0.0.tgz",
      "integrity": "sha1-5aSs0sEB/fPZpNB/DbxNtJ3SgXY=",
      "dev": true
    },
    "portscanner": {
      "version": "2.2.0",
      "resolved": "https://registry.npmjs.org/portscanner/-/portscanner-2.2.0.tgz",
      "integrity": "sha512-IFroCz/59Lqa2uBvzK3bKDbDDIEaAY8XJ1jFxcLWTqosrsc32//P4VuSB2vZXoHiHqOmx8B5L5hnKOxL/7FlPw==",
      "dev": true,
      "requires": {
        "async": "^2.6.0",
        "is-number-like": "^1.0.3"
      },
      "dependencies": {
        "async": {
          "version": "2.6.3",
          "resolved": "https://registry.npmjs.org/async/-/async-2.6.3.tgz",
          "integrity": "sha512-zflvls11DCy+dQWzTW2dzuilv8Z5X/pjfmZOWba6TNIVDm+2UDaJmXSOXlasHKfNBs8oo3M0aT50fDEWfKZjXg==",
          "dev": true,
          "requires": {
            "lodash": "^4.17.14"
          }
        }
      }
    },
    "posix-character-classes": {
      "version": "0.1.1",
      "resolved": "https://registry.npmjs.org/posix-character-classes/-/posix-character-classes-0.1.1.tgz",
      "integrity": "sha1-AerA/jta9xoqbAL+q7jB/vfgDqs=",
      "dev": true
    },
    "posthtml": {
      "version": "0.16.5",
      "resolved": "https://registry.npmjs.org/posthtml/-/posthtml-0.16.5.tgz",
      "integrity": "sha512-1qOuPsywVlvymhTFIBniDXwUDwvlDri5KUQuBqjmCc8Jj4b/HDSVWU//P6rTWke5rzrk+vj7mms2w8e1vD0nnw==",
      "dev": true,
      "requires": {
        "posthtml-parser": "^0.10.0",
        "posthtml-render": "^3.0.0"
      }
    },
    "posthtml-parser": {
      "version": "0.10.1",
      "resolved": "https://registry.npmjs.org/posthtml-parser/-/posthtml-parser-0.10.1.tgz",
      "integrity": "sha512-i7w2QEHqiGtsvNNPty0Mt/+ERch7wkgnFh3+JnBI2VgDbGlBqKW9eDVd3ENUhE1ujGFe3e3E/odf7eKhvLUyDg==",
      "dev": true,
      "requires": {
        "htmlparser2": "^7.1.1"
      }
    },
    "posthtml-render": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/posthtml-render/-/posthtml-render-3.0.0.tgz",
      "integrity": "sha512-z+16RoxK3fUPgwaIgH9NGnK1HKY9XIDpydky5eQGgAFVXTCSezalv9U2jQuNV+Z9qV1fDWNzldcw4eK0SSbqKA==",
      "dev": true,
      "requires": {
        "is-json": "^2.0.1"
      }
    },
    "prepend-http": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/prepend-http/-/prepend-http-2.0.0.tgz",
      "integrity": "sha1-6SQ0v6XqjBn0HN/UAddBo8gZ2Jc="
    },
    "prettier": {
      "version": "2.4.1",
      "resolved": "https://registry.npmjs.org/prettier/-/prettier-2.4.1.tgz",
      "integrity": "sha512-9fbDAXSBcc6Bs1mZrDYb3XKzDLm4EXXL9sC1LqKP5rZkT6KRr/rf9amVUcODVXgguK/isJz0d0hP72WeaKWsvA=="
    },
    "pretty-error": {
      "version": "3.0.4",
      "resolved": "https://registry.npmjs.org/pretty-error/-/pretty-error-3.0.4.tgz",
      "integrity": "sha512-ytLFLfv1So4AO1UkoBF6GXQgJRaKbiSiGFICaOPNwQ3CMvBvXpLRubeQWyPGnsbV/t9ml9qto6IeCsho0aEvwQ==",
      "requires": {
        "lodash": "^4.17.20",
        "renderkid": "^2.0.6"
      }
    },
    "process-nextick-args": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.1.tgz",
      "integrity": "sha512-3ouUOpQhtgrbOa17J7+uxOTpITYWaGP7/AhoR3+A+/1e9skrzelGi/dXzEYyvbxubEF6Wn2ypscTKiKJFFn1ag=="
    },
    "proto-list": {
      "version": "1.2.4",
      "resolved": "https://registry.npmjs.org/proto-list/-/proto-list-1.2.4.tgz",
      "integrity": "sha1-IS1b/hMYMGpCD2QCuOJv85ZHqEk="
    },
    "proxy-addr": {
      "version": "2.0.7",
      "resolved": "https://registry.npmjs.org/proxy-addr/-/proxy-addr-2.0.7.tgz",
      "integrity": "sha512-llQsMLSUDUPT44jdrU/O37qlnifitDP+ZwrmmZcoSKyLKvtZxpyV0n2/bD/N4tBAAZ/gJEdZU7KMraoK1+XYAg==",
      "requires": {
        "forwarded": "0.2.0",
        "ipaddr.js": "1.9.1"
      }
    },
    "pseudomap": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/pseudomap/-/pseudomap-1.0.2.tgz",
      "integrity": "sha1-8FKijacOYYkX7wqKw0wa5aaChrM="
    },
    "pstree.remy": {
      "version": "1.1.8",
      "resolved": "https://registry.npmjs.org/pstree.remy/-/pstree.remy-1.1.8.tgz",
      "integrity": "sha512-77DZwxQmxKnu3aR542U+X8FypNzbfJ+C5XQDk3uWjWxn6151aIMGthWYRXTqT1E5oJvg+ljaa2OJi+VfvCOQ8w=="
    },
    "pump": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/pump/-/pump-3.0.0.tgz",
      "integrity": "sha512-LwZy+p3SFs1Pytd/jYct4wpv49HiYCqd9Rlc5ZVdk0V+8Yzv6jR5Blk3TRmPL1ft69TxP0IMZGJ+WPFU2BFhww==",
      "requires": {
        "end-of-stream": "^1.1.0",
        "once": "^1.3.1"
      }
    },
    "punycode": {
      "version": "1.3.2",
      "resolved": "https://registry.npmjs.org/punycode/-/punycode-1.3.2.tgz",
      "integrity": "sha1-llOgNvt8HuQjQvIyXM7v6jkmxI0=",
      "dev": true
    },
    "pupa": {
      "version": "2.1.1",
      "resolved": "https://registry.npmjs.org/pupa/-/pupa-2.1.1.tgz",
      "integrity": "sha512-l1jNAspIBSFqbT+y+5FosojNpVpF94nlI+wDUpqP9enwOTfHx9f0gh5nB96vl+6yTpsJsypeNrwfzPrKuHB41A==",
      "requires": {
        "escape-goat": "^2.0.0"
      }
    },
    "qs": {
      "version": "6.5.2",
      "resolved": "https://registry.npmjs.org/qs/-/qs-6.5.2.tgz",
      "integrity": "sha512-N5ZAX4/LxJmF+7wN74pUD6qAh9/wnvdQcjq9TZjevvXzSUo7bfmw91saqMjzGS2xq91/odN2dW/WOl7qQHNDGA=="
    },
    "querystring": {
      "version": "0.2.0",
      "resolved": "https://registry.npmjs.org/querystring/-/querystring-0.2.0.tgz",
      "integrity": "sha1-sgmEkgO7Jd+CDadW50cAWHhSFiA=",
      "dev": true
    },
    "random-bytes": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/random-bytes/-/random-bytes-1.0.0.tgz",
      "integrity": "sha1-T2ih3Arli9P7lYSMMDJNt11kNgs="
    },
    "range-parser": {
      "version": "1.2.1",
      "resolved": "https://registry.npmjs.org/range-parser/-/range-parser-1.2.1.tgz",
      "integrity": "sha512-Hrgsx+orqoygnmhFbKaHE6c296J+HTAQXoxEF6gNupROmmGJRoyzfG3ccAveqCBrwr/2yxQ5BVd/GTl5agOwSg=="
    },
    "raw-body": {
      "version": "2.4.0",
      "resolved": "https://registry.npmjs.org/raw-body/-/raw-body-2.4.0.tgz",
      "integrity": "sha512-4Oz8DUIwdvoa5qMJelxipzi/iJIi40O5cGV1wNYp5hvZP8ZN0T+jiNkL0QepXs+EsQ9XJ8ipEDoiH70ySUJP3Q==",
      "requires": {
        "bytes": "3.1.0",
        "http-errors": "1.7.2",
        "iconv-lite": "0.4.24",
        "unpipe": "1.0.0"
      },
      "dependencies": {
        "http-errors": {
          "version": "1.7.2",
          "resolved": "https://registry.npmjs.org/http-errors/-/http-errors-1.7.2.tgz",
          "integrity": "sha512-uUQBt3H/cSIVfch6i1EuPNy/YsRSOUBXTVfZ+yR7Zjez3qjBz6i9+i4zjNaoqcoFVI4lQJ5plg63TvGfRSDCRg==",
          "requires": {
            "depd": "~1.1.2",
            "inherits": "2.0.3",
            "setprototypeof": "1.1.1",
            "statuses": ">= 1.5.0 < 2",
            "toidentifier": "1.0.0"
          }
        },
        "iconv-lite": {
          "version": "0.4.24",
          "resolved": "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz",
          "integrity": "sha512-v3MXnZAcvnywkTUEZomIActle7RXXeedOR31wwl7VlyoXO4Qi9arvSenNQWne1TcRwhCL1HwLI21bEqdpj8/rA==",
          "requires": {
            "safer-buffer": ">= 2.1.2 < 3"
          }
        },
        "setprototypeof": {
          "version": "1.1.1",
          "resolved": "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.1.1.tgz",
          "integrity": "sha512-JvdAWfbXeIGaZ9cILp38HntZSFSo3mWg6xGcJJsd+d4aRMOqauag1C63dJfDw7OaMYwEbHMOxEZ1lqVRYP2OAw=="
        },
        "statuses": {
          "version": "1.5.0",
          "resolved": "https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz",
          "integrity": "sha1-Fhx9rBd2Wf2YEfQ3cfqZOBR4Yow="
        }
      }
    },
    "rc": {
      "version": "1.2.8",
      "resolved": "https://registry.npmjs.org/rc/-/rc-1.2.8.tgz",
      "integrity": "sha512-y3bGgqKj3QBdxLbLkomlohkvsA8gdAiUQlSBJnBhfn+BPxg4bc62d8TcBW15wavDfgexCgccckhcZvywyQYPOw==",
      "requires": {
        "deep-extend": "^0.6.0",
        "ini": "~1.3.0",
        "minimist": "^1.2.0",
        "strip-json-comments": "~2.0.1"
      }
    },
    "readable-stream": {
      "version": "2.3.7",
      "resolved": "https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz",
      "integrity": "sha512-Ebho8K4jIbHAxnuxi7o42OrZgF/ZTNcsZj6nRKyUmkhLFq8CHItp/fy6hQZuZmP/n3yZ9VBUbp4zz/mX8hmYPw==",
      "requires": {
        "core-util-is": "~1.0.0",
        "inherits": "~2.0.3",
        "isarray": "~1.0.0",
        "process-nextick-args": "~2.0.0",
        "safe-buffer": "~5.1.1",
        "string_decoder": "~1.1.1",
        "util-deprecate": "~1.0.1"
      }
    },
    "readdirp": {
      "version": "3.6.0",
      "resolved": "https://registry.npmjs.org/readdirp/-/readdirp-3.6.0.tgz",
      "integrity": "sha512-hOS089on8RduqdbhvQ5Z37A0ESjsqz6qnRcffsMU3495FuTdqSm+7bhJ29JvIOsBDEEnan5DPu9t3To9VRlMzA==",
      "requires": {
        "picomatch": "^2.2.1"
      }
    },
    "rechoir": {
      "version": "0.7.1",
      "resolved": "https://registry.npmjs.org/rechoir/-/rechoir-0.7.1.tgz",
      "integrity": "sha512-/njmZ8s1wVeR6pjTZ+0nCnv8SpZNRMT2D1RLOJQESlYFDBvwpTA4KWJpZ+sBJ4+vhjILRcK7JIFdGCdxEAAitg==",
      "requires": {
        "resolve": "^1.9.0"
      }
    },
    "regex-not": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/regex-not/-/regex-not-1.0.2.tgz",
      "integrity": "sha512-J6SDjUgDxQj5NusnOtdFxDwN/+HWykR8GELwctJ7mdqhcyy1xEc4SRFHUXvxTp661YaVKAjfRLZ9cCqS6tn32A==",
      "dev": true,
      "requires": {
        "extend-shallow": "^3.0.2",
        "safe-regex": "^1.1.0"
      }
    },
    "regexp-clone": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/regexp-clone/-/regexp-clone-1.0.0.tgz",
      "integrity": "sha512-TuAasHQNamyyJ2hb97IuBEif4qBHGjPHBS64sZwytpLEqtBQ1gPJTnOaQ6qmpET16cK14kkjbazl6+p0RRv0yw=="
    },
    "registry-auth-token": {
      "version": "4.2.1",
      "resolved": "https://registry.npmjs.org/registry-auth-token/-/registry-auth-token-4.2.1.tgz",
      "integrity": "sha512-6gkSb4U6aWJB4SF2ZvLb76yCBjcvufXBqvvEx1HbmKPkutswjW1xNVRY0+daljIYRbogN7O0etYSlbiaEQyMyw==",
      "requires": {
        "rc": "^1.2.8"
      }
    },
    "registry-url": {
      "version": "5.1.0",
      "resolved": "https://registry.npmjs.org/registry-url/-/registry-url-5.1.0.tgz",
      "integrity": "sha512-8acYXXTI0AkQv6RAOjE3vOaIXZkT9wo4LOFbBKYQEEnnMNBpKqdUrI6S4NT0KPIo/WVvJ5tE/X5LF/TQUf0ekw==",
      "requires": {
        "rc": "^1.2.8"
      }
    },
    "remove-trailing-separator": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/remove-trailing-separator/-/remove-trailing-separator-1.1.0.tgz",
      "integrity": "sha1-wkvOKig62tW8P1jg1IJJuSN52O8=",
      "dev": true
    },
    "renderkid": {
      "version": "2.0.7",
      "resolved": "https://registry.npmjs.org/renderkid/-/renderkid-2.0.7.tgz",
      "integrity": "sha512-oCcFyxaMrKsKcTY59qnCAtmDVSLfPbrv6A3tVbPdFMMrv5jaK10V6m40cKsoPNhAqN6rmHW9sswW4o3ruSrwUQ==",
      "requires": {
        "css-select": "^4.1.3",
        "dom-converter": "^0.2.0",
        "htmlparser2": "^6.1.0",
        "lodash": "^4.17.21",
        "strip-ansi": "^3.0.1"
      },
      "dependencies": {
        "ansi-regex": {
          "version": "2.1.1",
          "resolved": "https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz",
          "integrity": "sha1-w7M6te42DYbg5ijwRorn7yfWVN8="
        },
        "entities": {
          "version": "2.2.0",
          "resolved": "https://registry.npmjs.org/entities/-/entities-2.2.0.tgz",
          "integrity": "sha512-p92if5Nz619I0w+akJrLZH0MX0Pb5DX39XOwQTtXSdQQOaYH03S1uIQp4mhOZtAXrxq4ViO67YTiLBo2638o9A=="
        },
        "htmlparser2": {
          "version": "6.1.0",
          "resolved": "https://registry.npmjs.org/htmlparser2/-/htmlparser2-6.1.0.tgz",
          "integrity": "sha512-gyyPk6rgonLFEDGoeRgQNaEUvdJ4ktTmmUh/h2t7s+M8oPpIPxgNACWa+6ESR57kXstwqPiCut0V8NRpcwgU7A==",
          "requires": {
            "domelementtype": "^2.0.1",
            "domhandler": "^4.0.0",
            "domutils": "^2.5.2",
            "entities": "^2.0.0"
          }
        },
        "strip-ansi": {
          "version": "3.0.1",
          "resolved": "https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz",
          "integrity": "sha1-ajhfuIU9lS1f8F0Oiq+UJ43GPc8=",
          "requires": {
            "ansi-regex": "^2.0.0"
          }
        }
      }
    },
    "repeat-element": {
      "version": "1.1.4",
      "resolved": "https://registry.npmjs.org/repeat-element/-/repeat-element-1.1.4.tgz",
      "integrity": "sha512-LFiNfRcSu7KK3evMyYOuCzv3L10TW7yC1G2/+StMjK8Y6Vqd2MG7r/Qjw4ghtuCOjFvlnms/iMmLqpvW/ES/WQ==",
      "dev": true
    },
    "repeat-string": {
      "version": "1.6.1",
      "resolved": "https://registry.npmjs.org/repeat-string/-/repeat-string-1.6.1.tgz",
      "integrity": "sha1-jcrkcOHIirwtYA//Sndihtp15jc="
    },
    "require-from-string": {
      "version": "2.0.2",
      "resolved": "https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz",
      "integrity": "sha512-Xf0nWe6RseziFMu+Ap9biiUbmplq6S9/p+7w7YXP/JBHhrUDDUhwa+vANyubuqfZWTveU//DYVGsDG7RKL/vEw=="
    },
    "reserved": {
      "version": "0.1.2",
      "resolved": "https://registry.npmjs.org/reserved/-/reserved-0.1.2.tgz",
      "integrity": "sha1-cHsSRqMmn3Vdp8/Pmvb0mDvvEFw=",
      "dev": true
    },
    "resolve": {
      "version": "1.20.0",
      "resolved": "https://registry.npmjs.org/resolve/-/resolve-1.20.0.tgz",
      "integrity": "sha512-wENBPt4ySzg4ybFQW2TT1zMQucPK95HSh/nq2CFTZVOGut2+pQvSsgtda4d26YrYcr067wjbmzOG8byDPBX63A==",
      "requires": {
        "is-core-module": "^2.2.0",
        "path-parse": "^1.0.6"
      }
    },
    "resolve-dir": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/resolve-dir/-/resolve-dir-1.0.1.tgz",
      "integrity": "sha1-eaQGRMNivoLybv/nOcm7U4IEb0M=",
      "requires": {
        "expand-tilde": "^2.0.0",
        "global-modules": "^1.0.0"
      }
    },
    "resolve-url": {
      "version": "0.2.1",
      "resolved": "https://registry.npmjs.org/resolve-url/-/resolve-url-0.2.1.tgz",
      "integrity": "sha1-LGN/53yJOv0qZj/iGqkIAGjiBSo=",
      "dev": true
    },
    "responselike": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/responselike/-/responselike-1.0.2.tgz",
      "integrity": "sha1-kYcg7ztjHFZCvgaPFa3lpG9Loec=",
      "requires": {
        "lowercase-keys": "^1.0.0"
      }
    },
    "ret": {
      "version": "0.1.15",
      "resolved": "https://registry.npmjs.org/ret/-/ret-0.1.15.tgz",
      "integrity": "sha512-TTlYpa+OL+vMMNG24xSlQGEJ3B/RzEfUlLct7b5G/ytav+wPrplCpVMFuwzXbkecJrb6IYo1iFb0S9v37754mg==",
      "dev": true
    },
    "right-align": {
      "version": "0.1.3",
      "resolved": "https://registry.npmjs.org/right-align/-/right-align-0.1.3.tgz",
      "integrity": "sha1-YTObci/mo1FWiSENJOFMlhSGE+8=",
      "requires": {
        "align-text": "^0.1.1"
      }
    },
    "rimraf": {
      "version": "3.0.2",
      "resolved": "https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz",
      "integrity": "sha512-JZkJMZkAGFFPP2YqXZXPbMlMBgsxzE8ILs4lMIX/2o0L9UBw9O/Y3o6wFw/i9YLapcUJWwqbi3kdxIPdC62TIA==",
      "dev": true,
      "requires": {
        "glob": "^7.1.3"
      }
    },
    "safe-buffer": {
      "version": "5.1.2",
      "resolved": "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz",
      "integrity": "sha512-Gd2UZBJDkXlY7GbJxfsE8/nvKkUEU1G38c1siN6QP6a9PT9MmHB8GnpscSmMJSoF8LOIrt8ud/wPtojys4G6+g=="
    },
    "safe-json-parse": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/safe-json-parse/-/safe-json-parse-1.0.1.tgz",
      "integrity": "sha1-PnZyPjjf3aE8mx0poeB//uSzC1c=",
      "dev": true
    },
    "safe-regex": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/safe-regex/-/safe-regex-1.1.0.tgz",
      "integrity": "sha1-QKNmnzsHfR6UPURinhV91IAjvy4=",
      "dev": true,
      "requires": {
        "ret": "~0.1.10"
      }
    },
    "safer-buffer": {
      "version": "2.1.2",
      "resolved": "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz",
      "integrity": "sha512-YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg=="
    },
    "saslprep": {
      "version": "1.0.3",
      "resolved": "https://registry.npmjs.org/saslprep/-/saslprep-1.0.3.tgz",
      "integrity": "sha512-/MY/PEMbk2SuY5sScONwhUDsV2p77Znkb/q3nSVstq/yQzYJOH/Azh29p9oJLsl3LnQwSvZDKagDGBsBwSooag==",
      "optional": true,
      "requires": {
        "sparse-bitfield": "^3.0.3"
      }
    },
    "semver": {
      "version": "5.7.1",
      "resolved": "https://registry.npmjs.org/semver/-/semver-5.7.1.tgz",
      "integrity": "sha512-sauaDf/PZdVgrLTNYHRtpXa1iRiKcaebiKQ1BJdpQlWH2lCvexQdX55snPFyK7QzpudqbCI0qXFfOasHdyNDGQ=="
    },
    "semver-diff": {
      "version": "3.1.1",
      "resolved": "https://registry.npmjs.org/semver-diff/-/semver-diff-3.1.1.tgz",
      "integrity": "sha512-GX0Ix/CJcHyB8c4ykpHGIAvLyOwOobtM/8d+TQkAd81/bEjgPHrfba41Vpesr7jX/t8Uh+R3EX9eAS5be+jQYg==",
      "requires": {
        "semver": "^6.3.0"
      },
      "dependencies": {
        "semver": {
          "version": "6.3.0",
          "resolved": "https://registry.npmjs.org/semver/-/semver-6.3.0.tgz",
          "integrity": "sha512-b39TBaTSfV6yBrapU89p5fKekE2m/NwnDocOVruQFS1/veMgdzuPcnOM34M6CwxW8jH/lxEa5rBoDeUwu5HHTw=="
        }
      }
    },
    "send": {
      "version": "0.16.2",
      "resolved": "https://registry.npmjs.org/send/-/send-0.16.2.tgz",
      "integrity": "sha512-E64YFPUssFHEFBvpbbjr44NCLtI1AohxQ8ZSiJjQLskAdKuriYEP6VyGEsRDH8ScozGpkaX1BGvhanqCwkcEZw==",
      "requires": {
        "debug": "2.6.9",
        "depd": "~1.1.2",
        "destroy": "~1.0.4",
        "encodeurl": "~1.0.2",
        "escape-html": "~1.0.3",
        "etag": "~1.8.1",
        "fresh": "0.5.2",
        "http-errors": "~1.6.2",
        "mime": "1.4.1",
        "ms": "2.0.0",
        "on-finished": "~2.3.0",
        "range-parser": "~1.2.0",
        "statuses": "~1.4.0"
      }
    },
    "serve-index": {
      "version": "1.9.1",
      "resolved": "https://registry.npmjs.org/serve-index/-/serve-index-1.9.1.tgz",
      "integrity": "sha1-03aNabHn2C5c4FD/9bRTvqEqkjk=",
      "dev": true,
      "requires": {
        "accepts": "~1.3.4",
        "batch": "0.6.1",
        "debug": "2.6.9",
        "escape-html": "~1.0.3",
        "http-errors": "~1.6.2",
        "mime-types": "~2.1.17",
        "parseurl": "~1.3.2"
      }
    },
    "serve-static": {
      "version": "1.13.2",
      "resolved": "https://registry.npmjs.org/serve-static/-/serve-static-1.13.2.tgz",
      "integrity": "sha512-p/tdJrO4U387R9oMjb1oj7qSMaMfmOyd4j9hOFoxZe2baQszgHcSWjuya/CiT5kgZZKRudHNOA0pYXOl8rQ5nw==",
      "requires": {
        "encodeurl": "~1.0.2",
        "escape-html": "~1.0.3",
        "parseurl": "~1.3.2",
        "send": "0.16.2"
      }
    },
    "set-value": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/set-value/-/set-value-2.0.1.tgz",
      "integrity": "sha512-JxHc1weCN68wRY0fhCoXpyK55m/XPHafOmK4UWD7m2CI14GMcFypt4w/0+NV5f/ZMby2F6S2wwA7fgynh9gWSw==",
      "dev": true,
      "requires": {
        "extend-shallow": "^2.0.1",
        "is-extendable": "^0.1.1",
        "is-plain-object": "^2.0.3",
        "split-string": "^3.0.1"
      },
      "dependencies": {
        "extend-shallow": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
          "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
          "dev": true,
          "requires": {
            "is-extendable": "^0.1.0"
          }
        }
      }
    },
    "setimmediate": {
      "version": "1.0.5",
      "resolved": "https://registry.npmjs.org/setimmediate/-/setimmediate-1.0.5.tgz",
      "integrity": "sha1-KQy7Iy4waULX1+qbg3Mqt4VvgoU=",
      "dev": true
    },
    "setprototypeof": {
      "version": "1.1.0",
      "resolved": "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.1.0.tgz",
      "integrity": "sha512-BvE/TwpZX4FXExxOxZyRGQQv651MSwmWKZGqvmPcRIjDqWub67kTKuIMx43cZZrS/cBBzwBcNDWoFxt2XEFIpQ=="
    },
    "shebang-command": {
      "version": "1.2.0",
      "resolved": "https://registry.npmjs.org/shebang-command/-/shebang-command-1.2.0.tgz",
      "integrity": "sha1-RKrGW2lbAzmJaMOfNj/uXer98eo=",
      "dev": true,
      "requires": {
        "shebang-regex": "^1.0.0"
      }
    },
    "shebang-regex": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/shebang-regex/-/shebang-regex-1.0.0.tgz",
      "integrity": "sha1-2kL0l0DAtC2yypcoVxyxkMmO/qM=",
      "dev": true
    },
    "side-channel": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/side-channel/-/side-channel-1.0.4.tgz",
      "integrity": "sha512-q5XPytqFEIKHkGdiMIrY10mvLRvnQh42/+GoBlFW3b2LXLE2xxJpZFdm94we0BaoV3RwJyGqg5wS7epxTv0Zvw==",
      "requires": {
        "call-bind": "^1.0.0",
        "get-intrinsic": "^1.0.2",
        "object-inspect": "^1.9.0"
      }
    },
    "sift": {
      "version": "13.5.2",
      "resolved": "https://registry.npmjs.org/sift/-/sift-13.5.2.tgz",
      "integrity": "sha512-+gxdEOMA2J+AI+fVsCqeNn7Tgx3M9ZN9jdi95939l1IJ8cZsqS8sqpJyOkic2SJk+1+98Uwryt/gL6XDaV+UZA=="
    },
    "sigmund": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/sigmund/-/sigmund-1.0.1.tgz",
      "integrity": "sha1-P/IfGYytIXX587eBhT/ZTQ0ZtZA="
    },
    "signal-exit": {
      "version": "3.0.5",
      "resolved": "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.5.tgz",
      "integrity": "sha512-KWcOiKeQj6ZyXx7zq4YxSMgHRlod4czeBQZrPb8OKcohcqAXShm7E20kEMle9WBt26hFcAf0qLOcp5zmY7kOqQ=="
    },
    "slice-ansi": {
      "version": "4.0.0",
      "resolved": "https://registry.npmjs.org/slice-ansi/-/slice-ansi-4.0.0.tgz",
      "integrity": "sha512-qMCMfhY040cVHT43K9BFygqYbUPFZKHOg7K73mtTWJRb8pyP3fzf4Ixd5SzdEJQ6MRUg/WBnOLxghZtKKurENQ==",
      "requires": {
        "ansi-styles": "^4.0.0",
        "astral-regex": "^2.0.0",
        "is-fullwidth-code-point": "^3.0.0"
      },
      "dependencies": {
        "is-fullwidth-code-point": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz",
          "integrity": "sha512-zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg=="
        }
      }
    },
    "sliced": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/sliced/-/sliced-1.0.1.tgz",
      "integrity": "sha1-CzpmK10Ewxd7GSa+qCsD+Dei70E="
    },
    "snapdragon": {
      "version": "0.8.2",
      "resolved": "https://registry.npmjs.org/snapdragon/-/snapdragon-0.8.2.tgz",
      "integrity": "sha512-FtyOnWN/wCHTVXOMwvSv26d+ko5vWlIDD6zoUJ7LW8vh+ZBC8QdljveRP+crNrtBwioEUWy/4dMtbBjA4ioNlg==",
      "dev": true,
      "requires": {
        "base": "^0.11.1",
        "debug": "^2.2.0",
        "define-property": "^0.2.5",
        "extend-shallow": "^2.0.1",
        "map-cache": "^0.2.2",
        "source-map": "^0.5.6",
        "source-map-resolve": "^0.5.0",
        "use": "^3.1.0"
      },
      "dependencies": {
        "define-property": {
          "version": "0.2.5",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
          "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^0.1.0"
          }
        },
        "extend-shallow": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
          "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
          "dev": true,
          "requires": {
            "is-extendable": "^0.1.0"
          }
        }
      }
    },
    "snapdragon-node": {
      "version": "2.1.1",
      "resolved": "https://registry.npmjs.org/snapdragon-node/-/snapdragon-node-2.1.1.tgz",
      "integrity": "sha512-O27l4xaMYt/RSQ5TR3vpWCAB5Kb/czIcqUFOM/C4fYcLnbZUc1PkjTAMjof2pBWaSTwOUd6qUHcFGVGj7aIwnw==",
      "dev": true,
      "requires": {
        "define-property": "^1.0.0",
        "isobject": "^3.0.0",
        "snapdragon-util": "^3.0.1"
      },
      "dependencies": {
        "define-property": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz",
          "integrity": "sha1-dp66rz9KY6rTr56NMEybvnm/sOY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^1.0.0"
          }
        },
        "is-accessor-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
          "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-data-descriptor": {
          "version": "1.0.0",
          "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
          "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
          "dev": true,
          "requires": {
            "kind-of": "^6.0.0"
          }
        },
        "is-descriptor": {
          "version": "1.0.2",
          "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
          "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
          "dev": true,
          "requires": {
            "is-accessor-descriptor": "^1.0.0",
            "is-data-descriptor": "^1.0.0",
            "kind-of": "^6.0.2"
          }
        }
      }
    },
    "snapdragon-util": {
      "version": "3.0.1",
      "resolved": "https://registry.npmjs.org/snapdragon-util/-/snapdragon-util-3.0.1.tgz",
      "integrity": "sha512-mbKkMdQKsjX4BAL4bRYTj21edOf8cN7XHdYUJEe+Zn99hVEYcMvKPct1IqNe7+AZPirn8BCDOQBHQZknqmKlZQ==",
      "dev": true,
      "requires": {
        "kind-of": "^3.2.0"
      },
      "dependencies": {
        "kind-of": {
          "version": "3.2.2",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
          "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
          "dev": true,
          "requires": {
            "is-buffer": "^1.1.5"
          }
        }
      }
    },
    "source-map": {
      "version": "0.5.7",
      "resolved": "https://registry.npmjs.org/source-map/-/source-map-0.5.7.tgz",
      "integrity": "sha1-igOdLRAh0i0eoUyA2OpGi6LvP8w="
    },
    "source-map-resolve": {
      "version": "0.5.3",
      "resolved": "https://registry.npmjs.org/source-map-resolve/-/source-map-resolve-0.5.3.tgz",
      "integrity": "sha512-Htz+RnsXWk5+P2slx5Jh3Q66vhQj1Cllm0zvnaY98+NFx+Dv2CF/f5O/t8x+KaNdrdIAsruNzoh/KpialbqAnw==",
      "dev": true,
      "requires": {
        "atob": "^2.1.2",
        "decode-uri-component": "^0.2.0",
        "resolve-url": "^0.2.1",
        "source-map-url": "^0.4.0",
        "urix": "^0.1.0"
      }
    },
    "source-map-url": {
      "version": "0.4.1",
      "resolved": "https://registry.npmjs.org/source-map-url/-/source-map-url-0.4.1.tgz",
      "integrity": "sha512-cPiFOTLUKvJFIg4SKVScy4ilPPW6rFgMgfuZJPNoDuMs3nC1HbMUycBoJw77xFIp6z1UJQJOfx6C9GMH80DiTw==",
      "dev": true
    },
    "sparse-bitfield": {
      "version": "3.0.3",
      "resolved": "https://registry.npmjs.org/sparse-bitfield/-/sparse-bitfield-3.0.3.tgz",
      "integrity": "sha1-/0rm5oZWBWuks+eSqzM004JzyhE=",
      "optional": true,
      "requires": {
        "memory-pager": "^1.0.2"
      }
    },
    "split-string": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/split-string/-/split-string-3.1.0.tgz",
      "integrity": "sha512-NzNVhJDYpwceVVii8/Hu6DKfD2G+NrQHlS/V/qgv763EYudVwEcMQNxd2lh+0VrUByXN/oJkl5grOhYWvQUYiw==",
      "dev": true,
      "requires": {
        "extend-shallow": "^3.0.0"
      }
    },
    "sprintf-js": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.1.2.tgz",
      "integrity": "sha512-VE0SOVEHCk7Qc8ulkWw3ntAzXuqf7S2lvwQaDLRnUeIEaKNQJzV6BwmLKhOqT61aGhfUMrXeaBk+oDGCzvhcug==",
      "dev": true
    },
    "sql-formatter": {
      "version": "4.0.2",
      "resolved": "https://registry.npmjs.org/sql-formatter/-/sql-formatter-4.0.2.tgz",
      "integrity": "sha512-R6u9GJRiXZLr/lDo8p56L+OyyN2QFJPCDnsyEOsbdIpsnDKL8gubYFo7lNR7Zx7hfdWT80SfkoVS0CMaF/DE2w==",
      "requires": {
        "argparse": "^2.0.1"
      },
      "dependencies": {
        "argparse": {
          "version": "2.0.1",
          "resolved": "https://registry.npmjs.org/argparse/-/argparse-2.0.1.tgz",
          "integrity": "sha512-8+9WqebbFzpX9OR+Wa6O29asIogeRMzcGtAINdpMHHyAg10f05aSFVBbcEqGf/PXw1EjAZ+q2/bEBg3DvurK3Q=="
        }
      }
    },
    "sqlstring": {
      "version": "2.3.1",
      "resolved": "https://registry.npmjs.org/sqlstring/-/sqlstring-2.3.1.tgz",
      "integrity": "sha1-R1OT/56RR5rqYtyvDKPRSYOn+0A="
    },
    "static-extend": {
      "version": "0.1.2",
      "resolved": "https://registry.npmjs.org/static-extend/-/static-extend-0.1.2.tgz",
      "integrity": "sha1-YICcOcv/VTNyJv1eC1IPNB8ftcY=",
      "dev": true,
      "requires": {
        "define-property": "^0.2.5",
        "object-copy": "^0.1.0"
      },
      "dependencies": {
        "define-property": {
          "version": "0.2.5",
          "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
          "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
          "dev": true,
          "requires": {
            "is-descriptor": "^0.1.0"
          }
        }
      }
    },
    "statuses": {
      "version": "1.4.0",
      "resolved": "https://registry.npmjs.org/statuses/-/statuses-1.4.0.tgz",
      "integrity": "sha512-zhSCtt8v2NDrRlPQpCNtw/heZLtfUDqxBM1udqikb/Hbk52LK4nQSwr10u77iopCW5LsyHpuXS0GnEc48mLeew=="
    },
    "stream-browserify": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/stream-browserify/-/stream-browserify-2.0.1.tgz",
      "integrity": "sha1-ZiZu5fm9uZQKTkUUyvtDu3Hlyds=",
      "dev": true,
      "requires": {
        "inherits": "~2.0.1",
        "readable-stream": "^2.0.2"
      }
    },
    "stream-shift": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/stream-shift/-/stream-shift-1.0.1.tgz",
      "integrity": "sha512-AiisoFqQ0vbGcZgQPY1cdP2I76glaVA/RauYR4G4thNFgkTqr90yXTo4LYX60Jl+sIlPNHHdGSwo01AvbKUSVQ==",
      "dev": true
    },
    "streamsearch": {
      "version": "0.1.2",
      "resolved": "https://registry.npmjs.org/streamsearch/-/streamsearch-0.1.2.tgz",
      "integrity": "sha1-gIudDlb8Jz2Am6VzOOkpkZoanxo="
    },
    "string-template": {
      "version": "0.2.1",
      "resolved": "https://registry.npmjs.org/string-template/-/string-template-0.2.1.tgz",
      "integrity": "sha1-QpMuWYo1LQH8IuwzZ9nYTuxsmt0=",
      "dev": true
    },
    "string-width": {
      "version": "4.2.3",
      "resolved": "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz",
      "integrity": "sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==",
      "requires": {
        "emoji-regex": "^8.0.0",
        "is-fullwidth-code-point": "^3.0.0",
        "strip-ansi": "^6.0.1"
      }
    },
    "string.prototype.trimend": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/string.prototype.trimend/-/string.prototype.trimend-1.0.4.tgz",
      "integrity": "sha512-y9xCjw1P23Awk8EvTpcyL2NIr1j7wJ39f+k6lvRnSMz+mz9CGz9NYPelDk42kOz6+ql8xjfK8oYzy3jAP5QU5A==",
      "requires": {
        "call-bind": "^1.0.2",
        "define-properties": "^1.1.3"
      }
    },
    "string.prototype.trimstart": {
      "version": "1.0.4",
      "resolved": "https://registry.npmjs.org/string.prototype.trimstart/-/string.prototype.trimstart-1.0.4.tgz",
      "integrity": "sha512-jh6e984OBfvxS50tdY2nRZnoC5/mLFKOREQfw8t5yytkoUsJRNxvI/E39qu1sD0OtWI3OC0XgKSmcWwziwYuZw==",
      "requires": {
        "call-bind": "^1.0.2",
        "define-properties": "^1.1.3"
      }
    },
    "string_decoder": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz",
      "integrity": "sha512-n/ShnvDi6FHbbVfviro+WojiFzv+s8MPMHBczVePfUpDJLwoLT0ht1l4YwBCbi8pJAveEEdnkHyPyTP/mzRfwg==",
      "requires": {
        "safe-buffer": "~5.1.0"
      }
    },
    "strip-ansi": {
      "version": "6.0.1",
      "resolved": "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz",
      "integrity": "sha512-Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==",
      "requires": {
        "ansi-regex": "^5.0.1"
      }
    },
    "strip-eof": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/strip-eof/-/strip-eof-1.0.0.tgz",
      "integrity": "sha1-u0P/VZim6wXYm1n80SnJgzE2Br8=",
      "dev": true
    },
    "strip-json-comments": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-2.0.1.tgz",
      "integrity": "sha1-PFMZQukIwml8DsNEhYwobHygpgo="
    },
    "supports-color": {
      "version": "7.2.0",
      "resolved": "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz",
      "integrity": "sha512-qpCAvRl9stuOHveKsn7HncJRvv501qIacKzQlO/+Lwxc9+0q2wLyv4Dfvt80/DPn2pqOBsJdDiogXGR9+OvwRw==",
      "requires": {
        "has-flag": "^4.0.0"
      }
    },
    "table": {
      "version": "6.7.2",
      "resolved": "https://registry.npmjs.org/table/-/table-6.7.2.tgz",
      "integrity": "sha512-UFZK67uvyNivLeQbVtkiUs8Uuuxv24aSL4/Vil2PJVtMgU8Lx0CYkP12uCGa3kjyQzOSgV1+z9Wkb82fCGsO0g==",
      "requires": {
        "ajv": "^8.0.1",
        "lodash.clonedeep": "^4.5.0",
        "lodash.truncate": "^4.4.2",
        "slice-ansi": "^4.0.0",
        "string-width": "^4.2.3",
        "strip-ansi": "^6.0.1"
      },
      "dependencies": {
        "ansi-regex": {
          "version": "5.0.1",
          "resolved": "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz",
          "integrity": "sha512-quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ=="
        },
        "is-fullwidth-code-point": {
          "version": "3.0.0",
          "resolved": "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz",
          "integrity": "sha512-zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg=="
        },
        "string-width": {
          "version": "4.2.3",
          "resolved": "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz",
          "integrity": "sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==",
          "requires": {
            "emoji-regex": "^8.0.0",
            "is-fullwidth-code-point": "^3.0.0",
            "strip-ansi": "^6.0.1"
          }
        },
        "strip-ansi": {
          "version": "6.0.1",
          "resolved": "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz",
          "integrity": "sha512-Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==",
          "requires": {
            "ansi-regex": "^5.0.1"
          }
        }
      }
    },
    "term-size": {
      "version": "1.2.0",
      "resolved": "https://registry.npmjs.org/term-size/-/term-size-1.2.0.tgz",
      "integrity": "sha1-RYuDiH8oj8Vtb/+/rSYuJmOO+mk=",
      "dev": true,
      "requires": {
        "execa": "^0.7.0"
      }
    },
    "timed-out": {
      "version": "4.0.1",
      "resolved": "https://registry.npmjs.org/timed-out/-/timed-out-4.0.1.tgz",
      "integrity": "sha1-8y6srFoXW+ol1/q1Zas+2HQe9W8=",
      "dev": true
    },
    "timers-browserify": {
      "version": "2.0.2",
      "resolved": "https://registry.npmjs.org/timers-browserify/-/timers-browserify-2.0.2.tgz",
      "integrity": "sha1-q0iDz1l9zVCvIRNJoA+8pWrIa4Y=",
      "dev": true,
      "requires": {
        "setimmediate": "^1.0.4"
      }
    },
    "tiny-lr": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/tiny-lr/-/tiny-lr-1.1.1.tgz",
      "integrity": "sha512-44yhA3tsaRoMOjQQ+5v5mVdqef+kH6Qze9jTpqtVufgYjYt08zyZAwNwwVBj3i1rJMnR52IxOW0LK0vBzgAkuA==",
      "dev": true,
      "requires": {
        "body": "^5.1.0",
        "debug": "^3.1.0",
        "faye-websocket": "~0.10.0",
        "livereload-js": "^2.3.0",
        "object-assign": "^4.1.0",
        "qs": "^6.4.0"
      },
      "dependencies": {
        "debug": {
          "version": "3.2.7",
          "resolved": "https://registry.npmjs.org/debug/-/debug-3.2.7.tgz",
          "integrity": "sha512-CFjzYYAi4ThfiQvizrFQevTTXHtnCqWfe7x1AhgEscTz6ZbLbfoLRLPugTQyBth6f8ZERVUSyWHFD/7Wu4t1XQ==",
          "dev": true,
          "requires": {
            "ms": "^2.1.1"
          }
        },
        "ms": {
          "version": "2.1.3",
          "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz",
          "integrity": "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==",
          "dev": true
        }
      }
    },
    "to-object-path": {
      "version": "0.3.0",
      "resolved": "https://registry.npmjs.org/to-object-path/-/to-object-path-0.3.0.tgz",
      "integrity": "sha1-KXWIt7Dn4KwI4E5nL4XB9JmeF68=",
      "dev": true,
      "requires": {
        "kind-of": "^3.0.2"
      },
      "dependencies": {
        "kind-of": {
          "version": "3.2.2",
          "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
          "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
          "dev": true,
          "requires": {
            "is-buffer": "^1.1.5"
          }
        }
      }
    },
    "to-readable-stream": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/to-readable-stream/-/to-readable-stream-1.0.0.tgz",
      "integrity": "sha512-Iq25XBt6zD5npPhlLVXGFN3/gyR2/qODcKNNyTMd4vbm39HUaOiAM4PMq0eMVC/Tkxz+Zjdsc55g9yyz+Yq00Q=="
    },
    "to-regex": {
      "version": "3.0.2",
      "resolved": "https://registry.npmjs.org/to-regex/-/to-regex-3.0.2.tgz",
      "integrity": "sha512-FWtleNAtZ/Ki2qtqej2CXTOayOH9bHDQF+Q48VpWyDXjbYxA4Yz8iDB31zXOBUlOHHKidDbqGVrTUvQMPmBGBw==",
      "dev": true,
      "requires": {
        "define-property": "^2.0.2",
        "extend-shallow": "^3.0.2",
        "regex-not": "^1.0.2",
        "safe-regex": "^1.1.0"
      }
    },
    "to-regex-range": {
      "version": "5.0.1",
      "resolved": "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz",
      "integrity": "sha512-65P7iz6X5yEr1cwcgvQxbbIw7Uk3gOy5dIdtZ4rDveLqhrdJP+Li/Hx6tyK0NEb+2GCyneCMJiGqrADCSNk8sQ==",
      "requires": {
        "is-number": "^7.0.0"
      }
    },
    "toidentifier": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/toidentifier/-/toidentifier-1.0.0.tgz",
      "integrity": "sha512-yaOH/Pk/VEhBWWTlhI+qXxDFXlejDGcQipMlyxda9nthulaxLZUNcUqFxokp0vcYnvteJln5FNQDRrxj3YcbVw=="
    },
    "touch": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/touch/-/touch-3.1.0.tgz",
      "integrity": "sha512-WBx8Uy5TLtOSRtIq+M03/sKDrXCLHxwDcquSP2c43Le03/9serjQBIztjRz6FkJez9D/hleyAXTBGLwwZUw9lA==",
      "requires": {
        "nopt": "~1.0.10"
      },
      "dependencies": {
        "nopt": {
          "version": "1.0.10",
          "resolved": "https://registry.npmjs.org/nopt/-/nopt-1.0.10.tgz",
          "integrity": "sha1-bd0hvSoxQXuScn3Vhfim83YI6+4=",
          "requires": {
            "abbrev": "1"
          }
        }
      }
    },
    "tr46": {
      "version": "2.1.0",
      "resolved": "https://registry.npmjs.org/tr46/-/tr46-2.1.0.tgz",
      "integrity": "sha512-15Ih7phfcdP5YxqiB+iDtLoaTz4Nd35+IiAv0kQ5FNKHzXgdWqPoTIqEDDJmXceQt4JZk6lVPT8lnDlPpGDppw==",
      "requires": {
        "punycode": "^2.1.1"
      },
      "dependencies": {
        "punycode": {
          "version": "2.1.1",
          "resolved": "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz",
          "integrity": "sha512-XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A=="
        }
      }
    },
    "type-fest": {
      "version": "0.20.2",
      "resolved": "https://registry.npmjs.org/type-fest/-/type-fest-0.20.2.tgz",
      "integrity": "sha512-Ne+eE4r0/iWnpAxD852z3A+N0Bt5RN//NjJwRd2VFHEmrywxf5vsZlh4R6lixl6B+wz/8d+maTSAkN1FIkI3LQ=="
    },
    "type-is": {
      "version": "1.6.18",
      "resolved": "https://registry.npmjs.org/type-is/-/type-is-1.6.18.tgz",
      "integrity": "sha512-TkRKr9sUTxEH8MdfuCSP7VizJyzRNMjj2J2do2Jr3Kym598JVdEksuzPQCnlFPW4ky9Q+iA+ma9BGm06XQBy8g==",
      "requires": {
        "media-typer": "0.3.0",
        "mime-types": "~2.1.24"
      }
    },
    "typedarray": {
      "version": "0.0.6",
      "resolved": "https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz",
      "integrity": "sha1-hnrHTjhkGHsdPUfZlqeOxciDB3c="
    },
    "typedarray-to-buffer": {
      "version": "3.1.5",
      "resolved": "https://registry.npmjs.org/typedarray-to-buffer/-/typedarray-to-buffer-3.1.5.tgz",
      "integrity": "sha512-zdu8XMNEDepKKR+XYOXAVPtWui0ly0NtohUscw+UmaHiAWT8hrV1rr//H6V+0DvJ3OQ19S979M0laLfX8rm82Q==",
      "requires": {
        "is-typedarray": "^1.0.0"
      }
    },
    "uglify-js": {
      "version": "2.8.29",
      "resolved": "https://registry.npmjs.org/uglify-js/-/uglify-js-2.8.29.tgz",
      "integrity": "sha1-KcVzMUgFe7Th913zW3qcty5qWd0=",
      "requires": {
        "source-map": "~0.5.1",
        "uglify-to-browserify": "~1.0.0",
        "yargs": "~3.10.0"
      }
    },
    "uglify-to-browserify": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/uglify-to-browserify/-/uglify-to-browserify-1.0.2.tgz",
      "integrity": "sha1-bgkk1r2mta/jSeOabWMoUKD4grc=",
      "optional": true
    },
    "uid-safe": {
      "version": "2.1.5",
      "resolved": "https://registry.npmjs.org/uid-safe/-/uid-safe-2.1.5.tgz",
      "integrity": "sha512-KPHm4VL5dDXKz01UuEd88Df+KzynaohSL9fBh096KWAxSKZQDI2uBrVqtvRM4rwrIrRRKsdLNML/lnaaVSRioA==",
      "requires": {
        "random-bytes": "~1.0.0"
      }
    },
    "ultron": {
      "version": "1.1.1",
      "resolved": "https://registry.npmjs.org/ultron/-/ultron-1.1.1.tgz",
      "integrity": "sha512-UIEXBNeYmKptWH6z8ZnqTeS8fV74zG0/eRU9VGkpzz+LIJNs8W/zM/L+7ctCkRrgbNnnR0xxw4bKOr0cW0N0Og==",
      "dev": true
    },
    "unbox-primitive": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/unbox-primitive/-/unbox-primitive-1.0.1.tgz",
      "integrity": "sha512-tZU/3NqK3dA5gpE1KtyiJUrEB0lxnGkMFHptJ7q6ewdZ8s12QrODwNbhIJStmJkd1QDXa1NRA8aF2A1zk/Ypyw==",
      "requires": {
        "function-bind": "^1.1.1",
        "has-bigints": "^1.0.1",
        "has-symbols": "^1.0.2",
        "which-boxed-primitive": "^1.0.2"
      }
    },
    "unc-path-regex": {
      "version": "0.1.2",
      "resolved": "https://registry.npmjs.org/unc-path-regex/-/unc-path-regex-0.1.2.tgz",
      "integrity": "sha1-5z3T17DXxe2G+6xrCufYxqadUPo="
    },
    "undefsafe": {
      "version": "2.0.5",
      "resolved": "https://registry.npmjs.org/undefsafe/-/undefsafe-2.0.5.tgz",
      "integrity": "sha512-WxONCrssBM8TSPRqN5EmsjVrsv4A8X12J4ArBiiayv3DyyG3ZlIg6yysuuSYdZsVz3TKcTg2fd//Ujd4CHV1iA=="
    },
    "underscore.string": {
      "version": "3.3.5",
      "resolved": "https://registry.npmjs.org/underscore.string/-/underscore.string-3.3.5.tgz",
      "integrity": "sha512-g+dpmgn+XBneLmXXo+sGlW5xQEt4ErkS3mgeN2GFbremYeMBSJKr9Wf2KJplQVaiPY/f7FN6atosWYNm9ovrYg==",
      "dev": true,
      "requires": {
        "sprintf-js": "^1.0.3",
        "util-deprecate": "^1.0.2"
      }
    },
    "union-value": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/union-value/-/union-value-1.0.1.tgz",
      "integrity": "sha512-tJfXmxMeWYnczCVs7XAEvIV7ieppALdyepWMkHkwciRpZraG/xwT+s2JN8+pr1+8jCRf80FFzvr+MpQeeoF4Xg==",
      "dev": true,
      "requires": {
        "arr-union": "^3.1.0",
        "get-value": "^2.0.6",
        "is-extendable": "^0.1.1",
        "set-value": "^2.0.1"
      }
    },
    "unique-string": {
      "version": "2.0.0",
      "resolved": "https://registry.npmjs.org/unique-string/-/unique-string-2.0.0.tgz",
      "integrity": "sha512-uNaeirEPvpZWSgzwsPGtU2zVSTrn/8L5q/IexZmH0eH6SA73CmAA5U4GwORTxQAZs95TAXLNqeLoPPNO5gZfWg==",
      "requires": {
        "crypto-random-string": "^2.0.0"
      }
    },
    "unpipe": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz",
      "integrity": "sha1-sr9O6FFKrmFltIF4KdIbLvSZBOw="
    },
    "unset-value": {
      "version": "1.0.0",
      "resolved": "https://registry.npmjs.org/unset-value/-/unset-value-1.0.0.tgz",
      "integrity": "sha1-g3aHP30jNRef+x5vw6jtDfyKtVk=",
      "dev": true,
      "requires": {
        "has-value": "^0.3.1",
        "isobject": "^3.0.0"
      },
      "dependencies": {
        "has-value": {
          "version": "0.3.1",
          "resolved": "https://registry.npmjs.org/has-value/-/has-value-0.3.1.tgz",
          "integrity": "sha1-ex9YutpiyoJ+wKIHgCVlSEWZXh8=",
          "dev": true,
          "requires": {
            "get-value": "^2.0.3",
            "has-values": "^0.1.4",
            "isobject": "^2.0.0"
          },
          "dependencies": {
            "isobject": {
              "version": "2.1.0",
              "resolved": "https://registry.npmjs.org/isobject/-/isobject-2.1.0.tgz",
              "integrity": "sha1-8GVWEJaj8dou9GJy+BXIQNh+DIk=",
              "dev": true,
              "requires": {
                "isarray": "1.0.0"
              }
            }
          }
        },
        "has-values": {
          "version": "0.1.4",
          "resolved": "https://registry.npmjs.org/has-values/-/has-values-0.1.4.tgz",
          "integrity": "sha1-bWHeldkd/Km5oCCJrThL/49it3E=",
          "dev": true
        }
      }
    },
    "unzip-response": {
      "version": "2.0.1",
      "resolved": "https://registry.npmjs.org/unzip-response/-/unzip-response-2.0.1.tgz",
      "integrity": "sha1-0vD3N9FrBhXnKmk17QQhRXLVb5c=",
      "dev": true
    },
    "upath": {
      "version": "1.2.0",
      "resolved": "https://registry.npmjs.org/upath/-/upath-1.2.0.tgz",
      "integrity": "sha512-aZwGpamFO61g3OlfT7OQCHqhGnW43ieH9WZeP7QxN/G/jS4jfqUkZxoryvJgVPEcrl5NL/ggHsSmLMHuH64Lhg==",
      "dev": true
    },
    "update-notifier": {
      "version": "5.1.0",
      "resolved": "https://registry.npmjs.org/update-notifier/-/update-notifier-5.1.0.tgz",
      "integrity": "sha512-ItnICHbeMh9GqUy31hFPrD1kcuZ3rpxDZbf4KUDavXwS0bW5m7SLbDQpGX3UYr072cbrF5hFUs3r5tUsPwjfHw==",
      "requires": {
        "boxen": "^5.0.0",
        "chalk": "^4.1.0",
        "configstore": "^5.0.1",
        "has-yarn": "^2.1.0",
        "import-lazy": "^2.1.0",
        "is-ci": "^2.0.0",
        "is-installed-globally": "^0.4.0",
        "is-npm": "^5.0.0",
        "is-yarn-global": "^0.3.0",
        "latest-version": "^5.1.0",
        "pupa": "^2.1.1",
        "semver": "^7.3.4",
        "semver-diff": "^3.1.1",
        "xdg-basedir": "^4.0.0"
      },
      "dependencies": {
        "lru-cache": {
          "version": "6.0.0",
          "resolved": "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz",
          "integrity": "sha512-Jo6dJ04CmSjuznwJSS3pUeWmd/H0ffTlkXXgwZi+eq1UCmqQwCh+eLsYOYCwY991i2Fah4h1BEMCx4qThGbsiA==",
          "requires": {
            "yallist": "^4.0.0"
          }
        },
        "semver": {
          "version": "7.3.5",
          "resolved": "https://registry.npmjs.org/semver/-/semver-7.3.5.tgz",
          "integrity": "sha512-PoeGJYh8HK4BTO/a9Tf6ZG3veo/A7ZVsYrSA6J8ny9nb3B1VrpkuN+z9OE5wfE5p6H4LchYZsegiQgbJD94ZFQ==",
          "requires": {
            "lru-cache": "^6.0.0"
          }
        },
        "yallist": {
          "version": "4.0.0",
          "resolved": "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz",
          "integrity": "sha512-3wdGidZyq5PB084XLES5TpOSRA3wjXAlIWMhum2kRcv/41Sn2emQ0dycQW4uZXLejwKvg6EsvbdlVL+FYEct7A=="
        }
      }
    },
    "uri-js": {
      "version": "4.4.1",
      "resolved": "https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz",
      "integrity": "sha512-7rKUyy33Q1yc98pQ1DAmLtwX109F7TIfWlW1Ydo8Wl1ii1SeHieeh0HHfPeL2fMXK6z0s8ecKs9frCuLJvndBg==",
      "requires": {
        "punycode": "^2.1.0"
      },
      "dependencies": {
        "punycode": {
          "version": "2.1.1",
          "resolved": "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz",
          "integrity": "sha512-XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A=="
        }
      }
    },
    "urix": {
      "version": "0.1.0",
      "resolved": "https://registry.npmjs.org/urix/-/urix-0.1.0.tgz",
      "integrity": "sha1-2pN/emLiH+wf0Y1Js1wpNQZ6bHI=",
      "dev": true
    },
    "url": {
      "version": "0.11.0",
      "resolved": "https://registry.npmjs.org/url/-/url-0.11.0.tgz",
      "integrity": "sha1-ODjpfPxgUh63PFJajlW/3Z4uKPE=",
      "dev": true,
      "requires": {
        "punycode": "1.3.2",
        "querystring": "0.2.0"
      }
    },
    "url-parse-lax": {
      "version": "3.0.0",
      "resolved": "https://registry.npmjs.org/url-parse-lax/-/url-parse-lax-3.0.0.tgz",
      "integrity": "sha1-FrXK/Afb42dsGxmZF3gj1lA6yww=",
      "requires": {
        "prepend-http": "^2.0.0"
      }
    },
    "use": {
      "version": "3.1.1",
      "resolved": "https://registry.npmjs.org/use/-/use-3.1.1.tgz",
      "integrity": "sha512-cwESVXlO3url9YWlFW/TA9cshCEhtu7IKJ/p5soJ/gGpj7vbvFrAY/eIioQ6Dw23KjZhYgiIo8HOs1nQ2vr/oQ==",
      "dev": true
    },
    "util": {
      "version": "0.12.4",
      "resolved": "https://registry.npmjs.org/util/-/util-0.12.4.tgz",
      "integrity": "sha512-bxZ9qtSlGUWSOy9Qa9Xgk11kSslpuZwaxCg4sNIDj6FLucDab2JxnHwyNTCpHMtK1MjoQiWQ6DiUMZYbSrO+Sw==",
      "requires": {
        "inherits": "^2.0.3",
        "is-arguments": "^1.0.4",
        "is-generator-function": "^1.0.7",
        "is-typed-array": "^1.1.3",
        "safe-buffer": "^5.1.2",
        "which-typed-array": "^1.1.2"
      }
    },
    "util-deprecate": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz",
      "integrity": "sha1-RQ1Nyfpw3nMnYvvS1KKJgUGaDM8="
    },
    "utila": {
      "version": "0.4.0",
      "resolved": "https://registry.npmjs.org/utila/-/utila-0.4.0.tgz",
      "integrity": "sha1-ihagXURWV6Oupe7MWxKk+lN5dyw="
    },
    "utils-extend": {
      "version": "1.0.8",
      "resolved": "https://registry.npmjs.org/utils-extend/-/utils-extend-1.0.8.tgz",
      "integrity": "sha1-zP17ZFQPjpDuIe7Fd2nQZRyril8="
    },
    "utils-merge": {
      "version": "1.0.1",
      "resolved": "https://registry.npmjs.org/utils-merge/-/utils-merge-1.0.1.tgz",
      "integrity": "sha1-n5VxD1CiZ5R7LMwSR0HBAoQn5xM="
    },
    "v8flags": {
      "version": "3.2.0",
      "resolved": "https://registry.npmjs.org/v8flags/-/v8flags-3.2.0.tgz",
      "integrity": "sha512-mH8etigqMfiGWdeXpaaqGfs6BndypxusHHcv2qSHyZkGEznCd/qAXCWWRzeowtL54147cktFOC4P5y+kl8d8Jg==",
      "requires": {
        "homedir-polyfill": "^1.0.1"
      }
    },
    "vary": {
      "version": "1.1.2",
      "resolved": "https://registry.npmjs.org/vary/-/vary-1.1.2.tgz",
      "integrity": "sha1-IpnwLG3tMNSllhsLn3RSShj2NPw="
    },
    "webidl-conversions": {
      "version": "6.1.0",
      "resolved": "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-6.1.0.tgz",
      "integrity": "sha512-qBIvFLGiBpLjfwmYAaHPXsn+ho5xZnGvyGvsarywGNc8VyQJUMHJ8OBKGGrPER0okBeMDaan4mNBlgBROxuI8w=="
    },
    "websocket-driver": {
      "version": "0.7.4",
      "resolved": "https://registry.npmjs.org/websocket-driver/-/websocket-driver-0.7.4.tgz",
      "integrity": "sha512-b17KeDIQVjvb0ssuSDF2cYXSg2iztliJ4B9WdsuB6J952qCPKmnVq4DyW5motImXHDC1cBT/1UezrJVsKw5zjg==",
      "dev": true,
      "requires": {
        "http-parser-js": ">=0.5.1",
        "safe-buffer": ">=5.1.0",
        "websocket-extensions": ">=0.1.1"
      }
    },
    "websocket-extensions": {
      "version": "0.1.4",
      "resolved": "https://registry.npmjs.org/websocket-extensions/-/websocket-extensions-0.1.4.tgz",
      "integrity": "sha512-OqedPIGOfsDlo31UNwYbCFMSaO9m9G/0faIHj5/dZFDMFqPTcx6UwqyOy3COEaEOg/9VsGIpdqn62W5KhoKSpg==",
      "dev": true
    },
    "websocket-stream": {
      "version": "5.5.2",
      "resolved": "https://registry.npmjs.org/websocket-stream/-/websocket-stream-5.5.2.tgz",
      "integrity": "sha512-8z49MKIHbGk3C4HtuHWDtYX8mYej1wWabjthC/RupM9ngeukU4IWoM46dgth1UOS/T4/IqgEdCDJuMe2039OQQ==",
      "dev": true,
      "requires": {
        "duplexify": "^3.5.1",
        "inherits": "^2.0.1",
        "readable-stream": "^2.3.3",
        "safe-buffer": "^5.1.2",
        "ws": "^3.2.0",
        "xtend": "^4.0.0"
      }
    },
    "whatwg-url": {
      "version": "9.1.0",
      "resolved": "https://registry.npmjs.org/whatwg-url/-/whatwg-url-9.1.0.tgz",
      "integrity": "sha512-CQ0UcrPHyomtlOCot1TL77WyMIm/bCwrJ2D6AOKGwEczU9EpyoqAokfqrf/MioU9kHcMsmJZcg1egXix2KYEsA==",
      "requires": {
        "tr46": "^2.1.0",
        "webidl-conversions": "^6.1.0"
      }
    },
    "which": {
      "version": "1.3.1",
      "resolved": "https://registry.npmjs.org/which/-/which-1.3.1.tgz",
      "integrity": "sha512-HxJdYWq1MTIQbJ3nw0cqssHoTNU267KlrDuGZ1WYlxDStUtKUhOaJmh112/TZmHxxUfuJqPXSOm7tDyas0OSIQ==",
      "requires": {
        "isexe": "^2.0.0"
      }
    },
    "which-boxed-primitive": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz",
      "integrity": "sha512-bwZdv0AKLpplFY2KZRX6TvyuN7ojjr7lwkg6ml0roIy9YeuSr7JS372qlNW18UQYzgYK9ziGcerWqZOmEn9VNg==",
      "requires": {
        "is-bigint": "^1.0.1",
        "is-boolean-object": "^1.1.0",
        "is-number-object": "^1.0.4",
        "is-string": "^1.0.5",
        "is-symbol": "^1.0.3"
      }
    },
    "which-typed-array": {
      "version": "1.1.7",
      "resolved": "https://registry.npmjs.org/which-typed-array/-/which-typed-array-1.1.7.tgz",
      "integrity": "sha512-vjxaB4nfDqwKI0ws7wZpxIlde1XrLX5uB0ZjpfshgmapJMD7jJWhZI+yToJTqaFByF0eNBcYxbjmCzoRP7CfEw==",
      "requires": {
        "available-typed-arrays": "^1.0.5",
        "call-bind": "^1.0.2",
        "es-abstract": "^1.18.5",
        "foreach": "^2.0.5",
        "has-tostringtag": "^1.0.0",
        "is-typed-array": "^1.1.7"
      }
    },
    "widest-line": {
      "version": "3.1.0",
      "resolved": "https://registry.npmjs.org/widest-line/-/widest-line-3.1.0.tgz",
      "integrity": "sha512-NsmoXalsWVDMGupxZ5R08ka9flZjjiLvHVAWYOKtiKM8ujtZWr9cRffak+uSE48+Ob8ObalXpwyeUiyDD6QFgg==",
      "requires": {
        "string-width": "^4.0.0"
      }
    },
    "window-size": {
      "version": "0.1.0",
      "resolved": "https://registry.npmjs.org/window-size/-/window-size-0.1.0.tgz",
      "integrity": "sha1-VDjNLqk7IC76Ohn+iIeu58lPnJ0="
    },
    "wordwrap": {
      "version": "0.0.2",
      "resolved": "https://registry.npmjs.org/wordwrap/-/wordwrap-0.0.2.tgz",
      "integrity": "sha1-t5Zpu0LstAn4PVg8rVLKF+qhZD8="
    },
    "wrap-ansi": {
      "version": "7.0.0",
      "resolved": "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz",
      "integrity": "sha512-YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==",
      "requires": {
        "ansi-styles": "^4.0.0",
        "string-width": "^4.1.0",
        "strip-ansi": "^6.0.0"
      }
    },
    "wrappy": {
      "version": "1.0.2",
      "resolved": "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz",
      "integrity": "sha1-tSQ9jz7BqjXxNkYFvA0QNuMKtp8="
    },
    "write-file-atomic": {
      "version": "3.0.3",
      "resolved": "https://registry.npmjs.org/write-file-atomic/-/write-file-atomic-3.0.3.tgz",
      "integrity": "sha512-AvHcyZ5JnSfq3ioSyjrBkH9yW4m7Ayk8/9My/DD9onKeu/94fwrMocemO2QAJFAlnnDN+ZDS+ZjAR5ua1/PV/Q==",
      "requires": {
        "imurmurhash": "^0.1.4",
        "is-typedarray": "^1.0.0",
        "signal-exit": "^3.0.2",
        "typedarray-to-buffer": "^3.1.5"
      }
    },
    "ws": {
      "version": "3.3.3",
      "resolved": "https://registry.npmjs.org/ws/-/ws-3.3.3.tgz",
      "integrity": "sha512-nnWLa/NwZSt4KQJu51MYlCcSQ5g7INpOrOMt4XV8j4dqTXdmlUmSHQ8/oLC069ckre0fRsgfvsKwbTdtKLCDkA==",
      "dev": true,
      "requires": {
        "async-limiter": "~1.0.0",
        "safe-buffer": "~5.1.0",
        "ultron": "~1.1.0"
      }
    },
    "xdg-basedir": {
      "version": "4.0.0",
      "resolved": "https://registry.npmjs.org/xdg-basedir/-/xdg-basedir-4.0.0.tgz",
      "integrity": "sha512-PSNhEJDejZYV7h50BohL09Er9VaIefr2LMAf3OEmpCkjOi34eYyQYAXUTjEQtZJTKcF0E2UKTh+osDLsgNim9Q=="
    },
    "xtend": {
      "version": "4.0.2",
      "resolved": "https://registry.npmjs.org/xtend/-/xtend-4.0.2.tgz",
      "integrity": "sha512-LKYU1iAXJXUgAXn9URjiu+MWhyUXHsvfp7mcuYm9dSUKK0/CjtrUwFAxD82/mCWbtLsGjFIad0wIsod4zrTAEQ=="
    },
    "yallist": {
      "version": "2.1.2",
      "resolved": "https://registry.npmjs.org/yallist/-/yallist-2.1.2.tgz",
      "integrity": "sha1-HBH5IY8HYImkfdUS+TxmmaaoHVI="
    },
    "yargs": {
      "version": "3.10.0",
      "resolved": "https://registry.npmjs.org/yargs/-/yargs-3.10.0.tgz",
      "integrity": "sha1-9+572FfdfB0tOMDnTvvWgdFDH9E=",
      "requires": {
        "camelcase": "^1.0.2",
        "cliui": "^2.1.0",
        "decamelize": "^1.0.0",
        "window-size": "0.1.0"
      },
      "dependencies": {
        "camelcase": {
          "version": "1.2.1",
          "resolved": "https://registry.npmjs.org/camelcase/-/camelcase-1.2.1.tgz",
          "integrity": "sha1-m7UwTS4LVmmLLHWLCKPqqdqlijk="
        }
      }
    }
  }
}

============================================================


============================================================
path : __home__sea__nodeapp_test__
============================================================
============================================================
id: 11
============================================================
file: package.json
============================================================
content: {
  "name": "nodeapp",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www",
    "live": "nodemon app.js"
  },
  "dependencies": {
    "beautify": "^0.0.8",
    "body-parser": "^1.19.0",
    "cookie-parser": "^1.4.5",
    "debug": "^2.6.9",
    "decode-html": "^2.0.0",
    "ejs": "~2.6.1",
    "express": "~4.16.1",
    "express-prettier": "^1.0.3",
    "express-session": "^1.17.2",
    "fs": "0.0.1-security",
    "grunt-cli": "^1.4.3",
    "highlight.js": "^11.2.0",
    "html-prettier": "0.0.5",
    "http-errors": "~1.6.3",
    "indent.js": "^0.3.5",
    "mongoose": "^6.0.8",
    "morgan": "~1.9.1",
    "multer": "^1.4.3",
    "mysql": "^2.18.1",
    "nl2br": "0.0.3",
    "nodemailer": "^6.6.5",
    "nodemon": "^2.0.13",
    "prettier": "^2.4.1",
    "pretty-error": "^3.0.4",
    "sql-formatter": "^4.0.2",
    "table": "^6.7.2",
    "util": "^0.12.4"
  },
  "devDependencies": {
    "-": "0.0.1",
    "grunt": "^1.4.1",
    "grunt-contrib-connect": "^3.0.0",
    "grunt-contrib-watch": "^1.1.0",
    "grunt-nodemon": "^0.4.2",
    "grunt-prettify": "^0.4.0",
    "posthtml": "^0.16.5",
    "reserved": "^0.1.2"
  }
}

============================================================


