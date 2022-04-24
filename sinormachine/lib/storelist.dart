import 'package:flutter/material.dart';
import 'package:sinormachine/storedetails.dart';

class MobList extends StatelessWidget {
  //var price ;
  var id;
  final mo_id;
  final name;

  final three_in_one;
  final coffe ;

  final coho;




  MobList(
      {
        this.mo_id,

        this.three_in_one,
        this.coffe ,
        this.name,


        this.coho,

      });
  @override
  Widget build(BuildContext context) {


    //price = coho ;
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
                child: Image.asset("images/product/1.jpg"),
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
                          child: Text(name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center),
                        ),

                        Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "id : ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  id
                                  ,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )),



                        Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "three_in_one : ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  three_in_one,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
                                ))
                              ],
                            )),



                        Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "coffe : ",
                                  style: TextStyle(color: Colors.grey,  fontSize: 16),
                                ),
                                Directionality(textDirection: TextDirection.ltr, child: Text(
                                  coffe,
                                  style: TextStyle(color: Colors.blue,  fontSize: 16),
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
                                  " coho : ${coho}",
                                  style:
                                  TextStyle(color: Colors.red, fontSize: 18 , fontWeight: FontWeight.w700),
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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MobileDetails(
              name_d: name,

              three_in_one: three_in_one,
              coffe: this.coffe,


              coho: this.coho,
              id_d:mo_id
          );
        }));
      },
    );
  }
}

//                       return MobileDetails(name , screen , screen_protect , screen_res  , system , cpu  , num_core , gpu , memory , battery , camera_main , camera_feature , camera_video , camera_tele , camera_ultra , camera_depth , camera_micro , camera_self_feature , camera_self_video  , camera_self  ,price_uae , price_eg , price_jo , price_sa , price_sy , price_alg);
