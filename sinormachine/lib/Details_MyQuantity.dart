import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'mydrawer2.dart';

class Details_MyQuantity extends StatelessWidget {
  var name;
  var id;
  final first_name;
  final last_name;
  final three_in_one;
  final Choco;
  final coffe;
  final id_empl;
  final max_three_in_one;
  final max_coho;
  final max_coffe;
  final email;


  Details_MyQuantity(
      {this.id,this.first_name, this.last_name, this.three_in_one, this.Choco, this.coffe, this.id_empl, this.max_three_in_one, this.max_coho, this.max_coffe, this.email});

  /*@override
  _MobileDetailsState createState() => _MobileDetailsState();*/

  @override
  Widget build(BuildContext context) {
    name=first_name+" "+last_name;
    var coffe1=int.parse(coffe);
    var Choco1=int.parse(Choco);
    var three_in_one1=int.parse(three_in_one);
    var maxt=int.parse(max_three_in_one);
    var maxco=int.parse(max_coho);
   var maxcf=int.parse(max_coffe);
    var t1,t2;
    var cof1,cof2;
    var Ch1,Ch2;

    if(three_in_one1>0){
      t1=(three_in_one1/maxt)*100;
      t2=t1.toString();

    }
     if(coffe1>0){
       cof1=(coffe1/maxcf)*100;
       cof2=cof1.toString();

    }
    if(Choco1>0){
      Ch1=(Choco1/maxco)*100;
      Ch2=Ch1.toString();

    }


    return Scaffold(
      appBar:AppBar(title: Text("MYQUANTITY_Details")
      ),
      drawer: MyDrawer2(),

      body: Column(

        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(Icons.looks_one_outlined),
            title: Text('id: ${id_empl}'),

          ),
          ListTile(
            leading: Icon(Icons.sort_by_alpha_outlined),
            title: Text('Name: ${name}'),

          ),
          ListTile(

            title: Text('Email: ${email}'),

          ),



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

            title: Text('Max_three_in_one: ${max_three_in_one} G '),

          ),
          ListTile(

            title: Text('Max_coho: ${max_coho} G '),

          ),

          ListTile(

            title: Text('Max_coffe: ${max_coffe} G '),

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
                        val: double.tryParse(cof2),
                      )),
                      Expanded(child: _AnimatedLiquidLinearProgressIndicator(
                        color: Colors.brown,
                        val: double.tryParse(Ch2),
                      )),
                      Expanded(child: _AnimatedLiquidLinearProgressIndicator(
                        color: Colors.brown[200],
                        val: double.tryParse(t2),
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
    double q=((((widget.val)))*100).round()/100.0;

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