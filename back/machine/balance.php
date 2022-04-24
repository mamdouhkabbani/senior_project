<?php
	header('Access-Control-Allow-Origin: *');
  $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }    
    $json = file_get_contents('php://input');
    
    $data = json_decode($json, true);
    $email=$data['email'];
    
 	  $result = "SELECT balance FROM users_company WHERE email='" .$email."' ";
      if($db->query($result)){

        $result1 = $db->query($result);
  
  $result1 = $db->query($result);
     $m11to1 = mysqli_fetch_array($result1);
     $lecture = $m11to1["balance"] ?? null;
     echo $lecture;
        


    

     
     
     
    
        
    }
    $db->close();
    ?>