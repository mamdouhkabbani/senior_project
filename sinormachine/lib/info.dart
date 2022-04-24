
import 'package:flutter/material.dart';
import 'dart:typed_data';
import '../mydrawer.dart';

import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'login2.dart'as globals;


import 'dart:async';
import 'dart:io';
import 'my-globale.dart' as globals;
import 'mydrawer2.dart';


//import 'package:flutter/cupertino.dart';








class INFO  extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<INFO > {

  String x;
  String y;
  String z;

  @override
  initState() {

    super.initState();



  }


  @override
  Widget build(BuildContext context) {
    final Object rcvdData = ModalRoute
        .of(context)
        .settings
        .arguments;
    x = rcvdData.toString();
   //y=globals.currentuserss;
   //y=y.toString();
    //x=x+y;
    //z=globals.iduser;


    return Directionality(textDirection: TextDirection.ltr,child: Scaffold(
        appBar: AppBar(
          title: Text("Scan Qr-Code"),
          centerTitle: true,
        ),
        drawer: MyDrawer2(),


        body:
        Column(
            children: <Widget>[
        Container(
        padding: EdgeInsets.all(10),),

              Center(
                  child: PrettyQr(
                    //image: AssetImage('images/twitter.png'),
                      typeNumber: 10,
                      size: 300,
                      data: x,
                      errorCorrectLevel: QrErrorCorrectLevel.M,
                      roundEdges: true))

            ])




    ),);

  }






}