import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'action_button.dart';
import 'my-globale.dart' as globals;
import 'mydrawer2.dart';

class SEND extends StatefulWidget{
  const SEND({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {

    return _MyStatefulWidgetState();
  }
  }



/*class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}*/

String usid;
String id_op;
class _MyStatefulWidgetState extends State<SEND> {

  Future  getemailtid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/email_id.php");

    Map<String , String> map= {
      "email":us.toString(),
      };

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);

      usid=(response.body).toString();
      print(usid);
      //var responsebody=jsonDecode(response.body);
      //usid=responsebody;
      globals.iduser=usid.toString();
      print(globals.iduser);

      return usid;
    }catch( e){
      print(e);
      return false;
    }


  }
  Future  getmaterial()async
  {
    Uri url=Uri.parse("https://alumaracoffe.com/employee/add_material_deliveries.php");
    Map<String , String> map= {
      "id_donor":globals.iduser.toString(),
      "id_recipient":kkk.toString(),
      "qua_1_three_in_one":three_in_one.toString(),
      "qua_2_choco":coho.toString(),
      "qua_3_coffe":coffe.toString()};

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);
      id_op=(response.body).toString();
      print(id_op);
      var responsebody=jsonDecode(response.body);
      print(responsebody);

      return responsebody;
    }catch( e){
      print(e);
      return false;
    }

  }


  Future  getpostid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/increase.php");

    Map<String , String> map= {
    "inc":zz.toString(),
    "th":three_in_one.toString(),
    "ch":coho.toString(),
    "co":coffe.toString(),
    "iid":kkk.toString()};

   try{
     var response=await http.post
       (url,
         body: jsonEncode(map)
     );
     print(response.body);
     var responsebody=jsonDecode(response.body);

     return responsebody['result'];
   }catch( e){
     print(e);
     return false;
   }





  }




  var three_in_one;
  var id_recipient;
  var coffe;
  var coho;
  String zezo;
  var zz;
  var yyy;
  var kkk;
  String us=globals.currentuserss;

  @override
  void initState() {
    getemailtid();
   // getmaterial();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Map rcvdData = ModalRoute
        .of(context)
        .settings
        .arguments;
     kkk=rcvdData['id_recipient'];

     zezo=rcvdData.toString();
     print(zezo);

    return Directionality(textDirection: TextDirection.ltr, child:Scaffold(
        appBar: AppBar(title:  Text("material transfer process"),
        ),
        drawer: MyDrawer2(),
        body:
      Column(
      children: <Widget>[

        Padding( padding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),



        TextFormField(
            keyboardType: TextInputType.number,



            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40)
              ),
              labelText: 'three_in_one',
              hintText: 'Enter the quantity',


            ),


            onChanged: (val){
              three_in_one=val;

            }


        ),
        Padding( padding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
        TextFormField(
            keyboardType: TextInputType.number,



            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40)
              ),
              labelText: 'coffe',
              hintText: 'Enter the quantity',

            ),


            onChanged: (val){
              coffe=val;

            }


        ),
        Padding( padding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
        TextFormField(
            keyboardType: TextInputType.number,



            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40)
              ),
              labelText: 'coho',
              hintText: 'Enter the quantity',

            ),


            onChanged: (val){
              coho=val;

            }


        ),
        Padding( padding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
        Row(
          children: <Widget>[
            Expanded(child:RaisedButton(child: Text("send"),color: Colors.brown,textColor: Colors.white,

              onPressed: ()  async {

                getemailtid();

                var result=await  getmaterial();
                if(result>1) {
                  await Navigator.pushNamed(context, 'info',
                      arguments: {
                        "id_op":id_op,
                        "id_donor": globals.iduser,
                        "id_recipient":kkk,
                        "coho_new": coho,
                        "coffe_new": coffe,
                        "three_in_one_new": three_in_one,

                      });
                }



              },

            ),),
            Expanded(child: RaisedButton(child: Text("cancel"),color: Colors.brown,textColor: Colors.white,

              onPressed: ()   {

                Navigator.of(context).pop();



              },

            ), ),

          ]),










      ],
    )
    )
    );
  }
}