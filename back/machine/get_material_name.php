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
		$numbers_of_Engines= $m11to1['numbers_of_Engines'];
		


		$sql44="SELECT name FROM  material_type WHERE rotation_rate = '".$numbers_of_Engines."'";
		$result3 = $db->query($sql44);
		$m11to3 = mysqli_fetch_array($result3);
		$mat = $m11to3["name"] ?? null;
		echo $mat . "\n" . $price_of_material ;

 		$db->close();

?>



