<?php
    header('Access-Control-Allow-Origin: *');
    $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db){
     echo "Database connect error".mysqli_error();
    }
     $json = file_get_contents('php://input');
// Converts it into a PHP object 
    $data = json_decode($json, true);
    $newValue =$data['email'];
    $newBalance=$data['balance'];
    //$newValue1 =$_POST['email'];

    $list = array();
    $result1=$db->query("SELECT balance FROM users_company Where email='" .$newValue."' " );
        //echo $result1;
    
    if($result1){
       
       $m11to1 = mysqli_fetch_array($result1);
       $lecture = $m11to1["balance"] ?? null;
     
        $result3=(int)$lecture;
        $result4=(int)$newBalance;
        $result5=$result3+$result4;
        $result2=(string)$result5;
    }
    
    $result = $db->query("UPDATE users_company SET balance='".$result2."' WHERE email='" .$newValue."'  " );
    if($result)
    {
        echo "1";
    }

?>