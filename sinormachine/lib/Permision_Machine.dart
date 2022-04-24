
import 'my-globale.dart' as globals;
import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinormachine/tabBar.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'action_button.dart';
import 'alluserdetails.dart';

class Permision_Machine extends StatefulWidget {
  const Permision_Machine({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyPermision();
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyPermision createState() => _MyPermision();
}

String usid;
String id_op;

class _MyPermision extends State<Permision_Machine> {
  SingingCharacter _character;
  int flips = 1;

  List c = List();

  Future getData1() async {
    Uri url =
    Uri.parse("https://alumaracoffe.com/employee/list_viwe_type_users.php");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    c = responsebody;
    return c;
  }

  Future changepermision() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/permichine_Machine.php");
    Map<String, String> map = {
      "id": id_recipient.toString(),
      "location":location.toString(),
      "availability":avdis.toString(),
    };

    try {
      var response = await http.post(url, body: jsonEncode(map));
      print(response.body);
      id_op = (response.body).toString();

      var responsebody = jsonDecode(response.body);
      print(responsebody);

      return responsebody;
    } catch (e) {
      print(e);
      return false;
    }
  }



  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    getPref();

    getData1();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String dropdownValue;

  var id_empl;
  String name_empl;

  var location;
  bool valuesecond = false;


  var avdis;



  String kkk;
  String zezo;
  var type_id;
  String id_recipient;
  bool av=false;

  @override
  Widget build(BuildContext context) {

    Map rcvdData = ModalRoute.of(context).settings.arguments;
    kkk = rcvdData['name'];
    id_recipient = rcvdData['id_Machine'];

    zezo = rcvdData.toString();
    print(zezo);
    print(kkk);
    print(id_recipient);


    print(name_empl);
    print(type_id);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: Text("hot drink machine")),
        drawer: MyDrawer(),
        body: Column(
          children: <Widget>[
            Text(kkk,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center),
            Text("availability"),
            Checkbox(
              checkColor: Colors.greenAccent,
              activeColor: Colors.red,
              value: this.valuesecond,
              onChanged: (bool value) {
                setState(() {
                  this.valuesecond = value;

                  av = !av;

                });
              },
            ),
            Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(children: <Widget>[
                  Visibility(
                    visible: av,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child:OutlinedButton(
                      onPressed: () async {
                        avdis=1;

                      },
                      child: Text("enabled"),
                    ),),

                  Visibility(
                    visible: av,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child:   OutlinedButton(
                      onPressed: () async {
                        avdis=0;


                      },
                      child: Text("disabled"),
                    ),
                  ),



                ])),








              TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      labelText: 'Location',
                      hintText: 'Location',
                    ),
                    onChanged: (val) {
                      location = val;
                    }),


            /*  SizedBox(
            height: ,
          ),*/
            actionButton("send", onTap: () async {
              var result = await changepermision();
              if (result==1) {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => TabBarDemo()),
                );
              }
              else  {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "The process cannot be completed because ")));
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => TabBarDemo()),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
