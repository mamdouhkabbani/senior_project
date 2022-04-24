import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/drinks.dart';
import 'package:sinormachine/scan.dart';
import 'package:sinormachine/scan2.dart';
import 'package:sinormachine/signup2.dart';
import 'package:sinormachine/tabBar.dart';
import 'package:sinormachine/sendData.dart';

import 'Machine_need_servecing.dart';
import 'MyQuantity.dart';
import 'MyQuantity2.dart';
import 'Store_tabBar.dart';
import 'TabBarDemo2.dart';
import 'addemployee.dart';
import 'addstore.dart';
import 'drink2.dart';
import 'edit_profile2.dart';
import 'edit_profile3.dart';
import 'main.dart';
import 'my-globale.dart' as globals;
//store

class Store_Maydrawer extends StatefulWidget {
  Store_Maydrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<Store_Maydrawer> {
  @override
  void initState() {
    super.initState();
  }


  String userName1=globals.currentuserss;
  String fullName=globals.name;
  String balance=globals.balance;
  String image;

  @override
  Widget build(BuildContext context) {
    if(userName1=="mamdouhkabbani5@gmail.com"){
      image="images/mamdouh.jpg";

    }
    else if(userName1=="monzer.kidda@outlook.com"){
      image="images/monzer.jpg";
    }
    else if(userName1=="monzer.kid77@gmail.com"){
      image="images/monzer_admin.jpg";

    }
    else if(userName1=="seahyassen@hotmail.com"){
      image="images/sayyah.jpg";
    }
    else if(userName1=="mamdouhkabbani1995@yahoo.com"){
      image="images/mamdouh1.jpg";
    }
    else if(userName1=="kabbani-15-mamdouh@hotmail.com"){
      image="images/mamdouh2.jpg";

    }
    else if(userName1=="sedrajawish8@gmail.com"){
      image="images/sedra.jpg";

    }
    else{
      image="images/3_in_1.jpg";
    }



    return Drawer(


      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(

        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[

          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),


              child:ListView(
                children: [ Column(children: [
                  Container(),
                  UserAccountsDrawerHeader(
                      margin: const EdgeInsets.only(bottom: 20.0 ),

                      accountName: Container(child:Text(fullName),height: 20,) ,
                      accountEmail: Container(child:Text(userName1+"\n"+"Balance is:"+balance) ,height: 50, ),
                      currentAccountPicture:Container(height: 20,

                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,

                                image:
                                AssetImage(image),)))

                  ),

                  /*Text(
                      "Your Name is:"+fullName+"\n"+"Your Email is:"+userName1+"\n"+"Your Balance is:"+balance,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),*/

                ],)


                ],
              )
            /* Text(
                 "Your Name is:"+fullName+"\n"+"Your Email is:"+userName1+"\n"+"Your Balance is:"+balance,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),*/
          ),
          ListTile(
            title: Text('Edit Profile'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => edit_profile3()),
              );
            },
          ),
          ListTile(
            title: Text('Log out'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => HomePage()),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => Store_TabBar()),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(" Transport Material ",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            leading: Icon(
              Icons.wine_bar,
              color: Colors.brown,
              size: 25,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => drinks2()),
              );
            },
          ),


          ListTile(
            title: Text("Confairm Material",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            leading: Icon(
              Icons.qr_code_scanner,
              color: Colors.brown,
              size: 25,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => scan2()),
              );
              // Update the state of the app.
              // ...
            },
          ),

          ListTile(
            title: Text("MyQuantity",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            leading: Icon(
              Icons.qr_code_scanner,
              color: Colors.brown,
              size: 25,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => MyQuantity2()),
              );
              // Update the state of the app.
              // ...
            },
          ),


        ],
      ),
    );
  }
}
