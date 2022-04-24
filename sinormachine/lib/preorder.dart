import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinormachine/tabBar.dart';
import 'package:sinormachine/yourmode_cohco.dart';
import 'package:sinormachine/yourmode_mochachino.dart';
import 'package:sinormachine/yourmode_three_in_one.dart';
import 'all_pre_order_user.dart';
import 'client_TabBarDemo.dart';
import 'client_mydrawer.dart';
import 'yourmode_coffe.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'action_button.dart';
import 'alluserdetails.dart';
import 'my-globale.dart' as globals;

class preorder extends StatefulWidget {
  const preorder({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<preorder> {
  SingingCharacter _character;
  int flips = 1;
  String y;
  String x;
  String price;
  var result1=1;

  List c = List();

  Future getData1() async {
    Uri url =
        Uri.parse("https://alumaracoffe.com/employee/viwe_all_material.php");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    c = responsebody;
    return c;
  }
  Future price_of_all_material() async {
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
  }

  /*Future generate_code_password() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/pre_order.php");
    Map<String, String> map = {
      "id_client": y.toString(),
      "numbers_of_Engines": x,

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
  }*/

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    getData1();
    getPref();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String dropdownValue;

  var id_empl;
  var name_empl="1";

  //bool x=true;
  SingingCharacter value = SingingCharacter.lafayette;

  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;

  _buildDropDown(bool enable) {
    if (enable) {
      return DropdownButton(
        hint: Text("the names"),
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        items: c.map((c) {
          return DropdownMenuItem(
            value: c['name'],
            child: Text(c['name']),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
            name_empl = newValue;
            flips = 2;
          });
        },
      );
    } else {
      // Just Divider with zero Height xD
      return Divider(color: Colors.white, height: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    y = globals.iduser;

    if (name_empl == "three_in_one") {
      x = "2002";
    } else if (name_empl == "cohco") {
      x = "0202";
    } else if (name_empl == "coffe") {
      x = "0022";
    } else if (name_empl == "mochachino") {
      x = "2202";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("pre-order"),
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
      body: Column(
        children: <Widget>[
          Divider(
            color: Colors.grey,
            height: 5,
            indent: 10,
            endIndent: 10,
          ),
          Text("Choose Your Drink",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          ListTile(
            title: const Text('Choose Your Order'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  _checkboxListTile1 = !_checkboxListTile1;

                });
              },
            ),
          ),
          _buildDropDown(_checkboxListTile1),
          Container(
            height: 100,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  onPressed: () async {
                    var result = await price_of_all_material();
                     result1=int.parse(result);
                    if ( result1>1&&name_empl!="1") {
                    /*  Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => all_pre_order_user()),
                      );*/
                      await Navigator.pushNamed(context, 'confirm_your_order',
                          arguments: {
                            "numbers_of_Engines": x,
                            "price":price

                          });
                    }
                  },
                  child: Text("OK"),
                  color: Colors.brown,
                  textColor: Colors.white,
                )),
                Expanded(
                    child: RaisedButton(
                  onPressed: () async {
                    var result;
                    result = x;
                    if (result == "2002") {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => yourmode_three_in_one()),
                      );
                    } else if (result == "0202") {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => yourmode_cohco()),
                      );
                    } else if (result == "0022") {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => yourmode_coffe()),
                      );
                    } else if (result == "2202") {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => yourmode_mochachino()),
                      );
                    }
                  },
                  child: Text("Special Taste"),
                  color: Colors.brown,
                  textColor: Colors.white,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
