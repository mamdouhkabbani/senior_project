import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinormachine/tabBar.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'Test_Charge_Client_Account.dart';
import 'Test_Edit_Machine.dart';
import 'Test_List_All_Machines.dart';
import 'Test_Transfaring_To_Store.dart';
import 'action_button.dart';
import 'alluserdetails.dart';

class Transfaring_To_Store extends StatefulWidget{
  const Transfaring_To_Store({Key key}) : super(key: key);
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


class _MyStatefulWidgetState extends State<Transfaring_To_Store> {

  SingingCharacter _character;
  int flips=1;

  List c=List();
  Future getData1() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/View_All_Store_Activate.php");
    var response=await http.get(url);
    var responsebody=jsonDecode(response.body);
    c=responsebody;
    return c;

  }



  Future  getpostname() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/search_by-email_Store.php");
    var response=await http.post(url,body:{"email":Email_Client});
    var responsebody=jsonDecode(response.body);

    return responsebody;



  }



  Future  getpostid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/search_by_id_Store.php");
    var response=await http.post(url,body:{"id":id_Client});
    var responsebody=jsonDecode(response.body);

    return responsebody;



  }


  Future foo(int flips_int) async {
    var container_fun;
    if(flips_int==1){
      container_fun = await getData1();
    }
    else if(flips_int==2){
      container_fun = await getpostname();
    }
    else if(flips_int==3){
      container_fun = await getpostid();
    }

    return container_fun;

  }






  getPref()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {

    });
  }

  @override
  void initState() {
    getPref() ;

    getData1();

    // getpostname();
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  String dropdownValue;

  var id_Client;
  var Email_Client;


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

        items: c.map((c){
          return DropdownMenuItem(
            value:c['email'] ,
            child: Text(c['email']),);
        }).toList(),

        onChanged: ( newValue) {
          setState(() {
            dropdownValue = newValue;
            Email_Client=newValue;
            flips=2;
          });

        },




      ) ;

    } else { // Just Divider with zero Height xD
      return Divider(color: Colors.white, height: 0.0);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("External Sources To Store")
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


          ListTile(
            title: const Text(' Client Selection'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  _checkboxListTile1 = !_checkboxListTile1;
                  _checkboxListTile2 =false;
                });
              },
            ),
          ),


          _buildDropDown(_checkboxListTile1),


          ListTile(
            title: const Text('Enter Id Of Client '),
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
          ),


          Divider(
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
                  id_Client=val;
                  flips=3;

                });



              }


          ),

          Divider(
            color: Colors.grey,
            height: 5,
            indent: 10,
            endIndent: 10,
          ),

          Expanded(
            child:  FutureBuilder(





              future: foo(flips),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context , i){
                      return Test_Transfaring_To_Store(id: snapshot.data[i]['id'],
                        availability: snapshot.data[i]['availability'],


                        first_name: snapshot.data[i]['first_name'],
                        last_name: snapshot.data[i]['last_name'],

                        Balance:snapshot.data[i]['balance'],
                        email: snapshot.data[i]['email'],


                      ) ;



                    },

                  );



                }
                return Center(child:CircularProgressIndicator()) ;
              },
            ),
          ),



        ],
      ),
    );

  }
}