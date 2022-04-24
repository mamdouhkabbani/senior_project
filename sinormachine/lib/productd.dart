import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'drinks.dart';
class MobileDetails extends StatefulWidget {
  final id_empl;

  final three_in_one;


  final coffe;

  final coho;


  final id_d;
  final max_three_in_one;
  final max_coho;
  final max_coffe;

  MobileDetails(
      {this.id_d, this.id_empl, this.three_in_one, this.coffe, this.coho, this.max_three_in_one, this.max_coho, this.max_coffe});

  @override
  _MobileDetailsState createState() => _MobileDetailsState();
}

class _MobileDetailsState extends State<MobileDetails> {

  Future  deleteemployee() async
  {
    Uri url=Uri.parse("https://alumaracoffe.com/employee/delete_employee.php");

    Map<String , String> map= {
      "location": widget.id_empl.toString(),
      "id": widget.id_d.toString(),
      "coho": widget.coho.toString(),
      "coffe": widget.coffe.toString(),
      "three_in_one": widget.three_in_one.toString(),
      };

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

 /* Future sendId()async
  {
    Uri url=Uri.parse("https://alumaracoffe.com/employee/test.php");

    Map<String , String> map= {
      "id_empl": widget.id_empl.toString(),

    };

    try{
      var response=await http.post
        (url,
          body: jsonEncode(map)
      );
      print(response.body);
      var responsebody=jsonDecode(response.body);

      var s="";
      var x=response.body.split('[');
      var y=x.length;
      for(int i=0;i<y;i++){
        s=s+""+x[i];
      }
      print("s");
      print(s);
      var w=s;
      var k=w.split("]");

      var ll=k.length;
      var zz="";
      for(int j=0;j<ll;j++){
        zz=zz+" "+k[j];

      }
      print("zz");
      print(zz);


      var ww=zz;
      var kk=ww.split("{");

      var lll=kk.length;
      var zzz="";
      for(int j=0;j<lll;j++){
        zzz=zzz+" "+kk[j];

      }
      print("zzz");
      print(zzz);


      var www=zzz;
      var kkk=www.split("}");

      var llll=kkk.length;
      var zzzz="";
      for(int j=0;j<llll;j++){
        zzzz=zzzz+" "+kkk[j];

      }

      var xvc=zzzz.replaceAll('"', '');
      print("zzzz");
      print(zzzz);
      print("xvc");
      print(xvc);
      *//*var xyz=zzzz;
      var kwq=xyz.split("\"");
      var lmno=kwq.length;
      var qzx="";
      for(int j=0;j<lmno;j++){
        qzx=qzx+" "+kkk[j];

      }
      print("qzx");
      print(qzx);*//*


      //print(responsebody);
      List<String>list;
      print("zz1");
      list=xvc.split(",");
      print("zz2");
      print(list);
      print("zz3");
      String first_name=list[0];
      String last_name=list[1];
      String email=list[2];
      String mobile_number=list[3];
      String gender=list[4];
      String date_of_birthday=list[5];
      print(first_name);
      print(last_name);
      print(email);
      print(mobile_number);
      print(gender);
      print(date_of_birthday);

      f=first_name.split(":");
      la=last_name.split(":");
      e=email.split(":");
      mo=mobile_number.split(":");
      ge=gender.split(":");
      da=date_of_birthday.split(":");
      print("first_name="+f[1]);
      print("last_name="+la[1]);
      print("email="+e[1]);
      print("mobile_number="+mo[1]);
      print("gender="+ge[1]);
      print("date_of_birthday="+da[1]);




      return responsebody;
    }catch( e){
      print(e);
      return false;
    }





  }*/
  var f;
  var la;
  var e;
  var mo;
  var ge;
  var da;

 /* @override
  void initState() {
    sendId();

    super.initState();
  }
*/
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
                              widget.id_empl,
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
                mySpec(context, "id_empl : ", widget.id_empl, Colors.white,
                    Colors.blue),

                mySpec(context, "first_name : ", widget.id_empl, Colors.white,
                    Colors.blue),
                mySpec(context, "last_name : ", widget.id_empl, Colors.white,
                    Colors.blue),
                mySpec(context, "id_empl : ", widget.id_empl, Colors.white,
                    Colors.blue),
                mySpec(context, "id_empl : ", widget.id_empl, Colors.white,
                    Colors.blue),



                mySpec(context, "max_three_in_one : ", widget.max_three_in_one, Colors.white,
                    Colors.blue),

                mySpec(context, "max_coho : ", widget.max_coho, Colors.white,
                    Colors.blue),

                mySpec(context, "max_coffe : ", widget.max_coffe, Colors.white,
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
                                "id_empl": widget.id_empl,
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
