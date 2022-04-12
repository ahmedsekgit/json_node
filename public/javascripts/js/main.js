function copyToClipboard(element) {
  var $temp = $("<input>");
  $("body").append($temp);
  $temp.val($(element).text()).select();
  document.execCommand("copy");
  $temp.remove();
}

function pop_up(url){
window.open(url,'win2','status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=1076,height=768,directories=no,location=no') 
}

function split( val ) 
{
	return val.split( /,\s*/ );
}
function extractLast( term ) 
{
	return split( term ).pop();
}

function filterGlobal () {
	$('#my_table_sek').DataTable().search( 
		$('#global_filter').val(),
		$('#global_regex').prop('checked'), 
		$('#global_smart').prop('checked')
	).draw();
}

function filterColumn ( i ) {
	$('#my_table_sek').DataTable().column( i ).search( 
		$('#col'+i+'_filter').val(),
		$('#col'+i+'_regex').prop('checked'), 
		$('#col'+i+'_smart').prop('checked')
	).draw();
	
}

$( document ).ready(function() {
    console.log( "ready!" );

 //    //autocomplete
	// $(".auto").autocomplete({
	// 	source: "keyword_search.php",
	// 	minLength: 0
	// });		
	
    $( document ).tooltip({
      track: true
    });

    //pour datatables
    var lastIdx = null;

	$('#my_table_sek tbody')
		.on( 'mouseover', 'td', function () {
			var colIdx = table.cell(this).index().column;

			if ( colIdx !== lastIdx ) {
				$( table.cells().nodes() ).removeClass( 'highlight' );
				$( table.column( colIdx ).nodes() ).addClass( 'highlight' );
			}
		} )
		.on( 'mouseleave', function () {
			$( table.cells().nodes() ).removeClass( 'highlight' );
		} );
		
		
	$('input.global_filter').on( 'keyup click', function () {
		filterGlobal();
	} );

	$('input.column_filter').on( 'keyup click', function () {
		filterColumn( $(this).parents('tr').attr('data-column') );
	} );
	
   $( "#draggable" ).draggable();
   $( "#date" ).datepicker();  
   $( "#table-container" ).resizable();



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
           
 }); //fin de lautocomplete multiple

    //$( "#date" ).datepicker();  
});//fin de la fonction document ready

//$( "#date" ).datepicker(); 
function myFunction() {
   var element = document.body;
   element.classList.toggle("dark-mode");
}
