import 'dart:convert';


import 'package:permission_handler/permission_handler.dart';
import 'package:qrscans/qrscan.dart'as scanner;
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/client_TabBarDemo.dart';
import 'package:sinormachine/client_mydrawer.dart';
import 'my-globale.dart' as globals;

//////////////


import 'package:flutter/scheduler.dart';

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';









class Direct_Order extends StatefulWidget {
  @override
  _SCANState createState() => _SCANState();
}

class _SCANState extends State<Direct_Order> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;

  @override
  initState() {

    _scan();


    super.initState();

    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();





  }

  Future acceptorder()async {
    Uri url=Uri.parse("https://alumaracoffe.com/machine/direct_order.php");
    Map<String , String> map= {
      "Id_Client":ID_client.toString(),
      "id_Machine":ID_Machine.toString()
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
  Future getMaterial()async {
    Uri url=Uri.parse("https://alumaracoffe.com/machine/get_material_name.php");
    Map<String , String> map= {
      "Id_Client":ID_client.toString(),
      "id_Machine":ID_Machine.toString()};

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);

     // var responsebody=jsonDecode(response.body);
      //print(responsebody);
      //mm=responsebody.toString();
      //print("jjj "+mm);

      return response.body;
    }catch( e){
      print(e);
      return false;
    }

  }

 /* Future  getmaterial()async
  {
    Uri url=Uri.parse("https://alumaracoffe.com/employee/verify_material_deliveries_monzer_final.php");
    Map<String , String> map= {
      "id_op":id_op[1].toString(),
      "id_donor":id_donor[1].toString(),
      "id_recipient":id_recipient[1].toString(),
      "id_user":id_donor[1].toString(),
      "qua_1_three_in_one":three_in_one_new[1].toString(),
      "qua_2_cohco":coho_new[1].toString(),
      "qua_3_coffe":coffe_new[1].toString()};

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);
      //id_op=(response.body).toString();
      // print(id_op);
      var responsebody=jsonDecode(response.body);
      print(responsebody);

      return responsebody;
    }catch( e){
      print(e);
      return false;
    }

  }*/
 /* Future  senid()async
  {
    Uri url=Uri.parse("https://alumaracoffe.com/employee/edite_stutues.php");
    Map<String , String> map= {
      "id_op":id_op[1].toString(),
    };

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);
      //id_op=(response.body).toString();
      // print(id_op);
      var responsebody=jsonDecode(response.body);
      print(responsebody);

      return responsebody;
    }catch( e){
      print(e);
      return false;
    }

  }*/
  //List<String>list1;
 /* Future  senid2()async
  {

    Uri url=Uri.parse("https://alumaracoffe.com/employee/alter_dialog.php");
    Map<String , String> map= {
      "id":id_donor[1].toString(),
    };

    try{

      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);
      //id_op=(response.body).toString();
      // print(id_op);
      //var responsebody=jsonDecode(response.body);
      print("ppppppppp");
      print(response.body);
      print("ppppppppp");
      var w="";
      var k=response.body.split("<td>");

      var ll=k.length;
      var zz="";
      for(int j=0;j<ll;j++){
        zz=zz+" "+k[j];

      }
      print(zz);

      list1=zz.split("</td>");
      print("list1");
      print(list1);
      print("list1");
      first_name_of_donor=list1[0];
      last_name_of_donor=list1[1];
      email_of_donor=list1[2];
      print("first_name_of_donor:"+first_name_of_donor);
      print("last_name_of_donor:"+last_name_of_donor);
      print("email_of_donor:"+email_of_donor);

      // String kkl=(t.split(",")).toString();
      // list1=t.split(",");
      //print("list");
      //print(kkl);




      return response.body;
    }catch( e){
      print(e);
      return false;
    }

  }*/
  //List<String>list2;
 /* Future  senid3()async
  {

    Uri url=Uri.parse("https://alumaracoffe.com/employee/alter_dialog.php");
    Map<String , String> map= {
      "id":id_recipient[1].toString(),
    };

    try{

      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);
      //id_op=(response.body).toString();
      // print(id_op);
      //var responsebody=jsonDecode(response.body);
      print("ppppppppp");
      print(response.body);
      print("ppppppppp");
      var w="";
      var k=response.body.split("<td>");

      var ll=k.length;
      var zz="";
      for(int j=0;j<ll;j++){
        zz=zz+" "+k[j];

      }
      print(zz);

      list2=zz.split("</td>");
      print("list2");
      print(list2);
      print("list2");
      first_name_of_recipient=list2[0];
      last_name_of_recipient=list2[1];
      email_of_recipient=list2[2];
      print("first_name_of_recipient:"+first_name_of_recipient);
      print("last_name_of_recipient:"+last_name_of_recipient);
      print("email_of_recipient:"+email_of_recipient);

      // String kkl=(t.split(",")).toString();
      // list1=t.split(",");
      //print("list");
      //print(kkl);




      return response.body;
    }catch( e){
      print(e);
      return false;
    }

  }*/

 /* var id_op;
  var id_donor;
  var id_recipient;
  var coho_new;
  var coffe_new;
  var three_in_one_new;
  String first_name_of_donor;
  String last_name_of_donor;
  String email_of_donor;
  String first_name_of_recipient;
  String last_name_of_recipient;
  String email_of_recipient;*/
  var ID_client=globals.iduser;
  var ID_Machine;
  String mm="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: client_MyDrawer(),


    );
  }



  Future _scan() async {
    //3
    // List<String>list;
    await Permission.camera.request();

    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');

    }

    else {





var x;


      this._outputController.text = barcode;
      //print(barcode);
      ID_Machine=barcode;
      var xx=barcode;

      print("xx="+xx);
      x=await getMaterial();
      print(x);

     //String id_machine=barcode;
      //print("kkjsjkskjjjdjksdjjdsqqqwwee");


   /*   var s="";
      var x=barcode.split("\r\n");
      var y=x.length;
      for(int i=0;i<y;i++){
        s=s+""+x[i];
      }
      print("s="+s);*/
     /* var w=s;
      var k=w.split("{");

      var ll=k.length;
      var zz="";
      for(int j=0;j<ll;j++){
        zz=zz+" "+k[j];

      }
      print(zz);

      var ww=zz;
      var wz=ww.split("}");
      var lla=wz.length;
      var zzb="";
      for(int j=0;j<lla;j++){
        zzb=zzb+" "+wz[j];

      }

      print(zzb);

      var t=zzb;

      list=t.split(",");
      print("list");
      print(list);
      String f=list[0];
      String sec=list[1];
      String th=list[2];
      String fou=list[3];
      String fif=list[4];
      String si=list[5];
      print(f);
      print(sec);
      print(th);
      print(fou);
      print(fif);
      print(si);
      id_op=f.split(":");
      id_donor=sec.split(":");
      id_recipient=th.split(":");
      coho_new=fou.split(":");
      coffe_new=fif.split(":");
      three_in_one_new=si.split(":");
      print("id_op="+id_op[1]);
      print("id_donor="+id_donor[1]);
      senid2();
      print("id_recipient="+id_recipient[1]);
      senid3();
      print("coho_new="+coho_new[1]);
      print("coffe_new="+coffe_new[1]);
      print("three_in_one_new="+three_in_one_new[1]);*/
      Future.delayed(Duration(milliseconds: 100), () {



        showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("information about Cup and Machine", style:
                TextStyle(color: Colors.black, fontSize: 14 , fontWeight: FontWeight.w700),),
                titlePadding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                content: Column(
                  children: <Widget>[

                    Text("machine id:"+xx+"\n"+x.toString()
                      ),


                  ],
                ),
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                actions: <Widget>[
                  FlatButton(
                    child: Text("no"),
                    onPressed: () {
                     // senid();
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      acceptorder();
                      Navigator.pushReplacement (
                        context,
                        CupertinoPageRoute(builder: (context) =>  client_TabBarDemo ()),
                      );
                      //Navigator.of(context).pop();
                      //getmaterial();



                    },
                  )
                ],
              );
            });



      }
      );













    }
  }














}
