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
    $name=$data['name'];
    $three= $data['th'];
    $chh = $data['ch'];
    $co = $data['co'];    
	
     $sql="INSERT INTO store (`name`,`three_in_one`,`coho`,`coffe`) VALUES ('".$name."','".$three."','". $chh."','".$co."') ";  //  $sql ="UPDATE employee SET three_in_one='',coho='800',coffe='80' WHERE id='1' ";
   // $sql ='';

      // return var_dump();
    if ($db->query($sql)) {
    echo json_encode(
        [
            'result' => true ,
         'message' => "New store created successfully" 
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