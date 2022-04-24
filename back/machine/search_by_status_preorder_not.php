<?php
	header('Access-Control-Allow-Origin: *');
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }

    $newID = $_POST['id_client'];
    
    $list = array();
    $result = $db->query("SELECT * FROM preorder WHERE status =0 AND id_client='" .$newID."' ORDER BY time_order DESC  ");
    if($result){
        while ($row=$result->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
    }

?>