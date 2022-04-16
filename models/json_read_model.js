const JsonSearch = require('search-array').default;
var js = require('./js_arr_objs.js');
var jsf = require('./js_files.js');
var config = require('./../config');

var FileName = config.JSON_PATH;

module.exports = {
    search_term_Data:function(inputData)
    {
        var search_term = inputData.search_term;
        var search_keyword = inputData.search_keyword;
        var rendu_nbr = inputData.rendu_nbr;

        if (typeof search_keyword !== 'undefined' 
                    && search_keyword !== "" 
                    && search_keyword !== null) 
        {
            var search_key = search_keyword.trim();

            var search_terms = search_key.split(/ \s*/);

            //remove repeated values
            var uniq_search_terms = [...new Set(search_terms)];

            uniq_search_terms = uniq_search_terms.join(" ");

            var search_default = [search_term.trim(), uniq_search_terms].join(" ");

        } 
        else 
        {
            var search_default = search_term;
        }

        var search_default = search_default.trim();
        var keywords_vals = search_default;


        /*constructing sql search request*/
        var search_terms = search_default.split(/ \s*/);

        let sLen = search_terms.length;

        objectArray = jsf.ArrObjFromFile(FileName);
        var arr_result = objectArray;
        for (var i = 0; i < search_terms.length; i++) 
        {
            var searcher = new JsonSearch(arr_result);
            var searched = search_terms[i];
            var foundObjects = searcher.query(searched);

            arr_result = foundObjects;
        }
        
        
        //console.log(foundObjects) // prints items with id 1 and 3
        arr_result['data'] = foundObjects;
        arr_result['keywords_vals'] = keywords_vals;
        return arr_result;
    },
    readData:function()
    {
        try 
        {
            console.log("message_var");
            console.dir(FileName);
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