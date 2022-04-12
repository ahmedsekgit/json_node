var js = require('./js_arr_objs.js');
var jsf = require('./js_files.js');
var config = require('./../config');
const fs = require('fs');

var FileName = config.JSON_PATH;

module.exports = {
    editData:function(editId)
    {
        var record = {};
        try 
        {   
            myArray = jsf.ArrObjFromFile(FileName);
            if(js.ArrHasObj(myArray,"id",editId))
            {   
                record = js.readByKey(myArray,"id",editId);
                
            } 
            
            //throw 'Break';

        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }
        return record;
    },
    updateData:function(inputData, updateId)
    {
      var resArray =[]  ;
      
        try 
        {   
            myArray = jsf.ArrObjFromFile(FileName);
            if(js.ArrHasObj(myArray,"id",updateId))
            {
                resArray = js.ObjByObjArrObj(myArray,"id",updateId, inputData);

            } 
            
            //throw 'Break';

        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }
        var record = js.readByKey(resArray,"id",updateId);

        jsf.ArrObjToFile(FileName, resArray);
        // File destination.txt will be created or overwritten by default.
        var dest_copy = FileName.replace(/\.json/gi, "_JSON_BKP\.json");
        fs.copyFile(FileName, dest_copy, (err) => {
          if (err) throw err;
          console.log(dest_copy + ' was updated');
        });

      return resArray;

    },

}