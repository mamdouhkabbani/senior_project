<?php
    header('Access-Control-Allow-Origin: *');
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }
    $newValue = $_POST['email'];
    $list = array();
    $result = $db->query("SELECT id,first_name,last_name,email,type_of_user FROM users_company WHERE  email='" .$newValue."' " );
    if($result){
        while ($row=$result->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
    }

?>