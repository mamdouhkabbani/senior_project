<?php
header('Access-Control-Allow-Origin: *');
include "connect.php" ;
 $sql  = "SELECT id,first_name,last_name,email FROM users_company WHERE type_of_user =3" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute();
 $employee = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($employee) ; 
 ?>