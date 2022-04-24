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
import 'client_mydrawer.dart';
import 'my-globale.dart' as globals;

import 'list_all_preorders.dart';
ListViewHandelItemState pageState;

class all_pre_order_user extends StatefulWidget {
  @override
  ListViewHandelItemState createState() {
    pageState = ListViewHandelItemState();
    return pageState;
  }
}
enum SingingCharacter { all, execute,notexecute }

class ListViewHandelItemState extends State<all_pre_order_user> {
  SingingCharacter _character;
  String y;
 // String y1="52";
  int flips=1;
  List c=List();
  Future getData1() async{
   // Uri url=Uri.parse("https://alumaracoffe.com/employee/mamdouh_all_pre_order_user.php");
    Uri url=Uri.parse("https://alumaracoffe.com/machine/mamdouh_all_pre_order_user.php");


    var response=await http.post(url,body:{"id_client":y.toString()});
    var responsebody=jsonDecode(response.body);
    c=responsebody;
    print(c);

    return c;





  }
  Future execute() async{
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





  }






  String bal;

  Future foo(int flips_int) async {
    var container_fun;
    if(flips_int==1){
      container_fun = await getData1();

    }
    else  if(flips_int==2){
      container_fun = await execute();

    }
    else  if(flips_int==3){
      container_fun = await notexecute();

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
    y = globals.iduser;
    bal=globals.balance;
    Future.delayed(Duration(milliseconds: 20000), (){

    });
    return Scaffold(
      appBar: AppBar(title: Text("My Pre-Orders"),
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
      body: Column(
        children: <Widget>[
          Text("your balane is:${bal}",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20)),

          ListTile(
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
                      return test_list_all_preordes(type_of_drink: snapshot.data[i]['numbers_of_Engines'],
                        code: snapshot.data[i]['auto_generate_code'],

                        password: snapshot.data[i]['auto_generate_password'],
                       time: snapshot.data[i]['time_order'],
                       status: snapshot.data[i]['status'],
                       exe:snapshot.data[i]['time_of_execution'],
                       price: snapshot.data[i]['Price_Of_Order'],
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