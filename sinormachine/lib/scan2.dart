import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:sinormachine/main.dart';
import 'package:sinormachine/maps.dart';
import 'package:sinormachine/mydrawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscans/qrscan.dart'as scanner;
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'Store_mydrawer.dart';
import 'TabBarDemo2.dart';
import 'my-globale.dart' as globals;


import 'package:wifi_configuration/wifi_configuration.dart';
import 'package:sinormachine/action_button.dart';
import 'package:sinormachine/tabBar.dart';

import 'mydrawer2.dart';





class scan2 extends StatefulWidget {
  @override
  _SCANState createState() => _SCANState();
}

class _SCANState extends State<scan2> {
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

  Future  getmaterial()async
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

  }
  Future  senid()async
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

  }
  List<String>list1;
  Future  senid2()async
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

  }
  List<String>list2;
  Future  senid3()async
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

  }

  var id_op;
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
  String email_of_recipient;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Store_Maydrawer(),
      // body:
      /*Builder(
        builder: (BuildContext context) {
          *//*return ListView(

            children: <Widget>[
              _qrCodeWidget(this.bytes, context),
              Container(

                color: Colors.white,
                child: Column(
                  children: <Widget>[


                    SizedBox(height: 20),
                    TextField(
                      controller: this._outputController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.wrap_text),
                        helperText: 'The barcode or qrcode you scan will be displayed in this area.',
                        hintText: 'The barcode or qrcode you scan will be displayed in this area.',
                        hintStyle: TextStyle(fontSize: 15),
                        contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    this._buttonGroup(),
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ],
          );*//*
        },
      ),*/

    );
  }

  /*Widget _qrCodeWidget(Uint8List bytes, BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl, child:
    Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 6,
        child: Column(
          children: <Widget>[
            Container(

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.verified_user, size: 18, color: Colors.green),
                  Text('  Generate Qrcode', style: TextStyle(fontSize: 15)),
                  Spacer(),
                  Icon(Icons.more_vert, size: 18, color: Colors.black54),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 190,
                    child: bytes.isEmpty
                        ? Center(
                      child: Text('Empty code ... ', style: TextStyle(color: Colors.black38)),
                    )
                        : Image.memory(bytes),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7, left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            child: Text(
                              'remove',
                              style: TextStyle(fontSize: 15, color: Colors.blue),
                              textAlign: TextAlign.left,
                            ),
                            onTap: () => this.setState(() => this.bytes = Uint8List(0)),
                          ),
                        ),
                        Text('|', style: TextStyle(fontSize: 15, color: Colors.black26)),
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () async {
                              final success = await ImageGallerySaver.saveImage(this.bytes);
                              SnackBar snackBar;
                              if (success) {
                                snackBar = new SnackBar(content: new Text('Successful Preservation!'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              } else {
                                snackBar = new SnackBar(content: new Text('Save failed!'));
                              }
                            },
                            child: Text(
                              'save',
                              style: TextStyle(fontSize: 15, color: Colors.blue),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 2, color: Colors.black26),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.history, size: 16, color: Colors.black38),
                  Text('  Generate History', style: TextStyle(fontSize: 14, color: Colors.black38)),
                  Spacer(),
                  Icon(Icons.chevron_right, size: 16, color: Colors.black38),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            )
          ],
        ),
      ),
    ),);
  }*/

  /*Widget _buttonGroup() {
    return Row(
      children: <Widget>[

        Expanded(
          flex: 1,
          child: SizedBox(
            height: 120,
            child: InkWell(
              onTap: _scan,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Image.asset('images/scanner.png'),
                    ),
                    Divider(height: 20),
                    Expanded(flex: 1, child: Text("Scan")),
                  ],
                ),
              ),
            ),
          ),
        ),


      ],
    );
  }*/

  Future _scan() async {
    List<String>list;
    await Permission.camera.request();

    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');

    }

    else {
      Navigator.pushReplacement (
        context,
        CupertinoPageRoute(builder: (context) =>  TabBarDemo2 ()),
      );



      /* showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("information about transformation", style:
                TextStyle(color: Colors.black, fontSize: 14 , fontWeight: FontWeight.w700),),
                titlePadding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                content: Column(
                  children: <Widget>[
                    Text("hello:"+globals.currentuserss+"\nthe information to be confirmed is:\n"
                        +"id of operation is:"+"\n"+id_op[1]
                        +"\n"+"id of donor is:"
                        "\n"+id_donor[1]+"\n"+"first_name_of_donor:"+"\n"+list1[0]+"\n"+"last_name_of_donor:"
                        +"\n"+list1[1]+"\n"+
                        "id of recipient is:"+"\n"+id_recipient[1]+"\n"+"first_name_of_recipient:"
                        +"\n"+list2[0]+"\n"+"last_name_of_recipient:"
                        +"\n"+list2[1]*//*+"\n"*//*
                      *//*+"quantities is:"+"\n"+
                        "cohco:"+"\n"+ coho_new[1]+"g"+"\n"+
                        "coffe:"+"\n"
                        +coffe_new[1]+"g"
                    +"\n"+"three_in_one:"+"\n"
                        +three_in_one_new[1]+"g"*//*),

                    *//*Text(
                      "do you want to confirmation:"+"${list}",
                      style: Theme.of(context).textTheme.body1,
                    ),*//*
                  ],
                ),
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                actions: <Widget>[
                  FlatButton(
                    child: Text("no"),
                    onPressed: () {
                      senid();
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      getmaterial();



                    },
                  )
                ],
              );
            });*/




      this._outputController.text = barcode;
      /*AlertDialog(

        content:  Text("the information is:"+"${list}\$"),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              getmaterial();

            },
            child: const Text('OK'),
          )
        ],
      );*/
      /*var s="";
      var x=barcode.split(":");
      var y=x.length;
      for(int i=0;i<y;i++){
        s=s+" "+x[i];
      }
      var w=s;
      var k=w.split(";");
      var ll=k.length;
      var zz="";
      for(int j=0;j<ll;j++){
        zz=zz+" "+k[j];
      }

      var q=zz;
      var n=q.split(" ");
      var ssi=n.indexOf('S');
      ssi+=1;
      var pas=n.indexOf("P");
      pas+=1;
      var ssis=n[ssi];
      var pass=n[pas];

      WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi(
          "${ssis}",
          "${pass}",
          "com.example.mo");
      print("is Connected : ${connectionStatus}");*/

      var s="";
      var x=barcode.split("\r\n");
      var y=x.length;
      for(int i=0;i<y;i++){
        s=s+""+x[i];
      }
      print("s="+s);
      var w=s;
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

      String kkl=(t.split(",")).toString();
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
      print("three_in_one_new="+three_in_one_new[1]);
      Future.delayed(Duration(milliseconds: 500), () {



        showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("information about transformation", style:
                TextStyle(color: Colors.black, fontSize: 14 , fontWeight: FontWeight.w700),),
                titlePadding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                content: Column(
                  children: <Widget>[

                    Text("hello:"+globals.currentuserss+"\nthe information to be confirmed is:\n"
                        +"id of operation is:"+"\n"+id_op[1]
                        +"\n"+"id of donor is:"
                        "\n"+id_donor[1]+"\n"+"name_of_donor:"+"\n"+globals.name+"\n"+
                        "id of recipient is:"+"\n"+id_recipient[1]+"\n"+"first_name_of_recipient:"
                        +"\n"+first_name_of_recipient+"\n"+"last_name_of_recipient:"
                        +"\n"+last_name_of_recipient/*+"\n"*/
                      /*+"quantities is:"+"\n"+
                        "cohco:"+"\n"+ coho_new[1]+"g"+"\n"+
                        "coffe:"+"\n"
                        +coffe_new[1]+"g"
                    +"\n"+"three_in_one:"+"\n"
                        +three_in_one_new[1]+"g"*/),

                    Text(
                      "do you want to confirmation:"+"${list}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                actions: <Widget>[
                  FlatButton(
                    child: Text("no"),
                    onPressed: () {
                      senid();
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      getmaterial();



                    },
                  )
                ],
              );
            });



      }
      );








      //getmaterial();





    }
  }





  Future _scanBytes() async {
    //File file = await ImagePicker.pickImage(source: ImageSource.camera);
    //Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
  }








}

