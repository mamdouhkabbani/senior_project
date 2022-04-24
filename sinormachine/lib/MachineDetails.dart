import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Machine_Details extends StatelessWidget {
  var name;
  var id;
  final first_name;
  final last_name;
  var time;
  var availability;

  var image;
  final three_in_one;
  final Choco;
  final coffe;
  final temp;
  final water;
  final location;
  var aval;


  Machine_Details(
      {this.id,this.first_name, this.last_name, this.three_in_one, this.Choco, this.coffe, this.temp, this.water, this.location,this.availability});

  /*@override
  _MobileDetailsState createState() => _MobileDetailsState();*/

  @override
  Widget build(BuildContext context) {
    name=first_name+" "+last_name;
    var coffe1=int.parse(coffe);
    var Choco1=int.parse(Choco);
    var three_in_one1=int.parse(three_in_one);
    var water1=int.parse(water);
   var water2;
   var water3;
    if(water1>0){
       water2=(((11-water1)/11))*3000;
       water3=water2.toString();
    }
    else if(water1==0){
      water2=((water1/11))*3000;
      water3=water2.toString();
    }

    IconData y;
    if(availability=="0"){
      y=Icons.close;
      aval="Not Available";

    }else if(availability=="1"){
      y=Icons.check;
      aval="Available";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Macine Details'),
      ),

      body: Column(

        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(Icons.looks_one_outlined),
            title: Text('id: ${id}'),

          ),
          ListTile(
            leading: Icon(Icons.sort_by_alpha_outlined),
            title: Text('Name: ${name}'),

          ),
          ListTile(
            leading: Icon(y),
            title: Text('Status: ${aval}'),

          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address : ${location}'),

          ),
          /*ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Last Update: '+ DateTime.now().toIso8601String(),),

          ),*/

          ListTile(

            title: Text('Coffe: ${coffe} G '),

          ),

          ListTile(

            title: Text('Choco: ${Choco} G '),

          ),

          ListTile(

            title: Text('Three_In_One: ${three_in_one} G '),

          ),

          ListTile(

            title: Text('Temperature: ${temp} Celsius '),

          ),
          ListTile(

            title: Text('Water: ${water} Cm '),

          ),



          Expanded(
            child: Align(
              alignment: FractionalOffset.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan[800],
                  boxShadow: [
                    BoxShadow(color: Colors.black  ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.only(top:10 , bottom: 10),
                  child: Row(
                    children: [
                      Expanded(child: _AnimatedLiquidLinearProgressIndicator(
                        color: Colors.brown[900],
                        val: double.tryParse(coffe),
                      )),
                      Expanded(child: _AnimatedLiquidLinearProgressIndicator(
                        color: Colors.brown,
                        val: double.tryParse(Choco),
                      )),
                      Expanded(child: _AnimatedLiquidLinearProgressIndicator(
                        color: Colors.brown[200],
                        val: double.tryParse(three_in_one),
                      )),
                      Expanded(child: _AnimatedLiquidLinearProgressIndicator(
                        color: Colors.blue,
                        val: double.tryParse(water3),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              MaterialButton(
                  color: Colors.cyan[700],
                  elevation: 15,

                  onPressed: () => {},
                  child: Text( 'Reset' ,
                    style: TextStyle( fontSize: 30,
                      color: Colors.white,),
                  )
              ),

              MaterialButton(
                  color: Colors.redAccent,
                  elevation: 13,

                  onPressed: () => {},
                  child: Text( 'DeActivate' ,
                    style: TextStyle( fontSize: 30,
                      color: Colors.white,),
                  )
              )
            ],
          )


        ],
      ),
    );
  }


}
class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  final Color color;
  final double val;

  const _AnimatedLiquidLinearProgressIndicator({Key key, this.color, this.val}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

/*class _MobileDetailsState extends State<Machine_Details> {




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
}*/

/*mySpec(context, String feature, String details, Color colorbackground,
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
}*/


class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
double q=((((widget.val)/3000)*100)*100).round()/100.0;

    //final percentage = _animationController.value * 100;
    return
      Container(
        height: 250,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: LiquidLinearProgressIndicator(
          direction: Axis.vertical,
          value: q/100,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(widget.color),
          borderRadius: 12.0,
          center: Text(
            "${ q.toStringAsFixed(1)}%",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }
}