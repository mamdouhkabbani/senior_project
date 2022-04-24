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
$id_Machine= $data['id_Machine'];

$sql22="SELECT * FROM direct_order ORDER BY ID  DESC LIMIT 1";
		$result = $db->query($sql22);
		$m11to1 = mysqli_fetch_array($result);
		$price_of_material = $m11to1["Price_Of_Order"] ?? null;
		$ID_OP=$m11to1["ID"] ?? null;
		


		$sql33 = "SELECT balance FROM  users_company WHERE id = '".$Id_Client."'";
		$result2 = $db->query($sql33);
		$m11to2 = mysqli_fetch_array($result2);
		$balance_total = $m11to2["balance"] ?? null;
		if($balance_total >= $price_of_material){
			$mamdouh= $balance_total - $price_of_material;
			$db->query("UPDATE direct_order SET Id_Client = '".$Id_Client."', status = 1   WHERE ID ='" .$ID_OP."' ");
			$db->query("UPDATE users_company SET balance = '".$mamdouh."'   WHERE id ='" .$Id_Client."' ");
			echo "1";

		}
		else{
			echo "0";
		}


