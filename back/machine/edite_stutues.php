 <?php
 include "connect.php" ;
   $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }
	
  $json = file_get_contents('php://input');
    $data = json_decode($json, true);
  $id_op_f=$data['id_op'];
  
  
 
 $sql33 = "UPDATE material_deliveries SET status =-6  WHERE id_op ='" .$id_op_f."' ";
 	if ($db->query($sql33))
	{
		echo "ok";
	}
	else  
	{				
		echo "no";
	}
 ?>