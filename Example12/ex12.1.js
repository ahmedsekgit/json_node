var fs = require('fs');
var path = require('path');
var util = require('util');

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

        file_to_raplace = file;
        /*file_to_raplace = file_to_raplace.replace(/_/g, " ");
        file_to_raplace = file_to_raplace.replace(/\.[^.]+$/, '');*/



        sample.push({
            id: i,
            title: file_to_raplace,
            description: file_content.toString()
        });
        i++;
    } /*end for parcour files*/
    return sample;
}

var Obj_paths = {
url_path_3_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example3/node_q_r',

url_path_4_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example4/js_tryit_w3s_q_r',
url_path_4_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example4/js_w3s_q_r',

url_path_5_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example5/node_express_q_r',
url_path_5_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example5/php_w3s_q_r',
url_path_5_3 : '/home/sea/programs/javascript/nodejs/Crawling/Example5/php_tryit_w3s_q_r',

url_path_6_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example6/jquery_w3s_q_r',
url_path_6_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example6/jquery_tryit_w3s_q_r',
url_path_6_3 : '/home/sea/programs/javascript/nodejs/Crawling/Example6/react_q_r',

url_path_7_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example7/sql_tryit_w3s_q_r',
url_path_7_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example7/sql_w3s_q_r',
url_path_7_3 : '/home/sea/programs/javascript/nodejs/Crawling/Example7/jquery_q_r',

url_path_8_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example8/bootstrap_w3s_q_r',
url_path_8_2 : '/home/sea/programs/javascript/nodejs/Crawling/Example8/bootstrap_tryit_w3s_q_r',

url_path_9_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example9/css_w3s_q_r',

url_path_10_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example10/java_w3s_q_r',

url_path_11_1 : '/home/sea/programs/javascript/nodejs/Crawling/Example11/python_w3s_q_r'
}

function checkAll()
{
    let arrOutput = [];
    

    let txt = "";
    for (let key in Obj_paths) 
    {
        txt += Obj_paths[key] + " ";
        let ret_obj = checkfiles(Obj_paths[key]);
        arrOutput.push(ret_obj);
        if(ret_obj.arrOutput.length>0)
        {
            console.dir(ret_obj.path);
            console.dir(ret_obj.Nb_Files);
            console.dir(ret_obj.arrOutput);
        }
    }
}

checkAll();
function checkfiles(path) {

    let url_path = path;
    var sample = readFiles(url_path);


    try {
        var arrOutput = [];
        if (sample.length != 0) {
            sample.forEach(function(sample_row_data) {

                let data = sample_row_data.description;

                if (data !== '' && typeof data !== undefined) {

                    data = data.split('\n');
                    if (data.length >= 0 && data.length <= 1) {
                        const inputData = {
                            id: sample_row_data.id,
                            title: sample_row_data.title,
                            description: sample_row_data.description
                        };
                        arrOutput.push(inputData);
                    }

                }
            });



        } else {
            console.log('No Data Found');
            console.dir(sample);
        }
    } catch (err) {

    }
             ret_obj = {
                            path: path,
                            Nb_Files: sample.length,
                            arrOutput : arrOutput
                        };

   
    return ret_obj;
} /*fin de la checkfiles*/