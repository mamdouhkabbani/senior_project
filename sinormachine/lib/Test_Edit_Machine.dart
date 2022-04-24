import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

import 'MachineDetails.dart';
import 'Permision_Machine.dart';
import 'constants.dart';

class Test_Edit_Machines extends StatelessWidget {
  //var price ;
  //var id;
  var name;
  var id;
  //final code;

  //final password;
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


  //final max_three_in_one;
  // final max_Choco;
  //final email;

  //final coffe ;

  //final Choco;

  Test_Edit_Machines({
    this.id,
    //this.code,
    //this.password,

    this.time,
    this.availability, this.first_name, this.last_name, this.three_in_one, this.Choco, this.coffe, this.temp, this.water, this.location,


  });

  @override
  Widget build(BuildContext context) {
    name=first_name+" "+last_name;
    Color z=Colors.blue;
    IconData y=Icons.close;
    if(availability=="0"){
      y=Icons.close;
      z=Colors.red[300];

    }
    else if(availability=="1"){
      z=Colors.white;
      y=Icons.check;

    }
    image="images/Machine.jpg";






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
              await Navigator.pushNamed(context,'Permision_Machine',
              arguments: {


              "id_Machine":id,
              "name":name

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
                      flex:2,
                      child:Image.asset(image),
                    ),


                    /*Expanded(
                      flex:3,
                      child: Image.asset(image),
                    ),*/

                    /*  Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                        " id : ${type_of_drink}",
                        style:
                        TextStyle(color: Colors.red, fontSize: 18 , fontWeight: FontWeight.w700),
                      )),
                ],
              ),
*/
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
                                        //maxWidth: ScreensHelper.width*0.7,

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

                                      /*Directionality(
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  code,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ))*/
                                    ],
                                  )),

/*
                        Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "email : ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 20),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  email,
                                  style: TextStyle(color: Colors.blue,  fontSize: 20),
                                ))

                              ],
                            )
                        ),*/

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
                                      "Location: ",
                                      style:
                                      TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                    ),
                                    Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Text(
                                          location,
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                        )),
                                  ],
                                ),
                              ),

                              /* Expanded(
                                  child: Row(


                                    children: <Widget>[
                                      *//*Icon(
                                        Icons.date_range,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),




                                      Text(
                                        "Time: ",
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                      ),
                                      Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Text(
                                            time,
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                          )),*//*
                                      //ListTile(leading: Icon(Icons.date_range),),
                                    ],
                                  )),*/

                              /*Expanded(
                                  child: Row(


                                    children: <Widget>[
                                     *//* Icon(
                                        Icons.date_range,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),*//*


                                      //ListTile(leading: Icon(Icons.date_range),),
                                    ],
                                  )),*/
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            /*  onTap: () async
      {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        await Navigator.pushNamed(context,'sendData',
            arguments: {


              "id_recipient":type_of_drink,

            }
        );

        */ /* }
        )
        );*/ /*


        */ /*     return SEND(
            //id_empl: password,
            ///

            //three_in_one: code,
            //

            */ /**/ /*   coffe: this.coffe,
            max_three_in_one:max_three_in_one,
            max_coho:max_coho,*/ /**/ /*
            //max_coffe:email,
            //



            //coho: this.coho,

            //id_d:type_of_drink,
            //

          );*/ /*
      },*/
          )
      );


  }
}
