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
    $list = array();



    $sql70= $db->query("SELECT * FROM  users_company  WHERE email ='" .$email_f."' ");

     if($sql70){
        while ($row=$sql70->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
    }

 
   ?>