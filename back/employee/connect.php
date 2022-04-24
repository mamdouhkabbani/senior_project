<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
 

$dsn = "mysql:host=localhost;dbname=company2" ;
$user = "root1" ;
$pass ="Ro0@t1!#" ;
$option = array(
   PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
);
try {
 	$con = new PDO($dsn , $user , $pass , $option);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


 }catch(PDOException $e) {
  echo $e->getMessage() ;
 }



?>


