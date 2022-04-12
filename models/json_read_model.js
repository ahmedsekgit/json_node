var js = require('./js_arr_objs.js');
var jsf = require('./js_files.js');
var config = require('./../config');

var FileName = config.JSON_PATH;

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
    readDataId:function(id)
    {
      
        try 
        {   
            myArray = jsf.ArrObjFromFile(FileName);
            if(js.ArrHasObj(myArray,"id",id))
            {
                var record = js.readByKey(myArray,"id",id);
                return record;
            } 
            
            //throw 'Break';

        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }

    }
}