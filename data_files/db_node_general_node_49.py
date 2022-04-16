==============================
jquery ui autocomplete avec ajax et multiple values   
==============================

function split( val ) 
{
	return val.split( /,\s*/ );
}
function extractLast( term ) 
{
	return split( term ).pop();
}

// Multiple select
 $( "#searchterm" ).autocomplete({
    source: function( request, response ) {
                
      var searchText = extractLast(request.term);
      $.ajax({
         url: "test_fetch_data.php",
         type: 'post',
         dataType: "json",
         data: {
           search: searchText
         },
         success: function( data ) {
           //alert("data");
           //alert(data);
           response( data );
         }
       });
    },
    select: function( event, ui ) {
        var terms = split( $('#multi_autocomplete').val() );
                
        terms.pop();
                
        terms.push( ui.item.label );
                
        terms.push( "" );
        $('#multi_autocomplete').val(terms.join( ", " ));

        // Id
        terms = split( $('#selectuser_ids').val() );
                
        terms.pop();
                
        terms.push( ui.item.value );
                
        terms.push( "" );
        $('#selectuser_ids').val(terms.join( ", " ));

        return false;
     }
           
 });
  
==============================
49 at  2021-10-29T15:22:52.000Z
==============================
