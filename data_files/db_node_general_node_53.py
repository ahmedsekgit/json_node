==============================
conexion a une base avec pdo et creation d une table et creation d une requete insert into a partir d un text file de valeurs  
==============================
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


$servername = "127.0.0.1";
$username = "sea";
$password = "123";
$dbname = "db_test";


try 
{
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // sql to create table
  $sql = "CREATE TABLE general_keywords (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  keyword text NOT NULL,
  description text NULL,
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  )";

  // use exec() because no results are returned
  $conn->exec($sql);
  echo "Table general_keywords created successfully";
} 
catch(PDOException $e) 
{
  echo $sql . "<br>" . $e->getMessage();
}
 
die();

$file = file('2200_mots_communs_en_technologie_in_french.txt'); # read file into array


$file = array_unique($file);
$tmp_array = array();
foreach ($file as $key => $value) 
{
 $value = trim($value) ;
 if(!is_null($value) && !empty($value) && $value !== '') 
 {
    $tmp_array[] = $value;
 }
 else
 {
  echo "<br> empty value <br>";
  echo $value;

 }
}
$file = array();
$file = $tmp_array;
$count = count($file);

$french_query ="";

if($count > 0) # file is not empty
{
    $french_query = "INSERT into french_keywords (keyword) values";
    $i = 0;
    $value = "";
    foreach($file as $row)
    {
        $french_query .= "('".$row."')";
        $i++;
        $french_query .= $i < $count ? ',':'';
    }

try{

    $conn->exec($french_query);

    $keyword_id = $conn->lastInsertId();
   
    echo "<br> New record created successfully";
    echo ' number ' . $keyword_id . ' was inserted <br>';

    } 
    catch(PDOException $e) 
    {
        echo $french_query . "<br><br><br>" . $e->getMessage();
    }
    //echo "<br> english_query <br>";
    //echo $english_query;
}
die();

$file = file('file.txt'); # read file into array
$count = count($file);

if($count > 0) # file is not empty
{
    $milestone_query = "INSERT into milestones(ID, NAME, URL, EMAIL, LOGO, ADTEXT, CATEGORY, PUBDATE) values";
    $i = 1;
    foreach($file as $row)
    {
        $milestone = explode('|',$row);
        $milestone_query .= "('$milestone[0]',  '$milestone[1]', '$milestone[2]', '$milestone[3]', '$milestone[4]', '$milestone[5]', '$milestone[6]', '$milestone[7]')";
        $milestone_query .= $i < $count ? ',':'';
        $i++;
    }
    mysql_query($milestone_query) or die(mysql_error());
}


    $file = explode("___", file_get_contents("test.txt")); 
    echo "<table>"; 
     
    foreach ( $file as $content ) {  
     
         echo "<tr><td>".$content."</td></tr>"; 
     
    } 
    echo "</table>"; 


?>  
==============================
53 at  2021-10-29T15:22:52.000Z
==============================
