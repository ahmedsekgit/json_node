==============================
do_login qui check avec pdo si un record avec le meme champ existe example  
==============================
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


$servername = "127.0.0.1";
$username = "sea";
$password = "123";
$dbname = "db_test";


try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
} catch(PDOException $e) {
  echo "<br>" . $e->getMessage();
}

	session_start();
	if($_POST['type']==1)
	{
		$name=$_POST['name'];
		$email=$_POST['email'];
		$phone=$_POST['phone'];
		$city=$_POST['city'];
		$password=$_POST['password'];
		
		try {
		        $query="select * from crud where email='$email'";
		        $exec = $conn->query($query);

		        $row = $exec->fetch(PDO::FETCH_ASSOC);

		        if (!empty($row))
				{
					echo json_encode(array("statusCode"=>201));
				}
				else
				{
					$sql = "INSERT INTO crud( name, email, phone, city, password) 
					VALUES ('$name','$email','$phone','$city', '$password')";
					
					$result = $conn->prepare($sql); 
					$result->execute();
					$result = $conn->prepare("SELECT FOUND_ROWS()"); 
					$result->execute();
					$row_count =$result->fetchColumn();

					if ($row_count>0) 
					{
						echo json_encode(array("statusCode"=>200));
					} 
					else 
					{
						echo json_encode(array("statusCode"=>201));
					}
	        
	        	} 
	        	$conn = null;
	        }
	    catch(PDOException $e) 
	        {
	          echo $sql . "<br>" . $e->getMessage();
	        }
	
	}



	if($_POST['type']==2)
	{
		$email=$_POST['email'];
		$password=$_POST['password'];
		$sql = "select * from crud where email='$email' and password='$password'";
					
		$result = $conn->prepare($sql); 
		$result->execute();
		$result = $conn->prepare("SELECT FOUND_ROWS()"); 
		$result->execute();
		$row_count =$result->fetchColumn();

		if ($row_count>0)
		{
			$_SESSION['email']=$email;
			echo json_encode(array("statusCode"=>200));
		}
		else
		{
			echo json_encode(array("statusCode"=>201));
		}
		$conn =null;
	}
?>  
==============================
73 at  2021-10-29T15:22:52.000Z
==============================
