<?php
header('Access-Control-Allow-Origin: *');
include "connect.php" ;
 $id_client= $_POST['id_client'];
 $sql  = "SELECT numbers_of_Engines,auto_generate_code,auto_generate_password,time_order,status FROM preorder  WHERE id_client= '.$id_client.' " ;  
 $stmt = $con->prepare($sql);
 $stmt->execute();
 $employee = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($employee) ; 
 ?>