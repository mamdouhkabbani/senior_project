<?php
// include database and object files
include_once 'connect.php';
include_once 'user.php';


// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare user object
$user = new User($db);

$json = file_get_contents('php://input');
$data = json_decode($json);

if($data == null)
{
        $user_arr=array(
            "status" => false,
            "message" => "invalid body"
        );
}
else
{
     if(!property_exists($data,'username') || !property_exists($data,'password'))
         $user_arr=array(
            "status" => false,
            "message" => "username or password is null"
        );

    else if($data->username == null || $data->username == '')
    {
         $user_arr=array(
            "status" => false,
            "message" => "empty username"
        );
    }
    else if ($data->password == null || $data->password == '') {
        $user_arr=array(
            "status" => false,
            "message" => "empty password"
        );
    }
    else
    {
        $user->username = $data->username;
        $user->password = base64_encode($data->password);
        $user->created = date('Y-m-d H:i:s');

        $stmt = $user->login();
		if($stmt->rowCount() > 0){
		    // get retrieved row
		    $row = $stmt->fetch(PDO::FETCH_ASSOC);
		    // create array
		    $user_arr=array(
		        "status" => true,
		        "message" => "Successfully Login!",
		        "id" => $row['id'],
		        "username" => $row['username'],
                "name" => $row['name'],
               // "role_name" => $row['role_name'],
		    );
		}
		else{
		    $user_arr=array(
		        "status" => false,
		        "message" => "Invalid Username or Password!",
		    );
		}
     
    }
    
}


// make it json format
print_r(json_encode($user_arr));
?>