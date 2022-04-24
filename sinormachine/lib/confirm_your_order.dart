import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinormachine/preorder.dart';
import 'package:http/http.dart' as http;
import 'all_pre_order_user.dart';
import 'client_TabBarDemo.dart';
import 'client_mydrawer.dart';
import 'my-globale.dart' as globals;

import 'mydrawer.dart';

class confirm_you_order extends StatefulWidget {
  const confirm_you_order({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<confirm_you_order> {
  String x;
  String price;
  String y;
  var zz = "";
  var x1;
  var drinks;

  Future generate_code_password() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/pre_order.php");
    Map<String, String> map = {
      "id_client": y.toString(),
      "numbers_of_Engines": x.toString(),
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

  Future balanc() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/balance.php");
    Map<String, String> map = {
      "email": (globals.currentuserss).toString(),
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

  /*Future price_of_all_material() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/price_of_material.php");
    Map<String, String> map = {
      "numbers_of_Engines": x.toString(),

    };
    try {
      var response = await http.post(url, body: jsonEncode(map));
      print(response.body);

      var responsebody = jsonDecode(response.body);
      print(responsebody);
      price=response.body;
      print(price);


      return price;
    } catch (e) {
      print(e);
      return false;
    }
  }*/
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
    x = rcvdData['numbers_of_Engines'];
    print("drinks:");
    print(x);
    print("drinks:");
    price = rcvdData['price'];
    print("price:");
    print(price);
    print("price:");

    zz = price;
    var q = zz.split("\n");
    print("7777");
    print(q);
    print("7777");
    print(q[2]);
    price = q[2];
    print(price);
    x1 = int.parse(x);

    if (x1 == 2002) {
      drinks = "3 in 1";
    } else if (x1 == 0202) {
      drinks = "cohco";
    } else if (x1 == 0022) {
      drinks = "coffe";
    } else if (x1 == 2202) {
      drinks = "mochachino";
    } else {
      if (x1 >= 0011 && x1 <= 0014) {
        drinks = "Special Test coffe";
      } else if (x1 == 0021) {
        drinks = "Special Test coffe";
      } else if (x1 >= 0023 && x1 <= 0044) {
        drinks = "Special Test coffe";
      } else if (x1 >= 0101 && x1 <= 0104) {
        drinks = "Special Test cohco";
      } else if (x1 == 0201) {
        drinks = "Special Test cohco";
      } else if (x1 >= 0203 && x1 <= 0404) {
        drinks = "Special Test cohco";
      }
      //3_in_1&&mochachino

      else if (x1 >= 1001 && x1 <= 1004) {
        drinks = "Special Test three_in_one";
      } else if (x1 >= 1101 && x1 <= 1104) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 1201 && x1 <= 1204) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 1301 && x1 <= 1304) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 1401 && x1 <= 1404) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 2001 && x1 <= 2004) {
        drinks = "Special Test three_in_one";
      } else if (x1 >= 2101 && x1 <= 2104) {
        drinks = "Special Test mochachino";
      } else if (x1 == 2201) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 2203 && x1 <= 2204) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 2301 && x1 <= 2304) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 2401 && x1 <= 2404) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 3001 && x1 <= 3004) {
        drinks = "Special Test three_in_one";
      } else if (x1 >= 3101 && x1 <= 3104) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 3201 && x1 <= 3204) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 3301 && x1 <= 3304) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 3401 && x1 <= 3404) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 4001 && x1 <= 4004) {
        drinks = "Special Test three_in_one";
      } else if (x1 >= 4101 && x1 <= 4104) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 4201 && x1 <= 4204) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 4301 && x1 <= 4304) {
        drinks = "Special Test mochachino";
      } else if (x1 >= 4401 && x1 <= 4404) {
        drinks = "Special Test mochachino";
      }
    }

    // price_of_all_material();
    //price=price.toString();
    //zz=price;

    return Scaffold(
        appBar: AppBar(
          title: Text("pre-order"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => preorder()),
                );
              },
            )
          ],
        ),
        drawer: client_MyDrawer(),
        body: Column(children: <Widget>[
          Text("${drinks}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),

          Text("price is:${price}",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          //ListTile(
          //title:
          Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        var result = await generate_code_password();
                        var bal = await balanc();
                        print(result);
                        print(bal);
                        globals.balance=bal.toString();
                        //SnackBar snackBar;

                        if (result > 0) {
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

                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => all_pre_order_user()),
                          );
                        } else {
                          /* snackBar = new SnackBar(content: new Text('Operation failed'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);*/

                          showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Operation failed" +
                                        "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  titlePadding:
                                      EdgeInsets.fromLTRB(15, 20, 15, 0),

                                  content: Column(
                                    children: <Widget>[
                                      Text(

                                            "your balance is:${bal}",

                                        style:
                                        TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold, ),
                                      ),
                                    ],
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 10, 15, 0),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  client_TabBarDemo()),
                                        );
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      },
                      child: Text("Confirm"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      )
                      /*color: Colors.brown,
                  textColor: Colors.white,*/
                      )),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(builder: (context) => preorder()),
                        );
                      },
                      child: Text("cancel"),
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
