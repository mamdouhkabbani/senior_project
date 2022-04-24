import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

class information_of_user extends StatelessWidget {
  //var price ;
  var id;
  final mo_id;
  final first_name;

  final last_name;
  var image;

  //final max_three_in_one;
 // final max_coho;
  final email;





  //final coffe ;

  //final coho;





  information_of_user(
      {
        this.mo_id,


        this.first_name,

    //    this.coffe ,
        this.last_name,


        //this.coho, this.max_three_in_one, this.max_coho,
        this.email,


       });



  @override
  Widget build(BuildContext context) {


      //price = coho ;
      id=mo_id;
      if(mo_id=='51'){
        //mamdouh
        image="images/mamdouh.jpg";
      }
      else if(mo_id=='53'){
        //monzer

        image="images/monzer.jpg";
      }
      else if(mo_id=='54'){
        //monzer

        image="images/monzer_admin.jpg";
      }
      else if(mo_id=='55'){
        //sayyah

        image="images/sayyah.jpg";
      }
      else if(mo_id=='57'){
        //mamdouh
        image="images/mamdouh1.jpg";
      }
      else if(mo_id=='63'){
        //mamdouh
        image="images/mamdouh2.jpg";
      }
      else if(mo_id=='64'){
        //sedra
        image="images/sedra.jpg";
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
                child:Image.asset(image),
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
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      onTap: () async {
       // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          await Navigator.pushNamed(context,'sendData',
              arguments: {


                "id_recipient":mo_id,

              }
      );

       /* }
        )
        );*/


     /*     return SEND(
            //id_empl: last_name,
            ///

            //three_in_one: first_name,
            //

            *//*   coffe: this.coffe,
            max_three_in_one:max_three_in_one,
            max_coho:max_coho,*//*
            //max_coffe:email,
            //



            //coho: this.coho,

            //id_d:mo_id,
            //

          );*/
      },
    );
  }
}

//                       return MobileDetails(name , screen , screen_protect , screen_res  , system , cpu  , num_core , gpu , memory , battery , camera_main , camera_feature , camera_video , camera_tele , camera_ultra , camera_depth , camera_micro , camera_self_feature , camera_self_video  , camera_self  ,price_uae , price_eg , price_jo , price_sa , price_sy , price_alg);
