<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
include "connect.php" ;
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }
	
	
	
	
	
  $json = file_get_contents('php://input');
// Converts it into a PHP object 
    $data = json_decode($json, true);
    $id_f=$data['id'];
	$type_of_user=$data['type_of_user'];
    $max_three_in_one= $data['max_three_in_one'];
    $max_choco = $data['max_choco'];
    $max_coffe = $data['max_coffe'];
	$availability = $data['availability'];
	
	////////////////////////////////////////respacter/////////////////////////////////////////////////

  $sql70= "SELECT * FROM  employee_qa  WHERE id_empl ='" .$id_f."' ";
  $result9 = $db->query($sql70);
  $m11to1 = mysqli_fetch_array($result9);
  $id_d = $m11to1["id_empl"] ?? null;
  $three_in_one_d_r = $m11to1["three_in_one"] ?? null;
  $coho_d_r = $m11to1["coho"] ?? null;
  $coffe_d_r = $m11to1["coffe"] ?? null;
  $x=0;
 if ($db->query($sql70)) 
{			
        $sql33 = "UPDATE users_company SET availability = '" .$availability."'  WHERE id ='" .$id_f."' " ;
		if ($db->query($sql33))
			{		
				$x=5;
			echo $x;
			}  
		if($three_in_one_d_r == 0  && $coho_d_r ==0 &&  $coffe_d_r == 0 )
		{	
			$sql = "UPDATE users_company SET type_of_user = '" .$type_of_user."'  WHERE id ='" .$id_f."' " ;
			if($type_of_user =='3' || $type_of_user =='4' || $type_of_user =='5' )
			{
				 $sql2 = "INSERT employee_qa SET max_three_in_one = '" .$max_three_in_one."' , max_coho='" .$max_choco."', max_coffe='" .$max_coffe."' , id_empl ='" .$id_f."' " ;
		    	if ($db->query($sql)) 
			{		
					if ($db->query($sql2)) 
						{		
						$x=1;
						echo $x;
						}  
				$db->close();

			}

			}
					else
		{
			$sql55 = "UPDATE users_company SET type_of_user = '" .$type_of_user."'  WHERE id ='" .$id_f."' " ;
			if ($db->query($sql55)) 
			{
			$x=4;
			echo $x;
			}
		}
		}
		else
		{
			$x=2;
			echo $x;
		}
}
else 
{
	echo x;
	$db->close();
}


?>