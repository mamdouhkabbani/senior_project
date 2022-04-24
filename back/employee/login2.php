 <?php
include "connect.php";
 $db=mysqli_connect("localhost","root1","Ro0@t1!#","company2");
    if(!$db)
    {
     echo "Database connect error".mysqli_error();
    }
     $json = file_get_contents('php://input');
	// Converts it into a PHP object 
	$data = json_decode($json, true);


  $username = $_POST['username']  ;
  $password = $_POST['password'] ;

  $stmt = $con->prepare("SELECT * FROM users_company WHERE username = ? AND password = ?") ;
  $stmt->execute(array($username , $password));

  $user = $stmt->fetch() ;

   $row = $stmt->rowcount()  ;

   if ($row > 0) {

       $id = $user['id'] ;
      


       $username  = $user['username'] ;
       
       $password  = $user['password'] ;
       echo json_encode(array('id' => $id , 'username' => $username ,'password' => $password , 'status' => "success"));
   }else {
     echo json_encode (array('status' => "faild" , 'username' => $username  , 'password' => $password) );
 }



?>
