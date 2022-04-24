<?php
include "connect.php" ;
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }
  $json = file_get_contents('php://input');
// Converts it into a PHP object 
    $data = json_decode($json, true);
    $email=$data['email'];
   
	     $sql2= "SELECT type_of_user  FROM  users_company WHERE email='" .$email."'  ";
    if ($db->query($sql2)) 
	{		
	$result = $db->query($sql2);
	
	$result = $db->query($sql2);
     $m11to1 = mysqli_fetch_array($result);
     $lecture = $m11to1["type_of_user"] ?? null;
     echo $lecture;
	}
      // return var_dump();  
        $db->close();

  
?>