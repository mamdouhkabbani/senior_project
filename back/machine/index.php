<?php
header('Access-Control-Allow-Origin: *');
include "connect.php" ;
 $sql  = "SELECT * FROM employee" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute();
 $employee = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($employee) ; 