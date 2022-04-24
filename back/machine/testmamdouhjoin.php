<?php

	header('Access-Control-Allow-Origin: *');
  $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    } 
    //$json = file_get_contents('php://input');
    
    //$data = json_decode($json, true);
    //$email=$data['email'];
    $list = array();
    $result = $db->query ("SELECT users_company.id,users_company.type_of_user,users_company.availability,users_company.first_name,users_company.last_name,users_company.created,employee_qa.id_empl ,employee_qa.three_in_one,employee_qa.coho,employee_qa.coffe,employee_qa.temp,employee_qa.water, employee_qa.location FROM users_company INNER JOIN employee_qa ON users_company.id=employee_qa.id_empl WHERE type_of_user=4 ");
 
  if($result){
	  
        while ($row=$result->fetch_assoc()) 
		{
            $list[]=$row;
            
        }
        echo json_encode($list);
    }
    ?>