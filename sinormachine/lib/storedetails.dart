import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'drinks.dart';
class MobileDetails extends StatefulWidget {
  final name_d;

  final three_in_one;

  final coffe;

  final coho;

  final id_d;

  MobileDetails(
      {this.id_d, this.name_d, this.three_in_one, this.coffe, this.coho});

  @override
  _MobileDetailsState createState() => _MobileDetailsState();
}

class _MobileDetailsState extends State<MobileDetails> {

  Future  deleteemployee() async{
    Uri url=Uri.parse("https://alumaracoffe.com/employee/delete_employee.php");

    Map<String , String> map= {
      "name": widget.name_d.toString(),
      "id": widget.id_d.toString(),
      "coho": widget.coho.toString(),
      "coffe": widget.coffe.toString(),
      "three_in_one": widget.three_in_one.toString()};

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التفاصيل'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Image.asset("images/product/1.jpg"),
              footer: Container(
                  height: 80,
                  color: Colors.black.withOpacity(0.3),
                  child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  widget.name_d,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "${widget.coho}\$",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ))),
            ),
          ),

          Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                        "المواصفات",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              )),

          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                mySpec(context, "name : ", widget.name_d, Colors.white,
                    Colors.blue),
                mySpec(
                    context, "id : ", widget.id_d, Colors.white, Colors.blue),

                mySpec(context, "three_in_one :", widget.three_in_one,
                    Colors.blue, Colors.white),
                mySpec(context, "  coffe :  ", widget.coffe, Colors.white,
                    Colors.blue),



                mySpec(
                    context, "coho : ", widget.coho, Colors.red, Colors.white),



                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () async {
                          await Navigator.pushNamed(context, 'sendData',
                              arguments: {
                                "name": widget.name_d,
                                "id": widget.id_d,
                                "coho": widget.coho,
                                "coffe": widget.coffe,
                                "three_in_one": widget.three_in_one
                              });
                        },
                        child: Text("SEND"),
                      ),
                      OutlinedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(

                            content: const Text("ARE YOU sure you won't to delete this employee "),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool result33 = await deleteemployee();
                                  if(result33){
                                    Navigator.pushReplacement (
                                      context,
                                      CupertinoPageRoute(builder: (context) =>  drinks()),
                                    );
                                  }
                                },
                                child: const Text('OK'),
                              )
                            ],
                          ),
                        ),
                        child: Text("delete"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          // End Column Specfiction
        ],
      ),
    );
  }
}

mySpec(context, String feature, String details, Color colorbackground,
    Color colortext) {
  return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      color: colorbackground,
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              fontSize: 19,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: feature),
              TextSpan(text: details, style: TextStyle(color: colortext)),
            ]),
      ));
}
