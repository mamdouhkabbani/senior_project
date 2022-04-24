/*
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/tabBar.dart';
import 'dart:convert'  ;
import '../storedetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../mydrawer.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
ListViewHandelItemState pageState;

class store extends StatefulWidget {
  @override
  ListViewHandelItemState createState() {
    pageState = ListViewHandelItemState();
    return pageState;
  }
}
enum SingingCharacter { lafayette, jefferson }

class ListViewHandelItemState extends State<store> {

  SingingCharacter _character;
  int zxy=1;

  List c=List();
  Future getData1() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/index_store.php");
    var response=await http.get(url);
    var responsebody=jsonDecode(response.body);
    c=responsebody;
    return c;

  }


  Future  getpostname() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/display_store");
    var response=await http.post(url,body:{"mm":type});
    var responsebody=jsonDecode(response.body);

    return responsebody;



  }

  Future  getpostid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/display2_store.php");
    var response=await http.post(url,body:{"id":idof});
    var responsebody=jsonDecode(response.body);

    return responsebody;



  }

  Future foo(int pp) async {
    var zz;
    if(pp==1){
      zz = await getData1();
    }
    else if(pp==2){
      zz = await getpostname();
    }
    else if(pp==3){
      zz = await getpostid();
    }

    return zz;

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
    getpostname();
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
  bool x=true;


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
            value:c['name'] ,
            child: Text(c['name']),);
        }).toList(),

        onChanged: ( newValue) {
          setState(() {
            dropdownValue = newValue;
            type=newValue;
            zxy=2;







          });





        },


    .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),


          );
        }).toList(),


      ) ;

    } else { // Just Divider with zero Height xD
      return Divider(color: Colors.white, height: 0.0);
    }

  }

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


          ListTile(
            title: const Text('اختيار المندوب'),
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


 Container(child:CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('اختيار المندوب'),
            value: _checkboxListTile1,
            onChanged: (value) {
              setState(() {
                _checkboxListTile1 = !_checkboxListTile1;
              });
            },
          ),



          ),

          _buildDropDown(_checkboxListTile1),


          ListTile(
            title: const Text('ادخال رقم المندوب'),
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

CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('ادخال رقم المندوب'),
            value: _checkboxListTile2,
            onChanged: (value) {
              setState(() {
                _checkboxListTile2 = !_checkboxListTile2;
              });
            },
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
                  idof=val;
                  zxy=3;

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





              future: foo(zxy),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context , i){
                      return MobList(mo_id: snapshot.data[i]['id'],
                        three_in_one: snapshot.data[i]['three_in_one'],
                        id_empl: snapshot.data[i]['id_empl'],

                        //coho: snapshot.data[i]['coho'],
                      //  coffe:snapshot.data[i]['coffe'] ,
                      ) ;


                    },

                  );



                }
                return Center(child:CircularProgressIndicator()) ;
              },
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 5,
            indent: 10,
            endIndent: 10,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[

  RaisedButton(
                  child: Text("send"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('yy');


                  },
                )

              ],
            ),
          ),
        ],
      ),
    );

  }
}
*/
