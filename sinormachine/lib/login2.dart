
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/client_TabBarDemo.dart';
import 'package:sinormachine/constants.dart';
import 'package:sinormachine/action_button.dart';
import 'package:sinormachine/tabBar.dart';

import 'MyQuantity.dart';
import 'Store_tabBar.dart';
import 'TabBarDemo2.dart';
import 'apiClient.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';


import 'package:carousel_pro/carousel_pro.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'action_button.dart';
import 'constants.dart';
import 'my-globale.dart' as globals;



class LogIn2 extends StatefulWidget {
  final Function onSignUpSelected;



  LogIn2({@required this.onSignUpSelected});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn2> {

  Future<UserCredential> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });



    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  /*Future getinsertdata() async {
    Uri url = Uri.parse("https://alumaracoffe.com/employee/login2.php");

    Map<String, String> map = {

      "password":password.toString(),

      "username":email.toString(),


    };



    try {
      var response = await http.post(url, body: jsonEncode(map));
      print(response.body);
      var responsebody = jsonDecode(response.body);

      return responsebody['result'];
    } catch (e) {
      print(e);
      return false;
    }
  }*/

  List<String>list2;
  Future  getpostname() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/search_by-email_all.php");
    var response=await http.post(url,body:{"email":currentuser.toString()});
    var responsebody=jsonDecode(response.body);
    var result=response.body;
    print(result);

    var s1=result.split("[");
    var ll=s1.length;
    var zz="";
    for(int j=0;j<ll;j++){
      zz=zz+" "+s1[j];

    }
    print(zz);

    var s2=zz.split("{");
    var ll2=s2.length;
    var zz2="";
    for(int j=0;j<ll2;j++){
      zz2=zz2+" "+s2[j];

    }
    print(zz2);

    var s3=zz2.split("}");
    var ll3=s3.length;
    var zz3="";
    for(int j=0;j<ll3;j++){
      zz3=zz3+" "+s3[j];

    }
    print(zz3);

    var s4=zz3.split("]");
    var ll4=s4.length;
    var zz4="";
    for(int j=0;j<ll4;j++){
      zz4=zz4+" "+s4[j];

    }
    print(zz4);
    list2=zz4.split("\"");
    print(list2);

    print("first_name:"+list2[7]);

    print("last_name:"+list2[11]);
    var first_name=list2[7];
    var last_name=list2[11];
   print(first_name);
    print(last_name);
    globals.name=first_name+" "+last_name;
    print(globals.name);










    return responsebody;



  }
  Future availabilitylogin() async {
    Uri url = Uri.parse("https://alumaracoffe.com/employee/accountenable.php");

    Map<String, String> map = {


      "email":email.toString(),


    };



    try {
      var response = await http.post(url, body: jsonEncode(map));
      print("avv");
      print(response.body);
      print("avvvv");
      var responsebody = jsonDecode(response.body);
      print("avb");
      print(responsebody);
      print("avbb");



      return responsebody.toString();
    } catch (e) {
      print(e);
      return false;
    }
  }
  String us=globals.currentuserss;
  String usid;
  Future  getemailtid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/email_id.php");

    Map<String , String> map= {
      "email":currentuser.toString(),
    };

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);

      usid=(response.body).toString();
      print(usid);

      globals.iduser=usid.toString();
      print(globals.iduser);

      return usid;
    }catch( e){
      print(e);
      return false;
    }


  }

 List<String>list1;
  List<String>list3;
  Future test11() async {
    Uri url = Uri.parse("https://alumaracoffe.com/employee/testmamdouh.php");

    Map<String, String> map = {


      "email":email.toString(),


    };



    try {
      var response = await http.post(url, body: jsonEncode(map));

      print("test");
      print(response.body);
      var result=response.body;
      print("testtest");
      var responsebody = jsonDecode(response.body);
      print("atest");
      print(responsebody);

      print("avtest");
      var s1=result.split("[");
      var ll=s1.length;
      var zz="";
      for(int j=0;j<ll;j++){
        zz=zz+""+s1[j];

      }
      print(zz);

      var s2=zz.split("{");
      var ll2=s2.length;
      var zz2="";
      for(int j=0;j<ll2;j++){
        zz2=zz2+""+s2[j];

      }
      print(zz2);

      var s3=zz2.split("}");
      var ll3=s3.length;
      var zz3="";
      for(int j=0;j<ll3;j++){
        zz3=zz3+""+s3[j];

      }
      print(zz3);

      var s4=zz3.split("]");
      var ll4=s4.length;
      var zz4="";
      for(int j=0;j<ll4;j++){
        zz4=zz4+""+s4[j];

      }
      print(zz4);
      var s5=zz4.split("\"");
      var ll5=s5.length;
      var zz5="";
      for(int j=0;j<ll5;j++){
        zz5=zz5+""+s5[j];

      }
      print("------");
      print(zz5);
      print("------");

      var s6=zz5.split("\r\n");
      var ll6=s6.length;
      var zz6="";
      for(int j=0;j<ll6;j++){
        zz6=zz6+" "+s6[j];

      }
      print("------");
      print(zz6);
      print("------");

           var s7=zz6.replaceAll(":",",");
      var ll7=s7.length;
      var zz7="";
      for(int j=0;j<ll7;j++){
        zz7=zz7+""+s7[j];

      }
      print("------");
      print(zz7);
      print("------");


      list1=zz7.split(",");

      print(list1);
      print("------");
      print(list1.length);
      id_of_user=list1[1];
      globals.iduser=id_of_user.toString();
      print(globals.iduser);
      var balance=list1[25];
      var first_name=list1[3];
      var last_name=list1[5];
      print(first_name);
      print(last_name);
      globals.name=first_name+" "+last_name;
      globals.balance=balance;
      print(globals.name);
      avabl=list1[27];

      typ_user=list1[19];
      globals.typeofuser=typ_user;














      return responsebody.toString();
    } catch (e) {
      print(e);
      return false;
    }
  }



  Future getType_of_user() async {
    Uri url = Uri.parse("https://alumaracoffe.com/employee/user_permissions.php");

    Map<String, String> map = {


      "email":currentuser.toString(),


    };


var x;
    try {
      var response = await http.post(url, body: jsonEncode(map));
      print("ppppppppp");
      print(response.body);
      print("ppppppppp");


      var responsebody = jsonDecode(response.body);
      print("zzzzzzzzz");
      print(responsebody);
      print("zzzzzzzzz");


      globals.typeofuser=responsebody.toString();
      //print("glob="+globals.typeofuser);
     // var rspone1=responsebody.toString();


      return responsebody.toString();
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future balanc() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/balance.php");
    Map<String, String> map = {
      "email": currentuser.toString(),
    };
    try {
      var response = await http.post(url, body: jsonEncode(map));
      print(response.body);

      var responsebody = jsonDecode(response.body);
      print(responsebody);


      return responsebody;
    } catch (e) {
      print(e);
      return false;
    }
  }

  String email;
  String password;
  UserCredential userCredential;
  String currentuser ;
  var typ_user;

  String avabl;
  var id_of_user;
  var xx;
var tts;




  @override
  initState() {




    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(

      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
          ? 32
          : 16),
      child: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                    ? 0.8
                    : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(

                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                          onChanged: (val){
                            email=val;

                          }
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        obscureText: true,

                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock_outline,
                          ),
                        ),
                          onChanged: (val){
                            password=val;

                          }
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      actionButton("Log In" ,

                        onTap: () async {
                         // typ_user=await getType_of_user();

                          tts=await test11();
                          print(tts);


                        //avabl=await availabilitylogin();
                        //xx=await getpostname();










                          try {

                             userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email.toString(),
                                password: password.toString(),
                            );
                             print(userCredential);



                             if(userCredential!= null)
                             {

                               if(avabl=="1")
                               {

                                 if(userCredential.user.emailVerified==true)
                                 {
                                   isAdmin=false;
                                   avalabiles=false;

                                   if(typ_user=="1"){
                                     //admin
                                     isAdmin=true;
                                     avalabiles=true;
                                      Navigator.pushReplacement(
                                       context,
                                       CupertinoPageRoute(
                                           builder: (context) => TabBarDemo())
                                   );
                                   }

                                   else if(typ_user=="2"){
                                     //client

                                     Navigator.pushReplacement(
                                         context,
                                         CupertinoPageRoute(
                                             builder: (context) => client_TabBarDemo())
                                     );
                                   }
                                   else if(typ_user=="3"){
                                     //employee
                                     avalabiles=true;
                                     Navigator.pushReplacement(
                                         context,
                                         CupertinoPageRoute(
                                             builder: (context) => TabBarDemo2())
                                     );
                                   }
                                   else if(typ_user=="4"){}
                                   else if(typ_user=="5"){
                                     //store
                                     Navigator.pushReplacement(
                                         context,
                                         CupertinoPageRoute(
                                             builder: (context) => Store_TabBar())
                                     );
                                   }
                                  /* Navigator.pushReplacement(
                                       context,
                                       CupertinoPageRoute(
                                           builder: (context) => TabBarDemo())
                                   );*/
                                   currentuser =userCredential.user.email.toString();
                                   //print(currentuser);
                                   /*await Navigator.pushNamed(context, 'main',
                             arguments:{"currentuser":currentuser});*/
                                   globals.currentuserss=currentuser;

                                 }

                                 else if(userCredential.user.emailVerified==false)
                                 {


                                   final snackBar3 = SnackBar(
                                     content: Text(
                                         "we send Verified to your email , Verified and try agin  "),
                                     action: SnackBarAction(
                                       label: 'Undo',
                                       onPressed: () {},
                                     ),
                                   );
                                   Scaffold.of(context).showSnackBar(snackBar3);
                                   print('we send Verified to your email , Verified and try agin ');
                                 }

                               }
                               else if(avabl=="0"){
                                 final snackBar4 = SnackBar(
                                   content: Text(
                                       "The account is disabled and you can not login please contact the manager "),
                                   action: SnackBarAction(
                                     label: 'Undo',
                                     onPressed: () {},
                                   ),
                                 );
                                 Scaffold.of(context).showSnackBar(snackBar4);
                                 print('The account is disabled and you can not login please contact the manager  ');

                                 /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                     content: Text(
                                         "The account is disabled and you can not login please contact the manager")));*/
                               }



                             }
                          ////lllll



                          }



                          on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found')
                            {
                              print('No user found for that email.');



                                final snackBar1 = SnackBar(
                                  content: Text(
                                      "No user found for that email. "),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar1);


                            }
                            else if (e.code == 'wrong-password')
                            {
                              print('Wrong password provided for that user.');



                                final snackBar2 = SnackBar(
                                  content: Text(
                                      "Wrong password provided for that user. "),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar2);


                            }
                          }
                          print(userCredential);







                          //bool result = await getinsertdata();


                         /* if(result != null)
                          {

                              Navigator.pushReplacement (
                                context,
                                CupertinoPageRoute(builder: (context) =>  TabBarDemo()),
                              );




                              final snackBar = SnackBar(
                                content: Text("valid user name or password "),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {

                                  },
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);


                          }*/




                          //id_of_user=await getemailtid();
                         // print("id_user:"+id_of_user);
                         // typ_user=await getType_of_user();
                          //print("typ_user:\n"+typ_user);

                         // xx=await getpostname();



                        },
                      ),

                      SizedBox(
                        height: 32,
                      ),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () async {
                         UserCredential c =await signInWithGoogle();

                         //print(c);
                         Navigator.pushReplacement(
                             context,
                             CupertinoPageRoute(
                                 builder: (context) => TabBarDemo())
                         );
                         currentuser =c.user.displayName.toString();
                         print(currentuser);



                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),


                      Container(height: 20,child: ListView(scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [




                            Text(
                              "You do not have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),

                            SizedBox(

                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.onSignUpSelected();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: kPrimaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                      ),

                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
