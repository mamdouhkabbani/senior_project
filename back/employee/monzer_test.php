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
    $id_donor=$data['id_donor'];
	$id_recipient=$data['id_recipient'];