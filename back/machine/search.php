 <?php

include "connect.php" ;
 
 $sql  = "SELECT * FROM employee" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
 $mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($mobiles) ; 
