import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/preorder.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'all_pre_order_user.dart';
import 'client_mydrawer.dart';
import 'my-globale.dart' as globals;
import 'package:http/http.dart' as http;

import 'mydrawer.dart';
import 'mydrawer2.dart';

class yourmode_cohco extends StatefulWidget
{
  const yourmode_cohco({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState()
  {
    return _MyStatefulWidgetState();
  }

}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<yourmode_cohco>
{
  double cohco = 1;
  double water = 1;
  var rotation_rate_cohco=0200;
  var rotation_rate_water=0002;
  var add_to_total;
  var total="0";
  String y;
  String price;
  var result1=1;
  /*Future generate_code_password() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/pre_order.php");
    Map<String, String> map = {
      "id_client": y.toString(),
      "numbers_of_Engines": total,

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
  }*/

  Future price_of_all_material() async {
    Uri url = Uri.parse("https://alumaracoffe.com/machine/price_of_material.php");
    Map<String, String> map = {
      "numbers_of_Engines": total.toString(),

    };
    try {
      var response = await http.post(url, body: jsonEncode(map));
      print(response.body);

      var responsebody = jsonDecode(response.body);
      print(responsebody);
      price=response.body;
      print(price);


      return price;
    } catch (e) {
      print(e);
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    y = globals.iduser;
    return Scaffold(
      appBar: AppBar(title: Text("Special Taste"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back),onPressed:(){
            Navigator.pushReplacement (
              context,
              CupertinoPageRoute(builder: (context) =>  preorder()),
            );
          }, )
        ],
      ),
      drawer: client_MyDrawer(),

      body: Column(children: <Widget>[
        Text("Special Taste Cohco",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Text("Ordinary Cup Contain Cohco:1= 6 Grams ,Water:1=200 Ml",
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Container(height: 100,width: 200,),
        Center(child:Row(children: <Widget>[
          Container(child:Text("cohco",style:TextStyle(color: Colors.black,fontWeight:FontWeight.bold)),padding:EdgeInsets.fromLTRB(20, 0, 0, 10),),

          Expanded(child:SfSlider(
            min: 0.5,
            max: 2,
            value: cohco,
            interval: 0.5,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 0,
            stepSize:0.5,
            onChanged: ( value){
              setState(() {
                cohco = value;
                if(cohco==0.5){
                  rotation_rate_cohco=0100;
                }
                else if(cohco==1){
                  rotation_rate_cohco=0200;
                }
                else if(cohco==1.5){
                  rotation_rate_cohco=0300;
                }
                else if(cohco==2){
                  rotation_rate_cohco=0400;
                }
                else{
                  rotation_rate_cohco=0000;

                }
              });
            },
          ),)

        ],
        ),
        ),
        Container(height: 100,width: 200,),
        Center(child:Row(children: <Widget>[
          Container(child:Text("water",style:TextStyle(color: Colors.black,fontWeight:FontWeight.bold)),padding:EdgeInsets.fromLTRB(25, 10, 0, 0),),


          Expanded(child:SfSlider(
            min: 0.5,
            max: 2,
            value: water,
            interval: 0.5,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 0,
            stepSize: 0.5,
            onChanged: ( value){
              setState(() {
                water = value;
                if(water==0.5){
                  rotation_rate_water=0001;
                }
                else if(water==1){
                  rotation_rate_water=0002;
                }
                else if(water==1.5){
                  rotation_rate_water=0003;
                }
                else if(water==2){
                  rotation_rate_water=0004;
                }
                else{
                  rotation_rate_water=0000;

                }
              });
            },
          ),)

        ],
        ),
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: RaisedButton(
                    onPressed: () async {
                      total="0";
                      add_to_total=rotation_rate_cohco+rotation_rate_water;
                      print(add_to_total);
                      add_to_total=add_to_total.toString();
                      total=total+add_to_total;


                      print(total);
                      var result = await price_of_all_material();
                      result1=int.parse(result);
                      if ( result1>1) {
                        await Navigator.pushNamed(context, 'confirm_your_order',
                            arguments: {
                              "numbers_of_Engines": total,
                              "price":price

                            });
                      }


                    },
                    child: Text("Confirm"),
                    color: Colors.brown,
                    textColor: Colors.white,
                  )),
              Expanded(
                  child: RaisedButton(
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => preorder()),
                      );


                    },
                    child: Text("Canceled"),
                    color: Colors.brown,
                    textColor: Colors.white,
                  )),
            ],
          ),
        ),


      ],),

    );


  }
}