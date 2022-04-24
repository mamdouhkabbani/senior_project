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
import 'Store_mydrawer.dart';
import 'Test_List_All_Machines.dart';
import 'Test_MyQuantity.dart';
import 'Test_MyQuantity2.dart';
import 'client_mydrawer.dart';
import 'constants.dart';
import 'my-globale.dart' as globals;

import 'list_all_preorders.dart';
import 'mydrawer2.dart';
ListViewHandelItemState pageState;

class MyQuantity2 extends StatefulWidget {
  @override
  ListViewHandelItemState createState() {
    pageState = ListViewHandelItemState();
    return pageState;
  }
}


class ListViewHandelItemState extends State<MyQuantity2> {

  String y;

  int flips=1;
  List c=List();
  Future getData1() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/MyQuantity.php");
    Map<String , String> map= {
      'id_client':id_client.toString(),

    };

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);

      var responsebody=jsonDecode(response.body);
      print(responsebody);

      return responsebody;
    }catch( e){
      print(e);
      return false;
    }

  }












  String bal;

  Future foo(int flips_int) async {
    var container_fun;
    if(flips_int==1){
      container_fun = await getData1();

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




  var id_client=globals.iduser;





  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(milliseconds: 20000), (){

    });
    return Scaffold(
      appBar: AppBar(title: Text("MYQUANTITY")
      ),
      drawer: Store_Maydrawer(),



      body: Column(
        children: <Widget>[



          Expanded(
            child:  FutureBuilder(





              future: foo(flips),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context , i){
                      return Test_MyQuantity2(id: snapshot.data[i]['id'],
                          id_empl: snapshot.data[i]['id_empl'],
                          first_name:snapshot.data[i]['first_name'],
                          last_name:snapshot.data[i]['last_name'],
                          three_in_one: snapshot.data[i]['three_in_one'],
                          Choco: snapshot.data[i]['coho'],
                          coffe: snapshot.data[i]['coffe'],
                          max_three_in_one:snapshot.data[i]['max_three_in_one'],
                          max_coho:snapshot.data[i]['max_coho'],
                          max_coffe:snapshot.data[i]['max_coffe'],
                          email:snapshot.data[i]['email']



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


              ],
            ),
          ),
        ],
      ),
    );

  }
}