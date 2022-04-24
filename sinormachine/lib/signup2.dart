import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/tabBar.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/constants.dart';

import 'action_button.dart';
import 'constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';



import 'package:sinormachine/tabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/constants.dart';
import 'package:sinormachine/action_button.dart';
import 'package:intl/intl.dart';

import 'login2.dart';

class SEND3 extends StatefulWidget {
  //const SEND2({Key key}) : super(key: key);

  final Function onLogInSelected;

  SEND3({@required this.onLogInSelected});

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

class MyStatefulWidget extends StatefulWidget {

  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SEND3> {

  Future getinsertdata() async {
    Uri url = Uri.parse("https://alumaracoffe.com/employee/signup3.php");

    Map<String, String> map = {
      "first_name": first_name.toString(),
      "last_name": last_name.toString(),
      "email": email.toString(),
      "password": password.toString(),
      "mobile_number": mobile_number.toString(),
      "gender": dropdownValue.toString(),
      "date_of_birthday": date3.toString(),
      "username": username.toString(),
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
  }


  //variables
  String first_name;
  String last_name;
  String email;
  String password;
  //String epassword;
  String mobile_number;
  String gender;
  String date_of_birthday;
  String username;
  UserCredential userCredential;
  final format = DateFormat("yyyy-MM-dd");
  DateTime date3;
  String dropdownValue;






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
                        "SIGN UP",
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



                      ////

                      TextField(
                          decoration: InputDecoration(
                            hintText: 'first_name',
                            labelText: 'first_name',
                            suffixIcon: Icon(
                              Icons.person_outline,
                            ),
                          ),
                          onChanged: (val) {
                            first_name = val;
                          }),
                      TextField(
                          decoration: InputDecoration(
                            hintText: 'last_name',
                            labelText: 'last_name',
                            suffixIcon: Icon(
                              Icons.person_outline,
                            ),
                          ),
                          onChanged: (val) {
                            last_name = val;
                          }),
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
                          onChanged: (val) {
                            email = val;
                          }),
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
                          onChanged: (val) {
                            password = val;

                          }),
                      TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'mobile_number',
                            labelText: 'mobile_number',
                            suffixIcon: Icon(
                              Icons.phone_iphone,
                            ),
                          ),
                          onChanged: (val) {
                            mobile_number = val;
                          }),
                     /* TextField(
                          decoration: InputDecoration(
                            hintText: 'gender',
                            labelText: 'gender',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                          onChanged: (val) {
                            gender = val;
                          }),*/
                      DropdownButton<String>(
                        value: dropdownValue,
                        hint: Text("the gender"),
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: ( newValue) {
                          setState(() {
                            dropdownValue = newValue;

                          });
                        },
                        items: <String>['male', 'female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),


                      ),
                      /*TextField(
                          decoration: InputDecoration(
                            hintText: 'DOB:yyyy-mm-dd',
                            labelText: 'DOB',
                            suffixIcon: Icon(
                              Icons.date_range,
                            ),
                          ),
                          onChanged: (val) {
                            date_of_birthday = val;
                          }),*/
                      SizedBox(
                        height: 64,
                      ),
                      Text('Basic date field (${format.pattern})'),


                      DateTimeField(
                        format: format,

                        onSaved: (val) => setState(() => date3 = val),
                        keyboardType: TextInputType.datetime,
                        onChanged: (DateTime newValue) {
                          setState(() {
                            date3 = newValue;
                            print(date3);
                          });
                        },

                        onShowPicker: (context, currentValue) {

                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },



                      ),

                      TextField(
                          decoration: InputDecoration(
                            hintText: 'USERNAME',
                            labelText: 'USERNAME',
                            suffixIcon: Icon(
                              Icons.supervised_user_circle,
                            ),
                          ),
                          onChanged: (val) {
                            username = val;
                          }),
                      SizedBox(
                        height: 64,
                      ),

                      SizedBox(
                        height: 64,
                      ),


                      actionButton("Create Account", onTap: () async {
                        try {

                           userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);
                          print(userCredential);

                           if(userCredential.additionalUserInfo.isNewUser) {
                             if(userCredential.user.emailVerified==false){
                             User user = FirebaseAuth.instance.currentUser;
                               await user.sendEmailVerification();
                               final snackBar3 = SnackBar(
                                 content: Text(
                                     "we send Verified to your email "),
                                 action: SnackBarAction(
                                   label: 'Undo',
                                   onPressed: () {},
                                 ),
                               );
                               Scaffold.of(context).showSnackBar(snackBar3);
                             }
                             Future.delayed(Duration(milliseconds: 1000), (){});

                             bool result = await getinsertdata();

                             if(userCredential.user.emailVerified==false){
                               if (result != null) {
                                 widget.onLogInSelected();
                               }

                             }


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
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                            final snackBar2 = SnackBar(
                              content: Text("The account already exists for that email. "),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {},
                              ),
                            );
                            Scaffold.of(context).showSnackBar(snackBar2);



                          }

                        } catch (e) {
                          print(e);
                        }
                      }),

                      SizedBox(
                        height: 32,
                      ),
                  Container(height: 20,child:ListView(scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
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
                                widget.onLogInSelected();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Log In",
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

                      ])),


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
