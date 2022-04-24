import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/client_TabBarDemo.dart';

import 'client_mydrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'my-globale.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//client

class edit_profile extends StatefulWidget {
  const edit_profile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}
String Old_password;
String New_password;
String Confairm_New_password;
String Old_Username;
String New_Username;

UserCredential userCredential;

Future update_password() async {
  Uri url = Uri.parse("https://alumaracoffe.com/employee/updatepassword.php");

  Map<String, String> map = {

    "email": (globals.currentuserss).toString(),
    "password": New_password.toString(),
    "old_password":Old_password.toString()

  };

  try {
    var response = await http.post(url, body: jsonEncode(map));
    print(response.body);
    var responsebody = jsonDecode(response.body);

    return responsebody.toString();
  } catch (e) {
    print(e);
    return false;
  }
}

Future change_username() async {
  Uri url = Uri.parse("https://alumaracoffe.com/employee/change_username.php");

  Map<String, String> map = {

    "email": (globals.currentuserss).toString(),
    "username": New_password.toString(),

  };

  try {
    var response = await http.post(url, body: jsonEncode(map));
    print(response.body);
    var responsebody = jsonDecode(response.body);

    return responsebody.toString();
  } catch (e) {
    print(e);
    return false;
  }
}
class _MyStatefulWidgetState extends State<edit_profile> {
  File image;
  final imagepicker=ImagePicker();


  uploadImage() async{
    var  pickedImage= await imagepicker.getImage(source:ImageSource.camera,imageQuality:
    80);


    if(pickedImage!=null){
      setState(() {
        image=File(pickedImage.path);


      });


    }
    else{}


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Edit_Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => client_TabBarDemo()),
              );
            },
          )
        ],
      ),
      drawer: client_MyDrawer(),
      body:
      ListView(scrollDirection: Axis.vertical,
          children: [
            Column(
              children:<Widget> [
                SizedBox(
                  height: 32,
                ),
                Text("Change Password",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
                SizedBox(
                  height: 20,
                ),

                TextFormField(





                    obscureText: true,

                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      labelText: 'Old Password',
                      hintText: 'Password',

                    ),


                    onChanged: (val){
                      setState(() {
                        Old_password=val;


                      });



                    }


                ),
                TextFormField(





                    obscureText: true,

                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      labelText: 'New Password',
                      hintText: 'Password',

                    ),


                    onChanged: (val){
                      setState(() {
                        New_password=val;


                      });



                    }


                ),
                TextFormField(





                    obscureText: true,

                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      labelText: 'Confairm New Password',
                      hintText: 'Password',

                    ),


                    onChanged: (val){
                      setState(() {
                        Confairm_New_password=val;



                      });



                    }


                ),
                OutlinedButton(
                  onPressed: () async {
                    if(New_password==Confairm_New_password){
                      try{
                        /* userCredential = await FirebaseAuth
                  .instance
                  .confirmPasswordReset(
                  email:globals.currentuserss , password: New_password);*/

                        Future.delayed(Duration(milliseconds: 1000), (){});
                        var result = await update_password();
                        if(result=="0"){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              action: SnackBarAction(
                                label: 'Action',
                                onPressed: () {
                                  // Code to execute.
                                },
                              ),
                              content: const Text(
                                  'The Old Password Are Not Correct'),
                              duration: const Duration(milliseconds: 5000),
                              width: 280.0,
                              // Width of the SnackBar.
                              padding: const EdgeInsets.symmetric(
                                horizontal:
                                8.0, // Inner padding for SnackBar content.
                              ),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          );


                        }
                        else if(result=="1"){
                          final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                          User currentUser = firebaseAuth.currentUser;
                          currentUser.updatePassword(New_password).then((_){
                            // Password has been updated.
                          }).catchError((err){
                            // An error has occured.
                            print("Password can't be changed" + err.toString());
                          });
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(builder: (context) => HomePage()),
                          );
                        }

                      }
                      on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');


                          final snackBar1 = SnackBar(
                            content: Text("The password provided is too weak. "),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar1);
                        }

                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Text("Save"),
                ),
                Divider(
                  color: Colors.grey,
                  height: 5,
                  indent: 10,
                  endIndent: 10,
                  thickness: 10,
                ),
                SizedBox(
                  height: 32,
                ),
                Text("Change User_Name",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
                SizedBox(
                  height: 20,
                ),

                TextFormField(



                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      labelText: 'New UserName',
                      hintText: 'UserName',

                    ),


                    onChanged: (val){
                      setState(() {
                        New_Username=val;


                      });



                    }


                ),

                OutlinedButton(
                  onPressed: () async {
                    var result = await change_username();
                    if(result!=null){
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text("Save"),
                ),

                Divider(
                  color: Colors.grey,
                  height: 5,
                  indent: 10,
                  endIndent: 10,
                  thickness: 10,
                ),
                RaisedButton(
                  onPressed: uploadImage,
                  child: Text("Upload Image",style: TextStyle(fontSize: 30,color: Colors.white),),

                ),



                image==null ? Text("Not Choosen Image"):
                Image.file(image)



              ],
            ),
          ])


    );
  }

}