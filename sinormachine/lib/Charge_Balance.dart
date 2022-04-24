
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

class Charge_Balance extends StatefulWidget {
  const Charge_Balance({Key key}) : super(key: key);

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

class _MyPermision extends State<Charge_Balance> {

  int flips = 1;



  Future Charge() async  {
  Uri url = Uri.parse("https://alumaracoffe.com/employee/Charge_Client_Account.php");
  Map<String, String> map = {
    "email": Email.toString(),
    "balance": Balance.toString(),

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

/*  Future changepermision() async {
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
  }*/



  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    getPref();



    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String dropdownValue;

  var id_empl;
  String name_empl;

  var Balance;






  String Email;
  String Name;
  String zezo;
  var type_id;
  String id_recipient;


  @override
  Widget build(BuildContext context) {

    Map rcvdData = ModalRoute.of(context).settings.arguments;
    Name = rcvdData['name'];
    id_recipient = rcvdData['id_Machine'];
    Email=rcvdData['email'];

    zezo = rcvdData.toString();
    print(zezo);
    print(Name);
    print(id_recipient);


    print(name_empl);
    print(type_id);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: Text("Charge Account")),
        drawer: MyDrawer(),
        body: Column(
          children: <Widget>[
            Text(Name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center),
            Padding( padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),

            Text(Email,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center),

            Padding( padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),










            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  labelText: 'Balance',
                  hintText: 'Balance',
                ),
                onChanged: (val) {
                  Balance = val;
                }),
            Padding( padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),


            /*  SizedBox(
            height: ,
          ),*/
            actionButton("Charge Account", onTap: () async {
               var result = await Charge();
              if (result == 1 ) {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => TabBarDemo()),
                );
              }
              else  {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "The process cannot be completed ")));

              }
            }),
          ],
        ),
      ),
    );
  }
}
