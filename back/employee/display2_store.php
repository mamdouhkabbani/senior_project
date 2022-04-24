<?php
	header('Access-Control-Allow-Origin: *');
   $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }

    $newID = $_POST['id'];
    
    $list = array();
    $result = $db->query("SELECT * FROM store WHERE id='" .$newID."' ");
    if($result){
        while ($row=$result->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
    }

