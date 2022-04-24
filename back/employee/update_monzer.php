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
	$id=$data['id'];
    $location=$data['location'];
	$coffe=$data['coffe'];
	$three_in_one=$data['three_in_one'];
	$coho=$data['coho'];
	$water=$data['water'];
	$temp=$data['temp'];
	
	
	$sql2= "UPDATE employee_qa SET location =  '".$location."' ,three_in_one='".$three_in_one."',coho='".$coho."',water='".$water."',coffe='".$coffe."',temp='".$temp."' WHERE id_empl='".$id."'";
	$result = $db->query($sql2);
    if ($db->query($sql2) )
    {
		
      echo "1";
    }
    else
    {
        echo "0";
		
    }
	 ?>