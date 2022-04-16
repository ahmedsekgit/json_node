==============================
php recherche de keywords pour repondre a une requete ajax autocomplete  
==============================
le javascript qui appelle
 $( "#autocomplete" ).autocomplete({
  source: function( request, response ) {
   // Fetch data
   $.ajax({
    url: "test_fetch_data.php",
    type: 'post',
    dataType: "json",
    data: {
     search: request.term
    },
    success: function( data ) {
      //alert("data");
      //alert(data);
     response( data );
    }
   });
  },
  select: function (event, ui) {
     // Set selection
     $('#autocomplete').val(ui.item.label); // display the selected text
     $('#selectuser_id').val(ui.item.value); // save selected id to input
     return false;
  },
  focus: function(event, ui){
     $( "#autocomplete" ).val( ui.item.label );
     $( "#selectuser_id" ).val( ui.item.value );
     return false;
   },
 });

 // Multiple select
 $( "#multi_autocomplete" ).autocomplete({
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

});

 $.ajax({
    url: "test_fetch_data.php",
    type: 'post',
    dataType: "json",
    data: {
     search: request.term
    },
    success: function( data ) {

     response( data );
    }
   });
  }

function split( val ) {
   return val.split( /,\s*/ );
}
function extractLast( term ) {
   return split( term ).pop();
}

<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if(isset($_POST['search'])){
 $host="127.0.0.1";
 $username="sea";
 $password="123";
 $databasename="db_test";

 /*connexion a la host*/
 try 
 {
		      $dbh = new PDO("mysql:host=$host", $username, $password);
		      //$search = mysql_real_escape_string($_POST['search']);
		      $search = $_POST['search'];
		     	
		 	  $query = "SELECT id,keyword FROM db_test.general_keywords WHERE keyword like'%".$search."%'";

		      
		      $result = $dbh->query($query);

		 $response = array();
		 foreach ($result as $row) 
		 {
		 	# code...
		   $response[] = array("value"=>$row['id'],"label"=>$row['keyword']);
		 }
	echo json_encode($response);	 
	}
catch (PDOException $e) 
  {
      die("DB ERROR: " . $e->getMessage());
  }

 
}


function edit_data($conn, $id)
{

    $query="SELECT * FROM db_test.search WHERE id=$id";
    $exec = $conn->query($query);
    $row = $exec->fetch(PDO::FETCH_ASSOC);
    echo json_encode($row);
                
}

exit;

?>
  
==============================
58 at  2021-10-29T15:22:52.000Z
==============================
