import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

class alluser extends StatelessWidget {

  var id;
  final mo_id;
  final first_name;

  final last_name;


  final email;
var type_of_user;
var image;









  alluser(
      {
        this.mo_id,


        this.first_name,


        this.last_name,



        this.email,
        this.type_of_user,


      });




  @override
  Widget build(BuildContext context) {
    if(type_of_user=="1"){
      type_of_user="Admin";
    }
    else if(type_of_user=="2"){
      type_of_user="client";
    }
    else if(type_of_user=="3"){
      type_of_user="employee";
    }
    else if(type_of_user=="4"){
      type_of_user="machine";
    }
    else if(type_of_user=="5"){
      type_of_user="store";
    }

    if(email=="mamdouhkabbani5@gmail.com"){
      image="images/mamdouh.jpg";

    }
    else if(email=="monzer.kidda@outlook.com"){
      image="images/monzer.jpg";
    }
    else if(email=="monzer.kid77@gmail.com"){
      image="images/monzer_admin.jpg";

    }
    else if(email=="seahyassen@hotmail.com"){
      image="images/sayyah.jpg";
    }
    else if(email=="mamdouhkabbani1995@yahoo.com"){
      image="images/mamdouh1.jpg";
    }
    else if(email=="kabbani-15-mamdouh@hotmail.com"){
      image="images/mamdouh2.jpg";

    }
    else if(email=="sedrajawish8@gmail.com"){
      image="images/sedra.jpg";

    }
    else{
      image="images/3_in_1.jpg";
    }



    id=mo_id;



    return InkWell(
      child: Container(
        height: 220,
        width: 100,
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                flex:2,
                child: Image.asset(image),
              ),

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
                          child: Text(first_name+" "+last_name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center),
                        ),









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
                        ),


                        Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                  " id : ${mo_id}",
                                  style:
                                  TextStyle(color: Colors.brown, fontSize: 18 , fontWeight: FontWeight.w700),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                  " type_of_user : ${type_of_user}",
                                  style:
                                  TextStyle(color: Colors.brown, fontSize: 18 , fontWeight: FontWeight.w700),
                                )
                            ),
                          ],
                        ),



                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      onTap: () async {

        await Navigator.pushNamed(context,'permision',
            arguments: {


              "id_recipient":mo_id,
              "name":first_name+last_name,

            }
        );





      },
    );
  }
}

//                       return MobileDetails(name , screen , screen_protect , screen_res  , system , cpu  , num_core , gpu , memory , battery , camera_main , camera_feature , camera_video , camera_tele , camera_ultra , camera_depth , camera_micro , camera_self_feature , camera_self_video  , camera_self  ,price_uae , price_eg , price_jo , price_sa , price_sy , price_alg);
