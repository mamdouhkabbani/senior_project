<?php

include "connect.php" ;
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }



  $json = file_get_contents('php://input');
// Converts it into a PHP object 
$data = json_decode($json, true);
   // $in= $_POST['inc'];
   
   
    $email = $data['email'];
    $username=$data['username'];
    
	//$type_of_user=$data['type_of_user'];
//////////////////////////////////////////////////////////
    //$sql66="SELECT * FROM user_type WHERE id='".$type_of_user."'";
    //$result66 = mysqli_query("SELECT * FROM user_type WHERE id = '".$type_of_user."' ");
	//$num_rows = mysqli_num_rows($result66);
	//if($num_rows > 0){
	////////////////////////////////////////////////////////////////
     $sql="UPDATE users_company  SET username = '" .$username."' WHERE email='" .$email."' ";
  //  $sql ="UPDATE employee SET three_in_one='',coho='800',coffe='80' WHERE id='1' ";
   // $sql ='';
	//}
      // return var_dump();
    if ($db->query($sql)) {
    echo json_encode(
        [
            'result' => true ,
         'message' => "New record created successfully" 
             ]
    );
  
} else {

     echo json_encode(
        [
            'result' => false ,
         'message' => "Error: " . $sql . "<br>" . $db->error
     ]
    );
     
        }

        $db->close();
		
   /* elseif (in==1) {
        $result = $db->query("UPDATE store SET coffe ='" .$co."', coho ='" .$chh."', three_in_one ='"
            .$three."'WHERE id='" .$id."' ");

        
    }
*/

/*
    
    if($result)
    {
        while ($row=$result->fetch_assoc()) {
            $list[]=$row;
            
        }
        echo json_encode($list);
    }
*/
?>