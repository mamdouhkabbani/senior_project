import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

import 'MachineDetails.dart';
import 'Permision_Machine.dart';
import 'constants.dart';

class Test_Charge_Client_Account extends StatelessWidget {

  var name;
  var id;

  final first_name;
  final last_name;
  var availability;

  final Balance;
  final email;



  Test_Charge_Client_Account({
    this.id,



    this.availability, this.first_name, this.last_name, this.Balance, this.email,


  });

  @override
  Widget build(BuildContext context) {
    name=first_name+" "+last_name;
    Color z;
    IconData y;
   if(availability=="1"){
      z=Colors.white;
      y=Icons.check;

    }






    return
      GridTile(
          child:
          InkWell(
            onTap:() async{

              /* await Navigator.pushNamed(context,'MachineDetails',
                    arguments: {


                      //"id_recipient":mo_id,

                    }
                );*/
              await Navigator.pushNamed(context,'Charge_Balance',
                  arguments: {


                    "id_Machine":id,
                    "name":name,
                    "email":email


                  });

            } ,

            child: Container(
              height: 220,
              width: 100,


              child: Card(
                color: z,
                child: Row(


                  children: <Widget>[



                    Expanded(
                      flex: 3,
                      child: Container(
                          alignment: Alignment.topRight,
                          height: 220,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Row(
                                    children: [
                                      LimitedBox(

                                        child: Text("id:"+id,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                            textAlign: TextAlign.center),




                                      ),


                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),

                                          child: Icon(y),

                                        ),

                                      ),
                                    ],
                                  )),
                              Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      LimitedBox(child:Text(
                                        "Name:${name} ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                      ) ,),


                                    ],
                                  )),

                              Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      LimitedBox(child:Text(
                                        "Email:${email} ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                      ) ,),


                                    ],
                                  )),



                              Padding(
                                padding: EdgeInsets.only(top: 1),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Balance: ",
                                      style:
                                      TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                    ),
                                    Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Text(
                                          Balance,
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                        )),
                                  ],
                                ),
                              ),


                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),

          )
      );


  }
}
