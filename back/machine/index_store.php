<?php
header('Access-Control-Allow-Origin: *');
include "connect.php" ;
 $sql  = "SELECT * FROM store" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute();
 $store = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($store) ; 