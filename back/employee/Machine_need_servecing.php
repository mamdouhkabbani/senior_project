<?php
header('Access-Control-Allow-Origin: *');
include "connect.php" ;
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }
    $json = file_get_contents('php://input');
// Converts it into a PHP object 
	$data = json_decode($json, true);
	$id_client= $data['id_client'];
	$code=rand(1000,4000);

	$sql= "INSERT INTO machine_service (ID_OP , id_empl, Time_OF_Servecing, Status_OF_Service, auto_generate_code) 
	 			VALUES (NULL,'.$id_client.',current_timestamp(),'0','".$code."')";
	 			 if ($db->query($sql))
	 			 {
	 			 	
	 			 	echo $code;
	 			 }
	 	else{
			echo	$db->error;
     
        	}
        	$db->close();

?>
