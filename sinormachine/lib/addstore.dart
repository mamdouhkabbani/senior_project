import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/tabBar.dart';
import '../mydrawer.dart';
import 'package:http/http.dart' as http;

import 'action_button.dart';

class addstore extends StatefulWidget{
  const addstore({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {

    return _MyStatefulWidgetState();
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<addstore> {

  Future  getpostid() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/employee/add_store.php");

    Map<String , String> map= {
      "name":name.toString(),
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


  SingingCharacter _character;
  var three_in_one;
  var coffe;
  var coho;
  var name;
  String zezo;
  var zz;
  var yyy;
  var kkk;

  @override
  Widget build(BuildContext context) {


    return Directionality(textDirection: TextDirection.rtl, child:Scaffold(
        appBar: AppBar(title:  Text("addstore"),
        ),
        drawer: MyDrawer(),
        body:
        Column(
          children: <Widget>[

            TextFormField(
                keyboardType: TextInputType.number,



                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  labelText: 'name',
                  hintText: 'الاسم',


                ),


                onChanged: (val){
                  name=val;

                }


            ),



            TextFormField(
                keyboardType: TextInputType.number,



                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  labelText: 'three_in_one',
                  hintText: 'ادخل الكمية',


                ),


                onChanged: (val){
                  three_in_one=val;

                }


            ),
            TextFormField(
                keyboardType: TextInputType.number,



                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  labelText: 'coffe',
                  hintText: 'ادخل الكمية',

                ),


                onChanged: (val){
                  coffe=val;

                }


            ),
            TextFormField(
                keyboardType: TextInputType.number,



                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  labelText: 'coho',
                  hintText: 'ادخل الكمية',

                ),


                onChanged: (val){
                  coho=val;

                }


            ),
            actionButton("SEND",

              onTap: ()  async {
                bool result = await getpostid();
                if(result)
                  Navigator.pushReplacement (
                    context,
                    CupertinoPageRoute(builder: (context) =>  TabBarDemo()),
                  );


              },

            ),

          ],
        )
    )
    );
  }
}