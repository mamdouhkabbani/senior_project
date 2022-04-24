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
    $qua_1= $data['qua_1_three_in_one'];
    $qua_2 = $data['qua_2_choco'];
    $qua_3 = $data['qua_3_coffe'];
   
	
     $sql="INSERT INTO material_deliveries (`id_donor`,`id_recipient`,`three_in_one`,`cohco`,`coffe`,`status`) VALUES ('".$id_donor."','".$id_recipient."','".$qua_1."' ,'".$qua_2."' ,'".$qua_3."','0')"; 
     $sql2= "SELECT * FROM  material_deliveries ORDER BY id_op DESC LIMIT 1 ";
    if ($db->query($sql) && $db->query($sql2)) 
	{		
	$result = $db->query($sql2);
     $m11to1 = mysqli_fetch_array($result);
     $lecture = $m11to1["id_op"] ?? null;
     echo $lecture;
	}
      // return var_dump();  
        $db->close();

  
?>