import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinormachine/mydrawer2.dart';
import 'package:sinormachine/preorder.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/refill_machine.dart';
import 'all_pre_order_user.dart';
import 'client_TabBarDemo.dart';
import 'client_mydrawer.dart';
import 'my-globale.dart' as globals;

import 'mydrawer.dart';

class Test_Machine_need_servecing extends StatefulWidget {
  const Test_Machine_need_servecing({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<Test_Machine_need_servecing> {
  var x;

  String y;







  @override
  void initState() {
    //price_of_all_material();

    super.initState();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    y = globals.iduser;
    Map rcvdData = ModalRoute.of(context).settings.arguments;
    print("recive:");
    print(rcvdData);
    print("recive:");
    x = rcvdData['Code'];
    print("drinks:");
    print(x);
    print("drinks:");


    // price_of_all_material();
    //price=price.toString();
    //zz=price;

    return Scaffold(
        appBar: AppBar(
          title: Text("pre-order"),
          actions: <Widget>[

          ],
        ),
        drawer: MyDrawer2(),
        body: Column(children: <Widget>[
          Text("${x}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),


          //ListTile(
          //title:
          Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {

                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  Refill()),
                        );
                      },
                      child: Text("Confirm"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      )
                    /*color: Colors.brown,
                  textColor: Colors.white,*/
                  )),

            ],
          ),
          // ),
        ]));
  }
}
