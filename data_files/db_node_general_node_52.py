==============================
connection a une base avec pdo  
==============================
$servername = "127.0.0.1";
$username = "sea";
$password = "123";
$dbname = "db_test";


try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  echo "<br> \"database.php\" Connection to database established successfully <br> <br>";
  
} catch(PDOException $e) {
  echo "<br>" . $e->getMessage();
}  
==============================
52 at  2021-10-29T15:22:52.000Z
==============================
