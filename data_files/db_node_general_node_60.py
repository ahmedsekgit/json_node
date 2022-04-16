==============================
php file that update and delete and display data same time  
==============================
 <?php

include('database.php');


if(isset($_GET['deleteData']))
{
   $id= $_GET['deleteData'];
   delete_data($conn, $id);
}

if(isset($_GET['editId']))
{
   $id= $_GET['editId'];
   edit_data($conn, $id);
}

if(isset($_POST['updateId']))
{
   $id= $_POST['updateId'];
   update_data($conn,$id);
}

if(isset($_POST['displayId']))
{
   $id= $_POST['displayId'];
   display_data($conn,$id);
}

// edit data query

function edit_data($conn, $id)
{

    $query="SELECT * FROM db_test.search WHERE id=$id";
    $exec = $conn->query($query);
    $row = $exec->fetch(PDO::FETCH_ASSOC);
    echo json_encode($row);
                
}

// update data query
function update_data($conn, $id){

      $title= legal_input($_POST['title']);
      $description= legal_input($_POST['description']);

      /*$fullName= legal_input($_POST['fullName']);
      $emailAddress= legal_input($_POST['emailAddress']);
      $city = legal_input($_POST['city']);
      $country = legal_input($_POST['country']);*/

      $query="UPDATE db_test.search  
              SET title='$title',
                  description='$description'
                  WHERE id=$id";
      try{            
          $exec = $conn->query($query);
        }
        catch(PDOException $e) 
        {
          echo $query . "<br>" . $e->getMessage();
        }
}

function delete_data($conn, $id)
{
    try {
        // sql to delete a record
        $sql = "DELETE FROM db_test.search WHERE id=$id";

        // use exec() because no results are returned
        $conn->exec($sql);
        //echo "Record deleted successfully";
        } 
    catch(PDOException $e) 
        {
          echo $sql . "<br>" . $e->getMessage();
        }

$conn = null;
                
}   

function display_data($conn, $id)
{
    try {
        $query="SELECT * FROM db_test.search WHERE id=$id";
        $exec = $conn->query($query);
        $row = $exec->fetch(PDO::FETCH_ASSOC);
        echo json_encode($row);
        } 
    catch(PDOException $e) 
        {
          echo $sql . "<br>" . $e->getMessage();
        }

$conn = null;
                
}  


// convert illegal input value to ligal value formate
function legal_input($value) {
    //$value = trim($value);
    //$value = stripslashes($value);
    //$value = htmlspecialchars($value);
    $value = addslashes($value);
    return $value;
}
?>  
==============================
60 at  2021-10-29T15:22:52.000Z
==============================
