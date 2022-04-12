var db = require('../database');
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