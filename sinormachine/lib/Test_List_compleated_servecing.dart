import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

import 'Details_MyQuantity.dart';
import 'MachineDetails.dart';
import 'constants.dart';

class Test_list_compleated_servecing extends StatelessWidget {
  //var price ;
  //var id;




  var image;
  var name;
  var id;
  final id_machine;
  final Status_OF_Service;
  final three_in_one;
  final Choco;
  final coffe;
  final id_empl;
  final max_three_in_one;
  var time;



  //final max_three_in_one;
  // final max_Choco;
  //final email;

  //final coffe ;

  //final Choco;

  Test_list_compleated_servecing({
    this.id,
    //this.code,
    //this.password,


    this.id_machine, this.Status_OF_Service, this.three_in_one, this.Choco, this.coffe, this.id_empl, this.max_three_in_one


  });

  @override
  Widget build(BuildContext context) {

    Color z=Colors.blue;










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
                                        //maxWidth: ScreensHelper.width*0.7,

                                        child: Text("id:"+id_empl,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                            textAlign: TextAlign.center),




                                      ),



                                    ],
                                  )),
                              Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      LimitedBox(child:Text(
                                        "Name:${id_machine} ",
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

                                  ],
                                ),
                              ),


                              Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      LimitedBox(child:Text(
                                        "Name:${Status_OF_Service} ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                      ) ,),


                                    ],
                                  )),






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
