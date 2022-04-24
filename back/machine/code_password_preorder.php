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
	$code=$data['code'];
    $password=$data['password'];
	$sql2= "SELECT * FROM  preorder  WHERE auto_generate_code = '".$code."'  AND  auto_generate_password ='".$password."'";
	$result = $db->query($sql2);
	$m11to1 = mysqli_fetch_array($result);
	$code2=$m11to1["auto_generate_code"]?? null;
	$password2=$m11to1["auto_generate_password"]?? null;
	$numbers_of_Engines=$m11to1["numbers_of_Engines"]?? null;
    if ($code == $code2 && $password == $password2 )
    {
		
      echo $numbers_of_Engines;
    }
    else
    {
        echo "0";
		
    }
?>

