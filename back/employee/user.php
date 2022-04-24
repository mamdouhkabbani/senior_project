<?php

class User{
 
    // database connection and table name
    private $conn;
    private $table_name = "users_company";
 
    // object properties
    public $id;
    public $username;
    public $password;
    public $created;
    public $first_name;
    public $last_name;
    public $email;
    public $mobile_number;
    public $gender;

    public $date_of_birthday;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    //user signup method
    function signup()
    {
    
    
        if($this->isAlreadyExist())
        {
            return false;
        }
      
        // query to insert record of new user signup
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                first_name=:first_name,last_name=:last_name,email=:email,password=:password,mobile_number=:mobile_number,gender=:gender,date_of_birthday=:date_of_birthday, username=:username, 
                     created=:created";
    
        // prepare query
        $stmt = $this->conn->prepare($query);
    
        // sanitize
        $this->username=htmlspecialchars(strip_tags($this->username));
        $this->password=htmlspecialchars(strip_tags($this->password));
        $this->first_name=htmlspecialchars(strip_tags($this->first_name));
        $this->last_name=htmlspecialchars(strip_tags($this->last_name));
        $this->email=htmlspecialchars(strip_tags($this->email));
        $this->mobile_number=htmlspecialchars(strip_tags($this->mobile_number));
        $this->gender=htmlspecialchars(strip_tags($this->gender));
        $this->date_of_birthday=htmlspecialchars(strip_tags($this->date_of_birthday));

        $this->created=htmlspecialchars(strip_tags($this->created));
    
        // bind values
        $stmt->bindParam(":username", $this->username);
        $stmt->bindParam(":password", $this->password);
        $stmt->bindParam(":first_name", $this->first_name);
        $stmt->bindParam(":last_name", $this->last_name);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":mobile_number", $this->mobile_number);
        $stmt->bindParam(":gender", $this->gender);
        $stmt->bindParam(":date_of_birthday", $this->date_of_birthday);
        $stmt->bindParam(":created", $this->created);
    
        // execute query
        
        if($stmt->execute())
        {
            $this->id = $this->conn->lastInsertId();
            return true;
        }
    
        return false;

          
    }
  

    // login user method
    function login(){
        // select all query with user inputed username and password
        $query = "SELECT
                    `id`, `username`, `password`, `first_name`,`last_name`,`email`,`mobile_number`,`gender`,`date_of_birthday`, `created` , `role_name`
                FROM
                    " . $this->table_name . " 
                WHERE
                    username='".$this->username."' AND password='".$this->password."'";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }

    //Notify if User with given username Already exists during SignUp
    function isAlreadyExist(){
        $query = "SELECT *
            FROM
                " . $this->table_name . " 
            WHERE
                username='".$this->username."'";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        if($stmt->rowCount() > 0){
            return true;
        }
        else{
            return false;
        }
    }
}
?>