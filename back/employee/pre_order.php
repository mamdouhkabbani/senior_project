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
   // $in= $_POST['inc'];
    $rotation_rate= $data['numbers_of_Engines'];
	    $id_client= $data['id_client'];
		$code=rand(1000,4000);
		$password=rand(1000,4000);

		$sql22="SELECT price FROM material_type WHERE  rotation_rate = '".$rotation_rate."'";
		$result = $db->query($sql22);
		$m11to1 = mysqli_fetch_array($result);
		$price_of_material = $m11to1["price"] ?? null;

		$sql33 = "SELECT balance FROM  users_company WHERE id = '".$id_client."'";
		$result2 = $db->query($sql33);
		$m11to2 = mysqli_fetch_array($result2);
		$balance_total = $m11to2["balance"] ?? null;
		//$b1=(int)$balance_total;
		//$b2=(int)$price_of_material;


		if($balance_total >= $price_of_material)
		{
			

     		$sql= "INSERT INTO preorder (id_order, id_client, time_order, status, numbers_of_Engines, auto_generate_code,
     		 	auto_generate_password, id_machine,Price_Of_Order) 
	 			VALUES (NULL,'.$id_client.',current_timestamp(),'0','".$rotation_rate."' ,'".$code."' ,'".$password."','51',
	 			'".$price_of_material."')"; 
		}
		    if ($db->query($sql)) 
			{

				if( $balance_total - $price_of_material >= 0 )
				{
				$balance_monzer= 	$balance_total - $price_of_material;
				echo 1;
				}
				else
				{
					$balance_monzer= $balance_total;
					echo 0;
				}
				$db->query("UPDATE users_company SET balance = '".$balance_monzer."'   WHERE id ='" .$id_client."' ");
				
  
		} 
	else 
		{
		echo	$db->error;
     
        }
        $db->close();

?>