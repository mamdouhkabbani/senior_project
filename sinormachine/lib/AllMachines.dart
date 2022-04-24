import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/preorder.dart';
import 'package:sinormachine/tabBar.dart';
import 'package:sinormachine/test_list_all_preorders.dart';
import 'dart:convert'  ;
import '../product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../mydrawer.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'Edit_Machine.dart';
import 'Test_List_All_Machines.dart';
import 'client_mydrawer.dart';
import 'constants.dart';
import 'my-globale.dart' as globals;

import 'list_all_preorders.dart';
ListViewHandelItemState pageState;

class AllMachines extends StatefulWidget {
  @override
  ListViewHandelItemState createState() {
    pageState = ListViewHandelItemState();
    return pageState;
  }
}
enum SingingCharacter { all, execute,notexecute }

class ListViewHandelItemState extends State<AllMachines> {
  SingingCharacter _character;
  String y;
  // String y1="52";
  int flips=1;
  List c=List();
  Future getData1() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/testmamdouhjoin.php");

    var response=await http.post(url,body:{});
    var responsebody=jsonDecode(response.body);
    c=responsebody;

    return c;





  }
 /* Future execute() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/search_by_status_preorder.php");

    var response=await http.post(url,body:{"id_client":y.toString()});
    var responsebody=jsonDecode(response.body);
    responsebody;

    return responsebody ;





  }

  Future notexecute() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/search_by_status_preorder_not.php");

    var response=await http.post(url,body:{"id_client":y.toString()});
    var responsebody=jsonDecode(response.body);
    responsebody;

    return responsebody ;





  }*/






  String bal;

  Future foo(int flips_int) async {
    var container_fun;
    if(flips_int==1){
      container_fun = await getData1();

    }
  /*  else  if(flips_int==2){
      container_fun = await execute();

    }
    else  if(flips_int==3){
      container_fun = await notexecute();

    }*/

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

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }





  //bool x=true;



  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  bool _checkboxListTile3 = false;

  @override
  Widget build(BuildContext context) {
    /*y = globals.iduser;
    bal=globals.balance;*/
    Future.delayed(Duration(milliseconds: 20000), (){

    });
    return Scaffold(


      floatingActionButton: isAdmin?FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
         /* Navigator.push (
            context,
            CupertinoPageRoute(builder: (context) =>  CreateMachine()),
          ).then((value) => setState(() {

          }) );*/
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (context) => Edit_Machine()));
        },
      ):null,
      body: Column(
        children: <Widget>[


         /* ListTile(
            title: const Text('All Pre-Order'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.all,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  flips=1;
                  _character = value;
                  _checkboxListTile1 = !_checkboxListTile1;
                  _checkboxListTile2 =false;
                  _checkboxListTile3=false;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('execute'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.execute,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  flips=2;
                  _character = value;
                  _checkboxListTile1 = false;
                  _checkboxListTile2 =!_checkboxListTile2;
                  _checkboxListTile3=false;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Not Execute'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.notexecute,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  flips=3;
                  _character = value;
                  _checkboxListTile1 = false;
                  _checkboxListTile2 =false;
                  _checkboxListTile3=!_checkboxListTile3;
                });
              },
            ),
          ),*/

       /*   Divider(
            color: Colors.grey,
            height: 5,
            indent: 10,
            endIndent: 10,
          ),*/


















          Expanded(
            child:  FutureBuilder(





              future: foo(flips),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context , i){
                      return Test_List_All_Machines(id: snapshot.data[i]['id'],
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