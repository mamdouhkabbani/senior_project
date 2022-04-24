import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinormachine/mydrawer2.dart';
import 'package:sinormachine/preorder.dart';
import 'package:http/http.dart' as http;
import 'all_pre_order_user.dart';
import 'client_TabBarDemo.dart';
import 'client_mydrawer.dart';
import 'my-globale.dart' as globals;

import 'mydrawer.dart';

class Machine_need_Servecing extends StatefulWidget {
  const Machine_need_Servecing({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<Machine_need_Servecing> {
  String x;
  String price;
  String y;
  var zz = "";
  var x1;
  var drinks;

  Future generate_code_password() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/Machine_need_servecing.php");
    Map<String, String> map = {
      "id_client": y.toString(),

    };
    try {
      var response = await http.post(url, body: jsonEncode(map));
      print(response.body);

      var responsebody = jsonDecode(response.body);
      print(responsebody);
      print(y);

      return responsebody;
    } catch (e) {
      print(e);
      return false;
    }
  }




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










    return Scaffold(
        appBar: AppBar(
          title: Text("Machine_need-Servecing"),
          actions: <Widget>[

          ],
        ),
        drawer: MyDrawer2(),
        body: Column(children: <Widget>[



          //ListTile(
          //title:
          Padding( padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
          Row(
            children: <Widget>[

              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        var result = await generate_code_password();



                        //SnackBar snackBar;

                        if (result !="0000") {
                          /*snackBar = new SnackBar(content: new Text("Operation completed successfully"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);*/

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              action: SnackBarAction(
                                label: 'Action',
                                onPressed: () {
                                  // Code to execute.
                                },
                              ),
                              content: const Text(
                                  'Operation completed successfully'),
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

                          await Navigator.pushNamed(context, 'Test_Machine_need_servecing',
                              arguments: {
                                "Code": result,


                              });
                        }
                      },
                      child: Text("Servece_Machine"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      )

                  )),

            ],
          ),
          // ),
        ]));
  }
}
