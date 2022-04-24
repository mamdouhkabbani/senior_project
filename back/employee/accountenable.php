<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
include "connect.php" ;
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }
	
  $json = file_get_contents('php://input');
// Converts it into a PHP object 
    $data = json_decode($json, true);
    $email_f=$data['email'];



    $sql70= "SELECT availability FROM  users_company  WHERE email ='" .$email_f."' ";
  $result9 = $db->query($sql70);
   $m11to1 = mysqli_fetch_array($result9);
  $availability_d = $m11to1["availability"] ?? null;
   if ($db->query($sql70)) 
   {
    echo $availability_d;
   }
   ?>