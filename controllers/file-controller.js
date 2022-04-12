var fileModel = require('../models/file-model');
var beautify = require('beautify');
var fs = require('fs');
var path = require('path');
var decode = require('decode-html');
var nl2br = require('nl2br');
var util = require('util');
const querystring = require('querystring');
var chalk = require('chalk');
const log = console.log;

function encodeHash(text) {
    return encodeURIComponent(text.replace(/\u200B/g, "\u200B\u200B").replace(/#/g, "\u200Bꖛ").replace(/%/g, "\u200B℅"));
}

function decodeHash(text) {
    return text.replace(/(?:%[a-f0-9]+)+/gim, function(t) {
        try {
            return decodeURIComponent(t)
        } catch (ex) {
            return t
        }
    }).replace(/\u200B℅/g, "%").replace(/\u200Bꖛ/g, "#").replace(/\u200B\u200B/g, "\u200B");
}

function readFiles(path) {

    let url_path = path;
    const files = fs.readdirSync(url_path)

    var n = files.length;

    const sample = [];
    var i = 1;

    var data_content;

    for (const file of files) {

        const readFileLines = filename =>
            fs.readFileSync(filename)
            .toString('UTF8');

        file_content = readFileLines(url_path + '/' + file);
        file_content = file_content.substring(file.length, file_content.length);


        file_to_raplace = file.replace(/phptryit\.asp\?filename=try/g, "");

        file_to_raplace = file_to_raplace.replace(/tryit\.asp\?filename=try/g, "");

        file_to_raplace = file_to_raplace.replace(/tryjava\.asp\?filename=/g, " java ");

        file_to_raplace = file_to_raplace.replace(/trypython\.asp\?filename=/g, " python ");

        file_to_raplace = file_to_raplace.replace(/trysql\.asp\?filename=/g, "");

        file_to_raplace = file_to_raplace.replace(/trysql/g, " sql ");
        file_to_raplace = file_to_raplace.replace(/__code-examples__javascript__frameworks__/g, "");

        file_to_raplace = file_to_raplace.replace(/_/g, " ");
        file_to_raplace = file_to_raplace.replace(/\.[^.]+$/, '');
        file_to_raplace = decode(file_to_raplace);
        file_to_raplace = decodeHash(file_to_raplace);



        file_content = decode(file_content);
        file_content = decodeHash(file_content);

        /*file_content = decodeURIComponent(file_content);*/

        //file_content = querystring.decode(file_content); 

        // Non-XHTML Way
        //file_content = nl2br(file_content, false);

        /*
        file_content = file_content.replace(/s{2,}/g,' ').trim();
        file_content = file_content.replace(/\/\/+/gi,"$$");
        */
        /*CSS/JS/JSON/HTML/XML*/
        //file_content = beautify(file_content, {format: 'js'});

        sample.push({
            id: i,
            title: file_to_raplace,
            description: file_content.toString()
        });
        i++;
    } /*end for parcour files*/
    return sample;
}

module.exports = {

    readData: function(req, res) {
        if (req.session.loggedinUser) {
            fileModel.readData(function(data) {

                let url_path = './work_on_files/jquery_q_r';
                var sample = readFiles(url_path);

                res.render('files_list', {
                    fileData: sample
                });
            });
        } else {
            req.session.return_to = '/file/files';
            res.redirect('/login');
        }
    },
    checkData: function(req, res) {

        fileModel.readData(function(data) {
            res.render('files_list', {
                fileData: data
            });
        });

    },
    storeData: function(req, res) {
        if (req.session.loggedinUser) {
            let url_path = './work_on_files/jquery_q_r';
            var sample = readFiles(url_path);

            var unefois = 1;
            if (sample.length != 0) {
                sample.forEach(function(sample_row_data) {
                    const inputData = {
                        title: sample_row_data.title,
                        description: sample_row_data.description
                    };

                    fileModel.storeData(sample_row_data, function(returned_data) {
                        //console.log(returned_data.affectedRows + " record created");
                    });

                });
            } else {
                log(chalk.yellow('No Data Found'));
                log(chalk.yellow(console.dir(sample)));
            }
        } else {
            req.session.return_to = '/file/checkData';
            res.redirect('/login');
        }
    } /*fin de la storeData*/


} /*fin de l export*/