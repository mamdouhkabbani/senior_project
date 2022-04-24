import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinormachine/tabBar.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'Test_Edit_Machine.dart';
import 'Test_List_All_Machines.dart';
import 'action_button.dart';
import 'alluserdetails.dart';

class Edit_Machine extends StatefulWidget{
  const Edit_Machine({Key key}) : super(key: key);
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


class _MyStatefulWidgetState extends State<Edit_Machine> {

  SingingCharacter _character;
  int flips=1;

  List c=List();
  Future getData1() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/testmamdouhjoin.php");
    var response=await http.get(url);
    var responsebody=jsonDecode(response.body);
    c=responsebody;
    return c;

  }
  List c2=List();
  Future getData2() async{
    Uri url=Uri.parse("https://alumaracoffe.com/machine/viwe_all_machine.php");
    var response=await http.get(url);
    var responsebody=jsonDecode(response.body);
    c2=responsebody;
    return c2;

  }
var z;
  Future email(String name_empl1)async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/email_id.php");
    var response=await http.post(url,body:{"email":name_empl1.toString()});
    var responsebody=jsonDecode(response.body);
   var x=responsebody.toString();
    print(x);

    return x;

  }


  Future  getpostname() async{
    Uri url=Uri.parse("https://alumaracoffe.com/machine/search_by-email_Machine.php");
    var response=await http.post(url,body:{"email":z.toString()});
    var responsebody=jsonDecode(response.body);

    return responsebody;



  }

  Future  getpostid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/machine/search_by_id_Machine.php");
    var response=await http.post(url,body:{"id":id_empl});
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
    getData2();
   // getpostname();
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  String dropdownValue;

  var id_empl;
  var name_empl;
  //bool x=true;


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

        items: c2.map((c2){
          return DropdownMenuItem(
            value:c2['email'] ,
            child: Text(c2['email']),);
        }).toList(),

        onChanged: ( newValue) {
          setState(() {

            dropdownValue = newValue;
            name_empl=newValue;
            print(name_empl);
             z= email(name_empl);
            flips=2;
          });

        },


        /*    .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),


          );
        }).toList(),*/

      ) ;

    } else { // Just Divider with zero Height xD
      return Divider(color: Colors.white, height: 0.0);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hot drink machine")
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
            title: const Text(' Machine Selection'),
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
            title: const Text('enter id of Machine '),
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
                  id_empl=val;
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
                      return Test_Edit_Machines(id: snapshot.data[i]['id'],
                        availability: snapshot.data[i]['availability'],


                        location: snapshot.data[i]['location'],
                        first_name: snapshot.data[i]['first_name'],
                        last_name: snapshot.data[i]['last_name'],
                        time:snapshot.data[i]['created'],
                        three_in_one:snapshot.data[i]['three_in_one'],
                        Choco:snapshot.data[i]['coho'],
                        coffe:snapshot.data[i]['coffe'],
                        temp:snapshot.data[i]['temp'],
                        water:snapshot.data[i]['water'],

                        // email:snapshot.data[i]['email'],
                        /* max_coho:snapshot.data[i]['max_coho'],
                        max_three_in_one:snapshot.data[i]['max_three_in_one'],


                        coho: snapshot.data[i]['coho'],
                        coffe:snapshot.data[i]['coffe'] ,*/
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