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
    //$in=0;
    $three= $data['th'];
    $chh = $data['ch'];
    $co = $data['co'];
    $id_empl=$data['id_empl'];
	$id_store=$data['id_store'];
    
	
	
	///////////////////////////////////employee////////////////////////////////
	
	
  $sql2= "SELECT * FROM  employee  WHERE id ='" .$id_empl."' ";
  $result = $db->query($sql2);
  $m11to1 = mysqli_fetch_array($result);
  $three_in_one_empl = $m11to1["three_in_one"] ?? null;	
  $coho_empl = $m11to1["coho"] ?? null;
  $coffe_empl = $m11to1["coffe"] ?? null;
  
  $three_in_one_empl = $three_in_one_empl +$three ;
  $coho_empl = $coho_empl +$chh ;
  $coffe_empl = $coffe_empl +$co ;
  
  
  
  //////////////////////////////////////store////////////////////////////////////////
  $sql3= "SELECT * FROM  store  WHERE id ='" .$id_store."' ";
  $result3 = $db->query($sql3);
  $m11to13 = mysqli_fetch_array($result3);
  $three_in_one_store = $m11to13["three_in_one"] ?? null;	
  $coho_store = $m11to13["coho"] ?? null;
  $coffe_store = $m11to13["coffe"] ?? null;
  
  
  $three_in_one_store= $three_in_one_store - $three;
  $coho_store=$coho_store - $chh;
  $coffe_store =$coffe_store - $co;
  
  /////////////////////////////////////////////////////////////////////////////
  
	
     $sql="UPDATE employee SET three_in_one ='" .$three_in_one_empl."' , coho ='" .$coho_empl."', coffe ='".$coffe_empl."' WHERE id ='" .$id_empl."' ";
	 $sql4="UPDATE store SET three_in_one ='" .$three_in_one_store."' , coho ='" .$coho_store."', coffe ='".$coffe_store."' WHERE id ='" .$id_store."' ";


    if ($db->query($sql) && $db->query($sql4)) {
    echo json_encode(
        [
            'result' => true ,
         'message' => "UPDATE  employee teble AND  store teble " 
             ]
    );
  
} else 
{

     echo json_encode(
        [
            'result' => false ,
         'message' => "Error: " . $sql . "<br>" . $db->error
     ]
    );
     
 }
        $db->close();

?>