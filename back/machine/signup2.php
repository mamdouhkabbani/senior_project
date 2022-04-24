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
   // $in= $_POST['inc'];
   
    $first_name= $data['first_name'];
    $last_name = $data['last_name'];
    $email = $data['email'];
    $password=$data['password'];
    $mobile_number=$data['mobile_number'];
    $gender=$data['gender'];
    $date_of_birthday=$data['date_of_birthday'];
    $username=$data['username'];


     
    


    
     $sql="INSERT INTO users_company (`first_name`,`last_name`,`email`,`password`,`mobile_number`,`gender`,`date_of_birthday`,`username`) VALUES ('".$first_name."','".$last_name."','".$email."','".$password."','".$mobile_number."','".$gender."','".$date_of_birthday."','".$username."')  ";
  //  $sql ="UPDATE employee SET three_in_one='',coho='800',coffe='80' WHERE id='1' ";
   // $sql ='';

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