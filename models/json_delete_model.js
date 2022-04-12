var js = require('./js_arr_objs.js');
var jsf = require('./js_files.js');
var config = require('./../config');

var FileName = config.JSON_PATH;

module.exports = {

    deleteData:function(deleteId)
    {
      var resArray =[]  ;
      
        try 
        {   
            myArray = jsf.ArrObjFromFile(FileName);
            
            resArray = js.removeByKey(myArray,"id",deleteId);

            //throw 'Break';

        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }

        jsf.ArrObjToFile(FileName, resArray);
      return resArray;

    }

}