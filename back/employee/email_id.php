<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");


$servername = "localhost";

// REPLACE with your Database name
$dbname = "company2";
// REPLACE with Database user
$username = "root1";
// REPLACE with Database user password
$password = "Ro0@t1!#";
$momo ="";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error)
{ 
    die("Connection failed: " . $conn->connect_error);
} 
  $json = file_get_contents('php://input');
  $soso=json_decode($json,true);
  $momo=$soso['email']; 
  $sql= "SELECT * FROM users_company  WHERE email = '".$momo."' ";
  $result = $conn->query($sql);
  $m11to1 = mysqli_fetch_array($result);
  $lecture = $m11to1["id"] ?? null;
//$balance = json_encode(array_reverse(array_column($list, 'balance')), JSON_NUMERIC_CHECK);
echo $lecture;
//$result->free();
//$conn->close();
 ?>