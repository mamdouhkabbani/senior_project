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
    $id_f=$data['id'];
	$Location=$data['location'];
	$availability = $data['availability'];

    $sql70= "SELECT * FROM  employee_qa  WHERE id_empl ='" .$id_f."' ";
  $result9 = $db->query($sql70);
  $m11to1 = mysqli_fetch_array($result9);
  $id_d = $m11to1["id_empl"] ?? null;
  $loc = $m11to1["location"] ?? null;
  if ($db->query($sql70)) {
     $sql33 = "UPDATE users_company SET availability = '" .$availability."'  WHERE id ='" .$id_f."' " ;
     if ($db->query($sql33))
            {       
                
            
            } 
             $sql331 = "UPDATE employee_qa SET location = '" .$Location."'  WHERE id_empl ='" .$id_f."' " ;

             if ($db->query($sql331))
            {       
                
            echo "1";
            } 
  }





  ?>