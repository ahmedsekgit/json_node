==============================
le dataflow qui cree une table basique avec pdo  
==============================
 <?php

 $host = "127.0.0.1";

  $root = "sea";
  $root_password = "123";
/*
  $user = 'sea';
  $pass = '123';
  $db = "db_test";

  try {
      $dbh = new PDO("mysql:host=$host", $root, $root_password);

      $dbh->exec("CREATE DATABASE `$db`;
              CREATE USER '$user'@'localhost' IDENTIFIED BY '$pass';
              GRANT ALL ON `$db`.* TO '$user'@'localhost';
              FLUSH PRIVILEGES;")
      or die(print_r($dbh->errorInfo(), true));

  }
  catch (PDOException $e) {
      die("DB ERROR: " . $e->getMessage());
  }*/
    
$servername = "127.0.0.1";
$username = "sea";
$password = "123";
$dbname = "db_test";


try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // sql to create table
  $sql = "CREATE TABLE search (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  email VARCHAR(50),
  title text NOT NULL,
  description text NOT NULL,
  link text,
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  )";

  // use exec() because no results are returned
  $conn->exec($sql);
  echo "Table search created successfully";
} 
catch(PDOException $e) 
{
  echo $sql . "<br>" . $e->getMessage();
}

$conn = null;
?>   
==============================
56 at  2021-10-29T15:22:52.000Z
==============================
