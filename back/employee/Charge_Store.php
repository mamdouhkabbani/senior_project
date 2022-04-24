<?php
    header('Access-Control-Allow-Origin: *');
    include "connect.php" ;
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }
     $json = file_get_contents('php://input');
// Converts it into a PHP object 
    $data = json_decode($json, true);
    $newID = $data['id'];
    //$newValue =$data['email'];
    $newquantity1=$data['three_in_one'];
    $newquantity2=$data['coho'];
    $newquantity3=$data['coffe'];
    //$newValue1 =$_POST['email'];


    $list = array();
    //$result1=$db->query("SELECT balance FROM users_company Where email='" .$newValue."' " );
    
    $result1 = $db->query("SELECT * FROM  employee_qa Where id_empl='".$newID."' ");
        //echo $result1;
    
    if($result1){

       
       $m11to1 = mysqli_fetch_array($result1);

       
       $three_in_one = $m11to1["three_in_one"] ?? null;
       $coho = $m11to1["coho"] ?? null;
       $coffe = $m11to1["coffe"] ?? null;
     
        $result31=(int)$three_in_one;
        $result311=(int)$newquantity1;
        $result312=$result31+$result311;
        $result313=(string)$result312;

        $result32=(int)$coho;
        $result321=(int)$newquantity2;
        $result322=$result32+$result321;
         $result323= (string)$result322;


        $result33=(int)$coffe;
        $result331=(int)$newquantity3;
        $result332= $result33+$result331;
        $result333= (string)$result332;
}

       
    
    
    $result = $db->query("UPDATE employee_qa SET three_in_one='".$result313."',coho='".$result323."',coffe='".$result333."' WHERE id_empl='".$newID."'  " );
    if($result)
    {
        echo "1";
    }

?>