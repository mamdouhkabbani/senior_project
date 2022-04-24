import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

class test_list_all_preordes extends StatelessWidget {
  //var price ;
  //var id;

  var type_of_drink;
  final code;

  final password;
  var num_type_of_drink;
  var time;
  var status;
  var x=1;
  var execution;
  var exe;
  var image;
  var price;

  //final max_three_in_one;
  // final max_coho;
  //final email;

  //final coffe ;

  //final coho;

  test_list_all_preordes({
    this.type_of_drink,
    this.code,
    this.password,
    this.num_type_of_drink,
    this.time,
    this.status,
    this.execution,
    this.exe,
    this.price

  });

  @override
  Widget build(BuildContext context) {
    //execution=exe.toString();
    Color z=Colors.blue;
    IconData y=Icons.close;
    if(status=="0"){
      y=Icons.close;
      z=Colors.red[300];

    }
    else if(status=="1"){
      z=Colors.white;
      y=Icons.check;

    }

     if(exe==time){

      execution="not executed";

    }else if(exe!=time) {
       execution=exe;

     }

    num_type_of_drink = int.parse(type_of_drink);
    if (num_type_of_drink == 2002) {
      type_of_drink = "3 in 1";
      image="images/3_in_1.jpg";

    } else if (num_type_of_drink == 0202) {
      type_of_drink = "Cohco";
      image="images/cohco.jpg";

    } else if (num_type_of_drink == 0022) {
      type_of_drink = "Coffe";
      image="images/coffe.jpg";


    } else if (num_type_of_drink == 2202) {
      type_of_drink = "Mochachino";
      image="images/mochachino.jpg";


    } else
      {
        image="images/SPECIAL_TASTE.png";
      if (num_type_of_drink >= 0011 && num_type_of_drink <= 0014) {
        type_of_drink = "Special Taste Coffe";
      } else if (num_type_of_drink == 0021) {
        type_of_drink = "Special Taste Coffe";
      } else if (num_type_of_drink >= 0023 && num_type_of_drink <= 0044) {
        type_of_drink = "Special Taste Coffe";
      } else if (num_type_of_drink >= 0101 && num_type_of_drink <= 0104) {
        type_of_drink = "Special Taste Cohco";
      } else if (num_type_of_drink == 0201) {
        type_of_drink = "Special Taste Cohco";
      } else if (num_type_of_drink >= 0203 && num_type_of_drink <= 0404) {
        type_of_drink = "Special Taste Cohco";
      }
      //3_in_1&&mochachino

      else if (num_type_of_drink >= 1001 && num_type_of_drink <= 1004) {
        type_of_drink = "Special Taste Three_In_One";
      } else if (num_type_of_drink >= 1101 && num_type_of_drink <= 1104) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 1201 && num_type_of_drink <= 1204) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 1301 && num_type_of_drink <= 1304) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 1401 && num_type_of_drink <= 1404) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 2001 && num_type_of_drink <= 2004) {
        type_of_drink = "Special Taste Three_In_One";
      } else if (num_type_of_drink >= 2101 && num_type_of_drink <= 2104) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink == 2201) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 2203 && num_type_of_drink <= 2204) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 2301 && num_type_of_drink <= 2304) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 2401 && num_type_of_drink <= 2404) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 3001 && num_type_of_drink <= 3004) {
        type_of_drink = "Special Taste Three_In_One";
      } else if (num_type_of_drink >= 3101 && num_type_of_drink <= 3104) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 3201 && num_type_of_drink <= 3204) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 3301 && num_type_of_drink <= 3304) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 3401 && num_type_of_drink <= 3404) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 4001 && num_type_of_drink <= 4004) {
        type_of_drink = "Special Taste Three_In_One";
      } else if (num_type_of_drink >= 4101 && num_type_of_drink <= 4104) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 4201 && num_type_of_drink <= 4204) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 4301 && num_type_of_drink <= 4304) {
        type_of_drink = "Special Taste Mochachino";
      } else if (num_type_of_drink >= 4401 && num_type_of_drink <= 4404) {
        type_of_drink = "Special Taste Mochachino";
      }
    }




   /* if(x==1){
      y=Icons.check;
      //z=Colors.brown;
    }
    else{
      y=Icons.close;
      //z=Colors.red;
    }*/
    //Size ScreensHelper= MediaQuery.of(context).size;
    return
      GridTile(
      child:
      InkWell(
        child: Container(
          height: 220,
          width: 100,


          child: Card(
            color: z,
            child: Row(


              children: <Widget>[


                Expanded(
                  flex:3,
                  child: Image.asset(image),
                ),

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

                                    child: Text(type_of_drink,
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
                                    "Code:${code} ",
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
                                Icon(Icons.lock),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Password: ",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                ),
                                Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      password,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                    )),
                              ],
                            ),
                          ),

                          Expanded(
                              child: Row(


                                children: <Widget>[
                                  Icon(
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
                                      )),
                                  //ListTile(leading: Icon(Icons.date_range),),
                                ],
                              )),

                          Expanded(
                            child: Row(


                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                ),
                                SizedBox(
                                  width: 5,
                                ),

                                Text(
                                  "Time_Of_Execution: ",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                ),
                                Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      execution,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                    )),
                                //ListTile(leading: Icon(Icons.date_range),),
                              ],
                            )),
                          Expanded(
                              child: Row(


                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text(
                                    "Price ",
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        price,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                      )),
                                  //ListTile(leading: Icon(Icons.date_range),),
                                ],
                              )),

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
