import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

class list_all_preordes extends StatelessWidget {
  //var price ;
  //var id;

  var type_of_drink;
  final code;

  final password;
  var num_type_of_drink;
  var time;



  //final max_three_in_one;
  // final max_coho;
  //final email;





  //final coffe ;

  //final coho;





  list_all_preordes(
      {
        this.type_of_drink,


        this.code,


        this.password,
        this.num_type_of_drink,
        this.time,





      });






  @override
  Widget build(BuildContext context) {
    num_type_of_drink=int.parse(type_of_drink);
    if(num_type_of_drink==2002){
      type_of_drink="3 in 1";
    }
    else if(num_type_of_drink==0202){
      type_of_drink="cohco";
    }
    else if(num_type_of_drink==0022){
      type_of_drink="coffe";
    }
    else if(num_type_of_drink==2202){
      type_of_drink="mochachino";
    }

    else{
      if(num_type_of_drink>=0011&&num_type_of_drink<=0014)
      {
        type_of_drink="yourmode_coffe";

      }
      else if(num_type_of_drink==0021)
      {
        type_of_drink="yourmode_coffe";

      }
      else if(num_type_of_drink>=0023&&num_type_of_drink<=0044)
      {
        type_of_drink="yourmode_coffe";

      }


      else if(num_type_of_drink>=0101&&num_type_of_drink<=0104)
      {
        type_of_drink="yourmode_cohco";

      }
      else if(num_type_of_drink==0201)
      {
        type_of_drink="yourmode_cohco";

      }
      else if(num_type_of_drink>=0203&&num_type_of_drink<=0404)
      {
        type_of_drink="yourmode_cohco";

      }
      //3_in_1&&mochachino

     else
       if(num_type_of_drink>=1001&&num_type_of_drink<=1004)
            {
              type_of_drink="yourmode_three_in_one";
            }



            else
       if(num_type_of_drink>=1101&&num_type_of_drink<=1104)
              {
                type_of_drink="yourmode_mochachino";
              }
       else
      if(num_type_of_drink>=1201&&num_type_of_drink<=1204)
      {
        type_of_drink="yourmode_mochachino";
      }
      else
      if(num_type_of_drink>=1301&&num_type_of_drink<=1304)
      {
        type_of_drink="yourmode_mochachino";
      }
      else
      if(num_type_of_drink>=1401&&num_type_of_drink<=1404)
      {
        type_of_drink="yourmode_mochachino";
      }



       else
       if(num_type_of_drink>=2001&&num_type_of_drink<=2004)
       {
         type_of_drink="yourmode_three_in_one";


       }


       else
       if(num_type_of_drink>=2101&&num_type_of_drink<=2104)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink==2201)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=2203&&num_type_of_drink<=2204)
       {
         type_of_drink="yourmode_mochachino";

       }

       else
       if(num_type_of_drink>=2301&&num_type_of_drink<=2304)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=2401&&num_type_of_drink<=2404)
       {
         type_of_drink="yourmode_mochachino";

       }

       else
       if(num_type_of_drink>=3001&&num_type_of_drink<=3004)
       {
         type_of_drink="yourmode_three_in_one";

       }


       else
       if(num_type_of_drink>=3101&&num_type_of_drink<=3104)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=3201&&num_type_of_drink<=3204)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=3301&&num_type_of_drink<=3304)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=3401&&num_type_of_drink<=3404)
       {
         type_of_drink="yourmode_mochachino";

       }

       else
       if(num_type_of_drink>=4001&&num_type_of_drink<=4004)
       {
         type_of_drink="yourmode_three_in_one";

       }

       else
       if(num_type_of_drink>=4101&&num_type_of_drink<=4104)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=4201&&num_type_of_drink<=4204)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=4301&&num_type_of_drink<=4304)
       {
         type_of_drink="yourmode_mochachino";

       }
       else
       if(num_type_of_drink>=4401&&num_type_of_drink<=4404)
       {
         type_of_drink="yourmode_mochachino";

       }






    }






    return InkWell(
      child: Container(
        height: 220,
        width: 100,
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                flex:2,
                child: Image.asset("images/product/1.jpg"),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(type_of_drink,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center),
                        ),





                          Expanded(
                            child: Row(
                              children: <Widget>[



                                Text(
                                  "code: ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  code,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )
                          ),


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



                                Text(
                                  "password: ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  password,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                )),

                              ],
                            ),
                        ),

                        Expanded(
                            child: Row(
                              children: <Widget>[




                                Text(
                                  "time: ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  time,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                )),
                                //ListTile(leading: Icon(Icons.date_range),),
                              ],
                            )
                        ),

                      ],
                    )),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

