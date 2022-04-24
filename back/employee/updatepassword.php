<?php

include "connect.php" ;
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }



  $json = file_get_contents('php://input');
// Converts it into a PHP object 
$data = json_decode($json, true);
    $email = $data['email'];
    $password=$data['password'];
    $epass=base64_encode($password);
	$old_password_f=$data['old_password'];
	$eold_password_f=base64_encode($old_password_f);
	$sql= "SELECT password FROM  users_company  WHERE email ='" .$email."' ";
	$result = $db->query($sql);
	$m11to1 = mysqli_fetch_array($result);
	$old_password_d = $m11to1["password"] ?? null;	
	 
    if ($old_password_d == $eold_password_f)
		{
		$sql2="UPDATE users_company  SET password = '" .$epass."' WHERE email='" .$email."' ";
		$db->query($sql2);
			echo "1";
		} 
		else 
		{
		echo"0";	
        }

        $db->close();
		
?>