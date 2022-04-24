/*
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:sinormachine/models/MachineListResponseModel.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'constants.dart';
import 'constants.dart';
import 'models/login_response_model.dart';
class API
{
  static String baseURL ='https://alumaracoffe.com/coffee';
   static String baseURL1 ='https://alumaracoffe.com/employee';


  static Future<LoginResponseModel> login(String username , String password) async {
    Uri url=Uri.parse( baseURL+'/api/User/login.php');
  var params = {
    "username":username,
    "password":password
  };
  var body =json.encode(params);


  try {
    var response = await http.post(url,body: body);
    print(response.body);
     if (response.statusCode == 200) {
       //todo
       if(username == "admin")
         isAdmin=true;
       else
         isAdmin = false;

    var jsonResponse = convert.jsonDecode(response.body);
     print('http jsonResponse: $jsonResponse.');
    var model = LoginResponseModel.fromJson(jsonResponse);
    userName = model.username;
    return model;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }

  } catch (e ,s) {
    print(e);
    print(s);
    return null;

  }
  
 
}


 static Future<LoginResponseModel> signup(String first_name,String last_name,String email,String password,
     String mobile_number ,String gender ,String DOB , String USERNAME,) async {
   Uri url=Uri.parse( baseURL1+'/signup.php');
  var params = {
    "first_name ":first_name,
    "last_name ":last_name,
    "email ":email,
    "password":password,
    "mobile_number":mobile_number,
    "gender":gender,
    "date_of_birthday":DOB,
    "username":USERNAME,

  };
  var body =json.encode(params);


  try {
    var response = await http.post(url,body: body);
     if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(response.body);
     print('http jsonResponse: $jsonResponse.');
    var model = LoginResponseModel.fromJson(jsonResponse); 
    return model;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }

  } catch (e ,s) {
    print(e);
    print(s);
    return null;

  }
  
 
}

  static Future<MachineListResponseModel> getAllMachine( ) async {
    Uri url=Uri.parse( baseURL+'/api/Machine/getAll.php');


    try {
      var response = await http.post(url );
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print('http jsonResponse: $jsonResponse.');
        var model = MachineListResponseModel.fromJson(jsonResponse);
        return model;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }

    } catch (e ,s) {
      print(e);
      print(s);
      return null;
    }
  }

  static Future<MachineListResponseModel> addMachine(String name , String address,String code) async {
    Uri url=Uri.parse(baseURL+'/api/Machine/insert.php');
    var params = {
      "name":name,
      "address":address,
      "code":code
    };
    var body =json.encode(params);


    try {
      var response = await http.post(url,body: body);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResponse = convert.jsonDecode(response.body);
        print('http jsonResponse: $jsonResponse.');
        var model = MachineListResponseModel.fromJson(jsonResponse);
        return model;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }

    } catch (e ,s) {
      print(e);
      print(s);
      return null;

    }


  }

}
*/
