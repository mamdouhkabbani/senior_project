
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

class Mypermision extends StatefulWidget {
  const Mypermision({Key key}) : super(key: key);

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

class _MyPermision extends State<Mypermision> {
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
    Uri url = Uri.parse("https://alumaracoffe.com/employee/edite_parmison.php");
    Map<String, String> map = {
      "id": id_recipient.toString(),
      "type_of_user": type_id.toString(),
      "max_three_in_one": three_in_one.toString(),
      "max_choco": coho.toString(),
      "max_coffe": coffe.toString(),
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

/*  Future  getpostname() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/search_by-email_all.php");
    var response=await http.post(url,body:{"email":name_empl});
    var responsebody=jsonDecode(response.body);

    return responsebody;



  }

  Future  getpostid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/search_by_id_all.php");
    var response=await http.post(url,body:{"id":id_empl});
    var responsebody=jsonDecode(response.body);

    return responsebody;



  }*/

  /* Future foo(int flips_int) async {
    var container_fun;
    if(flips_int==1){
      container_fun = await getData1();
    }
  */ /*  else if(flips_int==2){
      container_fun = await getpostname();
    }
    else if(flips_int==3){
      container_fun = await getpostid();
    }*/ /*

    return container_fun;

  }*/

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
  var three_in_one;
  var coho;
  var coffe;
  bool valuesecond = false;

  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  var avdis;

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
          });
        },

        /*    .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),


          );
        }).toList(),*/
      );
    } else {
      // Just Divider with zero Height xD
      return Divider(color: Colors.white, height: 0.0);
    }
  }

  String kkk;
  String zezo;
  var type_id;
  String id_recipient;
  bool av=false;

  @override
  Widget build(BuildContext context) {
    bool v = false;
    Map rcvdData = ModalRoute.of(context).settings.arguments;
    kkk = rcvdData['name'];
    id_recipient = rcvdData['id_recipient'];

    zezo = rcvdData.toString();
    print(zezo);
    print(kkk);
    print(id_recipient);

    if (name_empl == 'admin') {
      v = false;
      type_id = 1;
      three_in_one = 0;
      coho = 0;
      coffe = 0;
    } else if (name_empl == 'client') {
      v = false;
      type_id = 2;
      three_in_one = 0;
      coho = 0;
      coffe = 0;
    } else if (name_empl == 'employee') {
      v = true;
      type_id = 3;
    } else if (name_empl == 'machine') {
      v = true;
      type_id = 4;
    } else if (name_empl == 'store') {
      v = true;
      type_id = 5;
    }
    print(name_empl);
    print(type_id);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: Text("Permision")),
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
            ListTile(
              title: const Text(' show types'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                    _checkboxListTile1 = !_checkboxListTile1;
                    _checkboxListTile2 = false;
                  });
                },
              ),
            ),
            _buildDropDown(_checkboxListTile1),

            /* ListTile(
            title: const Text('enter id of recipient '),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (  SingingCharacter value) {
                setState(() {
                  _character = value;
                  _checkboxListTile2 = !_checkboxListTile2;
                  _checkboxListTile1 =false;
                });
              },
            ),
          ),*/

            /*  Divider(
            color: Colors.grey,
            height: 5,
            indent: 10,
            endIndent: 10,
          ),
          TextFormField(
              readOnly:!_checkboxListTile2 ,
              keyboardType: TextInputType.number,




              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)
                ),
                labelText: 'ID',
                hintText: 'Enter NUMBER',

              ),


              onChanged: (val){
                setState(() {
                  id_empl=val;
                  flips=3;

                });



              }


          ),*/

            Visibility(
                visible: v,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      labelText: 'three_in_one',
                      hintText: 'max_three_in_one',
                    ),
                    onChanged: (val) {
                      three_in_one = val;
                    })),
            Visibility(
              visible: v,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    labelText: 'coho',
                    hintText: 'max_coho',
                  ),
                  onChanged: (val) {
                    coho = val;
                  }),
            ),
            Visibility(
              visible: v,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    labelText: 'coffe',
                    hintText: 'max_coffe',
                  ),
                  onChanged: (val) {
                    coffe = val;
                  }),
            ),
            /*  SizedBox(
            height: ,
          ),*/
            actionButton("send", onTap: () async {
              var result = await changepermision();
              if (result > 0 && result !=2) {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => TabBarDemo()),
                );
              } else if (result == 2) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "The process cannot be completed because the employee's values are not equal to zero")));
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
