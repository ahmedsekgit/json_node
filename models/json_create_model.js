var js = require('./js_arr_objs.js');
var jsf = require('./js_files.js');
var config = require('./../config');
const fs = require('fs');

var FileName = config.JSON_PATH;

var DefaultObjDefinition =
{
    "keyword": null,
    "link": null,
    title: '',
    description : '',
    reg_date: new Date().toISOString()
};

module.exports = {
    readData:function()
    {
        try 
        {
            myArray = jsf.ArrObjFromFile(FileName);
            //throw 'Break';

        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }
        return myArray ;

    },
    createData:function(inputData)
    {

        var arrResult = [];
        var resArray = [];
        try 
        {   
            myArray = jsf.ArrObjFromFile(FileName);
            var resObj = js.updateObjByObj(inputData, DefaultObjDefinition);
            /*in case inpudata contains an id field*/
            let bool_dup = js.arrObj_dupKey(myArray, resObj, "id");

            if(!bool_dup)
            {
                arrResult = js.add_obj_to_arr_node(myArray, resObj);
                var last_elem = arrResult["insertObj"];
                var resArray = arrResult["records"];
                jsf.ArrObjToFile(FileName, resArray);
                // File destination.txt will be created or overwritten by default.
                var dest_copy = FileName.replace(/\.json/gi, "_JSON_BKP\.json");
                fs.copyFile(FileName, dest_copy, (err) => {
                  if (err) throw err;
                  console.log(dest_copy + ' was updated');
                });
                return last_elem;
            }
            
            //throw 'Break';

        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }

    }
}