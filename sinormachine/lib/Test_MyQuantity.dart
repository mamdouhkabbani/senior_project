import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinormachine/productd.dart';
import 'package:http/http.dart' as http;
import 'package:sinormachine/sendData.dart';

import 'Details_MyQuantity.dart';
import 'MachineDetails.dart';
import 'constants.dart';

class Test_MyQuantity extends StatelessWidget {
  //var price ;
  //var id;




  var image;
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


  //final max_three_in_one;
  // final max_Choco;
  //final email;

  //final coffe ;

  //final Choco;

  Test_MyQuantity({
    this.id,
    //this.code,
    //this.password,


     this.first_name, this.last_name, this.three_in_one, this.Choco, this.coffe, this.id_empl, this.max_three_in_one, this.max_coho, this.max_coffe, this.email


  });

  @override
  Widget build(BuildContext context) {
    name=first_name+" "+last_name;
    Color z=Colors.blue;

    image="images/Machine.jpg";

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
                Navigator.push (
                  context,
                  CupertinoPageRoute(builder: (context) =>  Details_MyQuantity(
                    id: id,
                    first_name: first_name,last_name: last_name,three_in_one: three_in_one,Choco: Choco,coffe: coffe,id_empl: id_empl,
                    max_three_in_one: max_three_in_one,
                   max_coho: max_coho,max_coffe: max_coffe,email: email,
                  )),
                ).then((value) => print(value) );

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
                                        "Name:${name} ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                      ) ,),


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
                                      "Email: ",
                                      style:
                                      TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w800),
                                    ),
                                    Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Text(
                                          email,
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
