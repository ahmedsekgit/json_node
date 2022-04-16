==============================
javascript strings tips hints tricks  
==============================
if(typeof keyword !== 'undefined' && keyword !== "" && keyword !== null )
         { 
           var search_key = "";
           var search_key=$("#search_keyword").val();
           var search_terms = search_key.split( /,\s*/ ); // split la sting by ,
           //remove repeated values
           var uniq_search_terms = [...new Set(search_terms)]; // si la string est fire fire fire chrome ca devient fire chrome only
           //convert array to string  replace commas by spaces  
           uniq_search_terms = uniq_search_terms.join(" ");      
           var search_default  =  [search_term, uniq_search_terms].join(" "); // join 2 strings adding space between them (cast to arrays !!)
         }
         else
         {
            var search_default  = search_term;
         }  
==============================
45 at  2021-10-29T15:22:52.000Z
==============================
