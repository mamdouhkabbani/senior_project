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
    $id= $data['id'];
  
	
     $sql="DELETE FROM store WHERE id='" .$id."'";  // ;
   // $sql ='';

      // return var_dump();
    if ($db->query($sql)) {
    echo json_encode(
        [
            'result' => true ,
         'message' => "DELETE FROM employee " 
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

  
?>