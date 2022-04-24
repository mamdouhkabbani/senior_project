<?php
	header('Access-Control-Allow-Origin: *');
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }

    //$newID = $_POST['id'];
    
    $list = array();
    $result = $db->query("SELECT id,first_name,last_name,balance, type_of_user,availability,email FROM users_company WHERE  type_of_user=5  ");

  //$m11to1 = mysqli_fetch_array($result);
  //$id_d = $m11to1["id"] ?? null;
  //echo $id_d ;
    if($result){
        while ($row=$result->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
       
        
        
    }

?>