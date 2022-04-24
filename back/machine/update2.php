<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/machine.php';
include_once '../objects/measurements.php';
 

// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare user object
$machine = new Machine($db);


$json = file_get_contents('php://input');
$data = json_decode($json);


if($data == null)
{
        $results=array(
            "status" => false,
            "message" => "invalid body"
        );
}
else
{


    if(!property_exists($data,'id'))
         $results=array(
            "status" => false,
            "message" => "id is null"
        );


    }
    
    else if($data->id == null || !is_int($data->id))
    {
         $results=array(
            "status" => false,
            "message" => "empty id or not integer"
        );
    }

    else
    {
        $machine->id = $data->id;

        $machine->name = $data->name;
        $machine->code = $data->code;
        if(property_exists($data,'address')) $machine->address = $data->address;
        else
            $machine->address = '';

        if(property_exists($data,'latitude')) $machine->latitude = $data->latitude;
         else
            $machine->latitude = 0;
        if(property_exists($data,'longitude')) $machine->longitude = $data->longitude;
          else
            $machine->longitude = 0;

        if(property_exists($data,'value1')) $machine->value1 = $data->value1;
          else
            $machine->value1 = 0;

        if(property_exists($data,'value2')) $machine->value2 = $data->value2;
          else
            $machine->value2 = 0;

        if(property_exists($data,'value3')) $machine->value3 = $data->value3;
          else
            $machine->value3 = 0;

        if(property_exists($data,'value4')) $machine->value4 = $data->value4;
          else
            $machine->value4 = 0;

        if(property_exists($data,'availability')) $machine->availability = $data->availability;
         else
            $machine->availability = 1;

        $stmt = $machine->update();
		if($stmt ){
		    $measurements = new Measurements($db, $machine);
             $measurements->add();

		    $results=array(
		        "status" => true,
		        "message" => "Updated Successfully!",
		        "id" => $machine->id,
		        "name" => $machine->name	
                	    );
		}
		else{
		    $results=array(
		        "status" => false,
		        "message" => "Not Updated",
		    );
		}
     
    }
    
}


// make it json format
print_r(json_encode($results));
?>