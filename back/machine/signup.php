<?php
 header("Access-Control-Allow-Origin: *");
// get database connection
include_once 'connect.php';
 
// instantiate user object
include_once 'user.php';
 
$database = new Database();
$db = $database->getConnection();
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

         $user->first_name = $data->first_name;
         $user->last_name = $data->last_name;
         $user->email=$data->email;
         $user->password = base64_encode($data->password);
          $user->mobile_number=$data->mobile_number;
           $user->gender=$data->gender;
        $user->date_of_birthday=$data->date_of_birthday;
        $user->username = $data->username; 
        $user->created = date('Y-m-d H:i:s');
    
        /*if(property_exists($data,'first_name')){
              $user->first_name = $data->first_name;
          }
          if(property_exists($data,'last_name')){
              $user->last_name = $data->last_name;
          }
         
        if($user->signup()){
            $user_arr=array(
                "status" => true,
                "message" => "Successfully Signup!",
                "id" => $user->id,
                "first_name"=>$user->first_name,
                 "last_name"=>$user->last_name,
                 "email"=>$user->email ,
                 "password"=>$user->password ,
                 "mobile_number"=>$user->mobile_number ,
                 "gender"=>$user->gender ,
               "date_of_birthday"=>$user->date_of_birthday ,
                "username" => $user->username
               
               
               
                
            );
        }
        else{
            $user_arr=array(
                "status" => false,
                "message" => "username already exists!"
            );
            }
    }
    
}


print_r(json_encode($user_arr));
?>