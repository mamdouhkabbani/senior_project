<?php

	header('Access-Control-Allow-Origin: *');
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }
    $json = file_get_contents('php://input');
    
    $data = json_decode($json, true);
    $newID = $data['id_client'];
    //$list = array();

    $sql22="SELECT * FROM employee_qa WHERE id_empl= '" .$newID."' ";
		$result2 = $db->query($sql22);
		$m11to1 = mysqli_fetch_array($result2);
		
		$id_empl=$m11to1["id_empl"] ?? null;




    $result = $db->query ("SELECT users_company.id,users_company.type_of_user,users_company.email,users_company.first_name,users_company.last_name,employee_qa.id_empl ,employee_qa.three_in_one,employee_qa.coho,employee_qa.coffe,employee_qa.max_three_in_one,employee_qa.max_coho
    	,employee_qa.max_coffe FROM users_company INNER JOIN employee_qa ON users_company.id=employee_qa.id_empl WHERE id_empl = '".$newID."' ");



 	
     if($result){
        while ($row=$result->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
    }

?>