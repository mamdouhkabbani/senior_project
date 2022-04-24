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
	$id_op_f=$data['id_op'];
    $id_donor_f=$data['id_donor'];
	$id_recipient_f=$data['id_recipient'];
	$id_user=$data['id_user'];
    $qua_1_f= $data['qua_1'];
    $qua_2_f = $data['qua_2'];
    $qua_3_f = $data['qua_3'];
  
    
	
	
	///////////////////////////////////employee////////////////////////////////
	
	
  $sql6= "SELECT * FROM  material_deliveries  WHERE id_op ='" .$id_op_f."' ";
  $result = $db->query($sql6);
  $m11to1 = mysqli_fetch_array($result);
  $id_op_d = $m11to1["id_op"] ?? null;	
  $id_donor_d = $m11to1["id_donor"] ?? null;
  $id_recipient_d = $m11to1["id_recipient"] ?? null;
  $qua_1_d = $m11to1["qua_1"] ?? null;
  $qua_2_d = $m11to1["qua_2"] ?? null;
  $qua_3_d = $m11to1["qua_3"] ?? null;
echo $id_op_d ;
echo $id_donor_d;

  if (  $id_recipient_d == $id_recipient_f )
  {
	  if ($id_donor_d == $id_donor_f)
	  {
	  
			if ( $qua_1_f == $qua_1_d  && $qua_2_f == $qua_2_d  && $qua_3_f == $qua_3_d  )
			{
		        $sql = "UPDATE material_deliveries SET status = 1";
				if ($db->query($sql))
				{
				echo "ok";
				}
				else  
				{ 
			     echo "no";
				}
					
				
			}
            else 
			{
				 $sql3 = "UPDATE material_deliveries SET status =-3";
				 if ($db->query($sql3))
				{
				echo "ok";
				}
				else  
				{ 
			     echo "no";
				}
			}
				
	  }
	  else 
	  {
			 $sql1 = "UPDATE material_deliveries SET status =-1";
			if ($db->query($sql1))
				{
				echo "ok";
				}
				else  
				{ 
			     echo "no";
				}
	   }	
	  
    }
  else 
		{
			 $sql2 = "UPDATE material_deliveries SET status =-2";
			 if ($db->query($sql2))
				{
				echo "ok";
				}
				else  
				{ 
			     echo "no";
				}
		}	
		



		
		
		     $db->close();
?>