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
   // $in= $_POST['inc'];
    $rotation_rate= $data['numbers_of_Engines'];
	$sql2= "SELECT price FROM  material_type  WHERE  rotation_rate = '".$rotation_rate."' ";
 if ($db->query($sql2)) 
	{		
	$result = $db->query($sql2);
     $m11to1 = mysqli_fetch_array($result);
     $lecture = $m11to1["price"] ?? null;
     echo $lecture;
	}
	  $db->close();

?>