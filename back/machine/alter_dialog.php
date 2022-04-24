<?php
	header('Access-Control-Allow-Origin: *');
     $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }
	$json = file_get_contents('php://input');
    $data = json_decode($json, true);
    $newID = $data['id'];
    
     $list = array();
     $result = $db->query("SELECT id,first_name,last_name,email FROM users_company WHERE (type_of_user =3 OR type_of_user =4) AND id='" .$newID."' ");
     $m11to1 = mysqli_fetch_array($result);
		echo "<td>".$m11to1["first_name"]."</td>";
		echo "<td>".$m11to1["last_name"]."</td>";
		echo "<td>".$m11to1["email"]."</td>";

?>