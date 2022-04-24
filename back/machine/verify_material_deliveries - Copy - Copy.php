<?php
include "connect.php" ;
   $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }

$res=0;

  $json = file_get_contents('php://input');
// Converts it into a PHP object 
    $data = json_decode($json, true);
	$id_op_f=$data['id_op'];
    $id_donor_f=$data['id_donor'];
	$id_recipient_f=$data['id_recipient'];
	$id_user=$data['id_user'];
    $qua_1_three_in_one_f= $data['qua_1_three_in_one'];
    $qua_2_cohco_f = $data['qua_2_cohco'];
    $qua_3_coffe_f = $data['qua_3_coffe'];
  
    
	
	
	///////////////////////////////////employee////////////////////////////////
	
	
  $sql6= "SELECT * FROM  material_deliveries  WHERE id_op ='" .$id_op_f."' ";
  $result = $db->query($sql6);
  $m11to1 = mysqli_fetch_array($result);
  $id_op_d = $m11to1["id_op"] ?? null;	
  $id_donor_d = $m11to1["id_donor"] ?? null;
  $id_recipient_d = $m11to1["id_recipient"] ?? null;
  $qua_1_d = $m11to1["three_in_one"] ?? null;
  $qua_2_d = $m11to1["cohco"] ?? null;
  $qua_3_d = $m11to1["coffe"] ?? null;
echo $id_op_d ;
echo $id_donor_d;
////////////////////////////////////////doner/////////////////////////////////////////////////

$sql69= "SELECT * FROM  employee_qa  WHERE id_empl ='" .$id_donor_f."' ";
$result9 = $db->query($sql69);
  $m11to1 = mysqli_fetch_array($result9);
  $id_op_d_d = $m11to1["id"] ?? null;	
  $id_empl_d_d = $m11to1["id_empl"] ?? null;
  $three_in_one_d_d = $m11to1["three_in_one"] ?? null;
  $coho_d_d = $m11to1["coho"] ?? null;
  $coffe_d_d = $m11to1["coffe"] ?? null;
  $max_three_in_one_d_d= $m11to1["max_three_in_one"] ?? null;
  $max_coho_d_d= $m11to1["max_coho"] ?? null;
  $max_coffe_d_d= $m11to1["max_coffe"] ?? null;



/////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////respacter/////////////////////////////////////////////////

$sql70= "SELECT * FROM  employee_qa  WHERE id_empl ='" .$id_recipient."' ";
$result9 = $db->query($sql70);
  $m11to1 = mysqli_fetch_array($result9);
  $id_op_d_r = $m11to1["id"] ?? null;	
  $id_empl_d_r = $m11to1["id_empl"] ?? null;
  $three_in_one_d_r = $m11to1["three_in_one"] ?? null;
  $coho_d_r = $m11to1["coho"] ?? null;
  $coffe_d_r = $m11to1["coffe"] ?? null;
  $max_three_in_one_d_r= $m11to1["max_three_in_one"] ?? null;
  $max_coho_d_r= $m11to1["max_coho"] ?? null;
  $max_coffe_d_r= $m11to1["max_coffe"] ?? null;

/////////////////////////////////////////////////////////////////////////////////////////

  if (  $id_recipient_d == $id_recipient_f )
  {
	  if ($id_donor_d == $id_donor_f)
	  {
	  
			if ( $qua_1_three_in_one_f == $qua_1_d  && $qua_2_cohco_f == $qua_2_d  && $qua_3_coffe_f == $qua_3_d  )
			{
					if( $three_in_one_d_d > $qua_1_three_in_one_f && $coho_d_d > $qua_2_cohco_f && $coffe_d_d  > $qua_3_coffe_f )
 					{  
				           if ($qua_1_three_in_one_f + $three_in_one_d_d < $max_three_in_one_d_d && $qua_2_cohco_f + $coho_d_d < $max_coho_d_d  &&  $qua_3_coffe_f + $coffe_d_d < $max_coffe_d_d )
						   {
				       
									$sql = "UPDATE material_deliveries SET status = 1";
									if ($db->query($sql))
									{
										$qua_1_three_in_one_f_and_three_in_one_d_d=$qua_1_three_in_one_f + $three_in_one_d_d;
										$qua_2_cohco_f_and_coho_d_d=$qua_2_cohco_f + $coho_d_d;
										$qua_3_coffe_f_and_coffe_d_d=$qua_3_coffe_f + $coffe_d_d ;
										$sql = "UPDATE employee_qa SET three_in_one = '" .$qua_1_three_in_one_f_and_three_in_one_d_d."' WHERE id_empl ='" .$id_donor_f."' " ;
										$sql100 = "UPDATE employee_qa SET cohco = '" .$qua_2_cohco_f_and_coho_d_d."'   WHERE id_empl ='" .$id_donor_f."' " ;
										$sql101 = "UPDATE employee_qa SET coffe = '" .$qua_3_coffe_f_and_coffe_d_d."'   WHERE id_empl ='" .$id_donor_f."' ";
		                                $res=1;
										echo $res;
										
										
									}
							else 
							{
								 $sql36 = "UPDATE material_deliveries SET status =-5";
								if ($db->query($sql36))
								{
									     $res=-5;
										echo $res;
									
								}
							}								
					}
					else 
					{
						 $sql33 = "UPDATE material_deliveries SET status =-4";
						if ($db->query($sql33))
						{
						     $res=-4;
							 echo $res;
						}
						
					}
						
			}
            else 
			{
				 $sql3 = "UPDATE material_deliveries SET status =-3";
				 if ($db->query($sql3))
				{
				     $res=-3;
					echo $res;
				}
			}
				
	  }
	  else 
	  {
			 $sql1 = "UPDATE material_deliveries SET status =-1";
			if ($db->query($sql1))
				{
				    $res=-1;
					echo $res;
				}
	   }	
	  
    }
  else 
		{
			 $sql2 = "UPDATE material_deliveries SET status =-2";
			 if ($db->query($sql2))
				{
				    $res=-2;
					echo $res;
				}

		}	
		



		
		
		     $db->close();
?>