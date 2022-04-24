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

$Id_Client= $data['Id_Client'];
$three_in_one= $data['three_in_one'];
$Choco= $data['Choco'];
$coffe= $data['coffe'];


		$sql22 = "SELECT * FROM machine_service Where id_empl= '".$Id_Client."' ORDER BY ID_OP   DESC LIMIT 1  ";

		$result = $db->query($sql22);
		$m11to1 = mysqli_fetch_array($result);
		$ID_OP = $m11to1["ID_OP"] ?? null;
		

		$sql33="UPDATE machine_service SET three_in_one = '".$three_in_one."',Choco = '".$Choco."',coffe ='".$coffe."'   WHERE ID_OP ='" .$ID_OP."' ";

		 		if ($db->query($sql33)) 
		 		{
	 			 	
	 			 	echo "1";
	 			 }
	 				else{
							echo "0";
     
        				}
        	$db->close();

?>

		