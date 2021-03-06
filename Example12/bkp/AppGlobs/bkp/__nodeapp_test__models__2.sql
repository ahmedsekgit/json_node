============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 1
============================================================
file: create-model.js
============================================================
content: var db = require('../database');
var config = require('./../config');
module.exports = {
    createData: function(inputData, callback) {
        var sql = `INSERT INTO ${config.database.db}.${config.database.table} SET ?`;
        db.query(sql, inputData, function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 2
============================================================
file: crud-model.js
============================================================
content: module.exports = {


    createCrud: function() {
        data = "Form data was inserted";
        return data;
    },
    fetchCrud: function() {
        data = "data was fetched";
        return data;
    },
    editCrud: function(editData) {
        data = "Data is edited by id: " + editData;
        return data;
    },
    UpdateCrud: function(updateId) {
        data = "Data was updated by id: " + updateId;
        return data;
    },
    deleteCrud: function(deleteId) {
        data = "Data was deleted by id: " + deleteId;
        return data;
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 3
============================================================
file: crud_mongo_model.js
============================================================
content: var mongoose = require('mongoose');
var db = require('../database_mongodb');

// create an schema
var userSchema = new mongoose.Schema({
    fullName: String,
    emailAddress: String,
    city: String,
    country: String
});

var schema = new mongoose.Schema(userSchema);

try {
    if (mongoose.model('users')) {
        var userTable = mongoose.model('users');
    }
} catch (e) {
    if (e.name === 'MissingSchemaError') {

        var userTable = mongoose.model('users', schema);
    }
}

module.exports = {
    createData: function(inputData, callback) {

        userData = new userTable(inputData);
        userData.save(function(err, data) {
            if (err) throw err;
            return callback(data);
        })

    },
    fetchData: function(callback) {
        var userData = userTable.find({});
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        })

    },
    editData: function(editId, callback) {
        var userData = userTable.findById(editId);
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        })
    },
    updateData: function(inputData, editId, callback) {

        userData = userTable.findByIdAndUpdate(editId, inputData);
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        })
    },
    deleteData: function(deleteId, callback) {

        userData = userTable.findByIdAndDelete(deleteId);
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        })
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 4
============================================================
file: delete-model.js
============================================================
content: var db = require('../database');
var config = require('./../config');
var  chalk  = require('chalk');
const log = console.log;

module.exports = {
    deleteData: function(deleteId, callback) {

       log(chalk.yellow('delete-model deleteData this Id is a deleted id :', deleteId)); 

        var sql = `DELETE FROM ${config.database.db}.${config.database.table} WHERE id = ?`;
        db.query(sql, [deleteId], function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 5
============================================================
file: fetch-model.js
============================================================
content: var mongoose = require('mongoose');
var db = require('../database_mongodb');
// create an schema
var userSchema = new mongoose.Schema({
    full_name: String,
    email_address: String,
    city: String,
    country: String
});
var schema = new mongoose.Schema(userSchema);

try {
    if (mongoose.model('users')) {
        var userTable_fetch = mongoose.model('users');
    }
} catch (e) {
    if (e.name === 'MissingSchemaError') {

        var userTable_fetch = mongoose.model('users', schema);
    }
}

module.exports = {

    fetchData: function(callback) {
        var userData = userTable_fetch.find({});
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        });

    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 6
============================================================
file: file-model.js
============================================================
content: var db = require('../database');
var config = require('./../config');
var  chalk  = require('chalk');
const log = console.log;

function storeData(data) {
    var sql = `insert into ${config.database.db}.${config.database.table}(title,description) values ('` + data.title + "','" + data.description + "');";
    return db.query(sql, (err, result) => {
        if (err) throw err;
        if (result) {
            console.log(data.title + "-" + data.description + "-" + data.id);
        }
        return result.insertId;
    });

}

function updateData(data) {
    var sql = `update ${config.database.db}.${config.database.table} set ${config.database.db}.${config.database.table}.title='` + data.title + `', ${config.database.db}.${config.database.table}.description = '` + data.description + `' where ${config.database.db}.${config.database.table}.id = ` + data.id + ";";
    return db.query(sql, function(err, result) {
        if (err) throw err;
        if (result) {
            data.id = result.insertId;
            console.log(data.title + "-" + data.description + "-" + data.id);

        }
        return result.changedRows;
    });
}


module.exports = {
    readData: function(callback) {
        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    },
    storeData: function(inputData, callback) {
        console.log('inputData');
        
        log(chalk.yellow('file-model storeData inputData :'));
        log(chalk.yellow(inputData));

        var sql = `INSERT INTO ${config.database.db}.${config.database.table} SET ?`;
        db.query(sql, inputData, function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 7
============================================================
file: image-model.js
============================================================
content: var db = require('../database');

module.exports = {
    storeImage: function(inputValues, callback) {

        // check unique email address
        var sql = 'SELECT * FROM images WHERE image_name =?';
        db.query(sql, inputValues.image_name, function(err, data, fields) {
            if (err) throw err
            if (data.length > 1) {
                var msg = inputValues.image_name + " is already exist";
            } else {
                // save users data into database
                var sql = 'INSERT INTO images SET ?';
                db.query(sql, inputValues, function(err, data) {
                    if (err) throw err;
                });
                var msg = inputValues.image_name + "is uploaded successfully";
            }
            return callback(msg)
        })
    },
    displayImage: function(callback) {
        // check unique email address
        var sql = 'SELECT image_name FROM images';
        db.query(sql, function(err, data, fields) {
            if (err) throw err
            return callback(data);
        })
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 8
============================================================
file: link-model.js
============================================================
content: var db = require('../database');
var mysql = require('mysql');
var config = require('./../config');
var  chalk  = require('chalk');
const log = console.log;

module.exports = {
    showData: function(showId, callback) {

        var sql = `SELECT * FROM ${config.database.db}.${config.database.table} WHERE id=${showId}`;
        db.query(sql, function(err, data) {
            if (err) throw err;
            return callback(data[0]);
        });
    },
    search_term_Data: function(inputData, callback) {
        var search_term = inputData.search_term;
        var search_keyword = inputData.search_keyword;
        var rendu_nbr = inputData.rendu_nbr;

        //var sql = "SELECT * FROM search WHERE title LIKE '%"+ mysql.escape(search_keyword) +
        //"%' and description LIKE '%"+ mysql.escape(search_term) + "%' ";
        if (typeof search_keyword !== 'undefined' && search_keyword !== "" && search_keyword !== null) {
            var search_key = search_keyword.trim();
            //var search_key=$("#search_keyword").val();
            //var search_terms = search_key.split( /,\s*/ );

            var search_terms = search_key.split(/ \s*/);

            //remove repeated values
            var uniq_search_terms = [...new Set(search_terms)];
            //convert array to string  replace commas by spaces  
            uniq_search_terms = uniq_search_terms.join(" ");

            var search_default = [search_term.trim(), uniq_search_terms].join(" ");

        } else {
            var search_default = search_term;
        }

        var search_default = search_default.trim();
        var keywords_vals = search_default;


        /*constructing sql search request*/
        var search_terms = search_default.split(/ \s*/);

        let sLen = search_terms.length;


        var txt_sql = "";
        var parts = [];

        txt_sql = `SELECT ${config.database.db}.${config.database.table}.id, 
                            ${config.database.db}.${config.database.table}.title, 
                            ${config.database.db}.${config.database.table}.description, 
                            ${config.database.db}.${config.database.table}.link, 
                            ${config.database.db}.${config.database.table}.reg_date, (`;

        for (let i = 0; i < sLen; i++) {
            let keyword = search_terms[i].trim();
            parts.push('( LOWER( title )   LIKE \"%' + keyword + '%\")');
            parts.push('( LOWER( description )   LIKE \"%' + keyword + '%\")');

        }

        //convert array to string  replace commas by spaces  

        let constructed_str = parts.join(" + ");
        txt_sql += constructed_str;
        txt_sql += `) AS best_match FROM ${config.database.db}.${config.database.table} 
                    HAVING best_match >= 1 ORDER BY best_match DESC`;

        txt_sql += " LIMIT " + rendu_nbr + "";
         log(chalk.yellow("txt_sql link-model search_term_Data"));
         log(chalk.yellow(txt_sql));
        /* var sql = 'SELECT * FROM search WHERE title LIKE \"%'+search_keyword+
         '%\" and description LIKE \"%'+search_term+ '%\"';*/

        db.query(txt_sql, function(err, data, fields) {
            if (err) throw err;
            data["keywords_vals"] = keywords_vals;

            return callback(data);
        });
    },/*end of search_term data*/
    
    showLinksList: function(callback) {

        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 9
============================================================
file: read-model.js
============================================================
content: var db = require('../database');
var config = require('./../config');

module.exports = {
    readData: function(callback) {
        var sql = `SELECT * FROM ${config.database.db}.${config.database.table}`;
        db.query(sql, function(err, data, fields) {
            if (err) throw err;
            return callback(data);
        });
    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 10
============================================================
file: search-model.js
============================================================
content: var db = require('../database');
var mysql = require('mysql');
var config = require('./../config');
var  chalk  = require('chalk');
const log = console.log;

module.exports = {

    search_term_Data: function(inputData, callback) {
        var search_term = inputData.search_term;
        var search_keyword = inputData.search_keyword;
        var rendu_nbr = inputData.rendu_nbr;

        //var sql = "SELECT * FROM search WHERE title LIKE '%"+ mysql.escape(search_keyword) +
        //"%' and description LIKE '%"+ mysql.escape(search_term) + "%' ";
        if (typeof search_keyword !== 'undefined' && search_keyword !== "" && search_keyword !== null) {
            var search_key = search_keyword.trim();
            //var search_key=$("#search_keyword").val();
            //var search_terms = search_key.split( /,\s*/ );

            var search_terms = search_key.split(/ \s*/);

            //remove repeated values
            var uniq_search_terms = [...new Set(search_terms)];
            //convert array to string  replace commas by spaces  
            uniq_search_terms = uniq_search_terms.join(" ");

            var search_default = [search_term.trim(), uniq_search_terms].join(" ");

        } else {
            var search_default = search_term;
        }

        var search_default = search_default.trim();
        var keywords_vals = search_default;

        /*constructing sql search request*/
        var search_terms = search_default.split(/ \s*/);

        let sLen = search_terms.length;

        var txt_sql = "";
        var parts = [];

        txt_sql = `SELECT ${config.database.db}.${config.database.table}.id, 
                            ${config.database.db}.${config.database.table}.title, 
                            ${config.database.db}.${config.database.table}.description, 
                            ${config.database.db}.${config.database.table}.link, 
                            ${config.database.db}.${config.database.table}.reg_date, (`;

        for (let i = 0; i < sLen; i++) {
            let keyword = search_terms[i].trim();
            parts.push('( LOWER( title )   LIKE \"%' + keyword + '%\")');
            parts.push('( LOWER( description )   LIKE \"%' + keyword + '%\")');
        }

        //convert array to string  replace commas by spaces  

        let constructed_str = parts.join(" + ");
        txt_sql += constructed_str;
        txt_sql += `) AS best_match FROM ${config.database.db}.${config.database.table} 
                        HAVING best_match >= 1 ORDER BY best_match DESC`;

        txt_sql += " LIMIT " + rendu_nbr + "";

        /* var sql = 'SELECT * FROM search WHERE title LIKE \"%'+search_keyword+
         '%\" and description LIKE \"%'+search_term+ '%\"';*/
         log(chalk.yellow("txt_sql search-model search_term_Data"));
         log(chalk.yellow(txt_sql));

        db.query(txt_sql, function(err, data, fields) {
            if (err) throw err;
            data["keywords_vals"] = keywords_vals;

            return callback(data);
        });
    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 11
============================================================
file: update-model.js
============================================================
content: var db = require('../database');
var config = require('./../config');
module.exports = {
    editData: function(editId, callback) {

        var sql = `SELECT * FROM ${config.database.db}.${config.database.table} WHERE id=${editId}`;
        db.query(sql, function(err, data) {
            if (err) throw err;
            return callback(data[0]);
        });
    },
    updateData: function(inputData, updateId, callback) {

        var sql = `UPDATE ${config.database.db}.${config.database.table} SET ? WHERE id= ?`;
        db.query(sql, [inputData, updateId], function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 12
============================================================
file: update-mongo-model.js
============================================================
content: var mongoose = require('mongoose');
var db = require('../database_mongodb');

// create an schema
var userSchema = new mongoose.Schema({
    fullName: String,
    emailAddress: String,
    city: String,
    country: String
});
var schema = new mongoose.Schema(userSchema);

try {
    if (mongoose.model('users')) {
        var userTable = mongoose.model('users');
    }
} catch (e) {
    if (e.name === 'MissingSchemaError') {

        var userTable = mongoose.model('users', schema);
    }
}

module.exports = {

    editData: function(editId, callback) {
        var userData = userTable.findById(editId);
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        })
    },
    updateData: function(inputData, editId, callback) {

        userData = userTable.findByIdAndUpdate(editId, inputData);
        userData.exec(function(err, data) {
            if (err) throw err;
            return callback(data);
        })
    }

}
============================================================


============================================================
path : __home__sea__nodeapp_test__models__
============================================================
============================================================
id: 13
============================================================
file: user-model.js
============================================================
content: var mongoose = require('mongoose');
var db = require('../database_mongodb');

// create an schema
var userSchema = new mongoose.Schema({
    full_name: String,
    email_address: String,
    city: String,
    country: String
});

try {
    if (mongoose.model('users')) return mongoose.model('users');
} catch (e) {
    if (e.name === 'MissingSchemaError') {
        var schema = new mongoose.Schema(userSchema);
        var userTable = mongoose.model('users', schema);
    }
}

module.exports = {
    createData: function(inputData, callback) {

        userData = new userTable(inputData);
        userData.save(function(err, data) {
            if (err) throw err;
            return callback(data);
        });
    }
}
============================================================


