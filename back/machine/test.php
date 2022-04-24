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
    $id_empl=$data['id_empl'];
   
	     $sql2= "SELECT first_name,last_name,email,mobile_number,gender,date_of_birthday  FROM  users_company WHERE id='" .$id_empl."'  ";
    if ($db->query($sql2)) 
	{		
	$result = $db->query($sql2);
  if($result){
        while ($row=$result->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
    }
	}
      // return var_dump();  
        $db->close();

  
?>