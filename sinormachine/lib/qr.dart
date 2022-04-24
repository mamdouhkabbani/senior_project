
import 'package:flutter/material.dart';

import 'package:pretty_qr_code/pretty_qr_code.dart';


import 'client_MyDrawer.dart';


//import 'package:flutter/cupertino.dart';








class QR  extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<QR > {

  String x;


  @override
  initState() {

    super.initState();



  }


  @override
  Widget build(BuildContext context) {

    x = "55";
    //y=globals.currentuserss;
    //y=y.toString();
    //x=x+y;
    //z=globals.iduser;


    return Directionality(textDirection: TextDirection.ltr,child: Scaffold(
        appBar: AppBar(
          title: Text("Scan Qr-Code"),
          centerTitle: true,
        ),
        drawer: client_MyDrawer(),


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