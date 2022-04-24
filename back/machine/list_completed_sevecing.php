
	<?php
	header('Access-Control-Allow-Origin: *');
  $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }    
    $list = array();
 	$result = $db->query ("SELECT ID_OP,id_empl,id_machine,Status_OF_Service,three_in_one,Choco,coffe,auto_generate_code FROM machine_service Where Status_OF_Service=1  ");
  	if($result){
        while ($row=$result->fetch_assoc()) 
		{
            $list[]=$row;
            
        }
        echo json_encode($list);
    }