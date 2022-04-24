import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'TabBarDemo2.dart';
import 'action_button.dart';
import 'my-globale.dart' as globals;
import 'mydrawer2.dart';

class Refill extends StatefulWidget{
  const Refill({Key key}) : super(key: key);
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
class _MyStatefulWidgetState extends State<Refill> {


  String y;

  Future refill() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/refill.php");
    Map<String, String> map = {
      "Id_Client": y.toString(),
      "three_in_one":three_in_one.toString(),
      "Choco":Choco.toString(),
      "coffe":coffe.toString()

    };
    try {
      var response = await http.post(url, body: jsonEncode(map));
      print(response.body);

      var responsebody = jsonDecode(response.body);
      print(responsebody);
      print(y);

      return responsebody;
    } catch (e) {
      print(e);
      return false;
    }
  }





  var three_in_one;
  var id_recipient;
  var coffe;
  var Choco;
  String zezo;
  var zz;
  var yyy;
  var kkk;
  String us=globals.currentuserss;

  @override
  void initState() {

    // getmaterial();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    y = globals.iduser;




    return Directionality(textDirection: TextDirection.ltr, child:Scaffold(
        appBar: AppBar(title:  Text("refill_machine"),
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
                  Choco=val;

                }


            ),
            Padding( padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
            Row(
                children: <Widget>[
                  Expanded(child:RaisedButton(child: Text("send"),color: Colors.brown,textColor: Colors.white,

                    onPressed: ()  async {
                      var result=await  refill();
                      if(result==1){
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(builder: (context) => TabBarDemo2()),
                        );
                      }



                     /* var result=await  refill();
                      if(result>1) {
                        await Navigator.pushNamed(context, 'info',
                            arguments: {

                              "coho_new": coho,
                              "coffe_new": coffe,
                              "three_in_one_new": three_in_one,

                            });
                      }*/



                    },

                  ),),


                ]),










          ],
        )
    )
    );
  }
}