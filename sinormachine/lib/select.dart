import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/tabBar.dart';
import 'dart:convert';
import '../product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../mydrawer.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

ListViewHandelItemState pageState;

class select1 extends StatefulWidget {
  @override
  ListViewHandelItemState createState() {
    pageState = ListViewHandelItemState();
    return pageState;
  }
}
enum SingingCharacter { lafayette, jefferson }

class ListViewHandelItemState extends State<select1> {
  SingingCharacter _character;
  int zxy = 1;
  int xyz;

  List c = List();
  List c1 = List();


  Future getpostemp() async {
    Uri url = Uri.parse("https://alumaracoffe.com/employee/display.php");
    var response = await http.post(url, body: {"mm": type});
    var responsebody = jsonDecode(response.body);
    c = responsebody;
    return c;
  }

  Future getpoststore() async {
    Uri url = Uri.parse("https://alumaracoffe.com/employee/display_store.php");
    var response = await http.post(url, body: {"mm": type1});
    var responsebody = jsonDecode(response.body);
    c1 = responsebody;
    return c1;
  }


  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {

    });
  }

  @override
  void initState() {
    getPref();
    //foo1( xyz);

    getpoststore();
    getpostemp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String dropdownValue;
  var Quantityof;
  var idof;
  var type;
  var type1;
  bool x = true;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("آلة المشروبات الساخنة")
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
          Divider(
            color: Colors.grey,
            height: 5,
            indent: 10,
            endIndent: 10,
          ),





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
          items: <String>['male', 'female', 'other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),


        ),









          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[

                /*  RaisedButton(
                  child: Text("send"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('yy');


                  },
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}