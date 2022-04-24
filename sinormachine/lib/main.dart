import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sinormachine/constants.dart';
import 'package:sinormachine/permision.dart';
import 'package:sinormachine/sendData.dart';
import 'package:sinormachine/sendData2.dart';
import 'package:sinormachine/signup2.dart';


import 'Charge_Balance.dart';
import 'Final_Transfare_To_Store.dart';
import 'MachineDetails.dart';
import 'Permision_Machine.dart';
import 'Test_Machine_need_servecing.dart';
import 'confirm_your_order.dart';
import 'info.dart';
import 'info2.dart';
import 'login2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffe Machine Service Web',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //textTheme: GoogleFonts.secularOneTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes:{






        'sendData':(context){
          return SEND();
        },
        'info':(context){
          return INFO();
        },
        'permision':(context){
          return Mypermision();
        },
        'confirm_your_order':(context){
          return confirm_you_order();
        },
        'MachineDetails':(context){
          return Machine_Details();
        },
        'Permision_Machine':(context){
          return Permision_Machine();
        },

        'Charge_Balance':(context){
          return Charge_Balance() ;
        },
        'Final_Transfare_To_Store':(context){
          return Final_Transfare_To_Store() ;
        },
        'Test_Machine_need_servecing':(context){
          return Test_Machine_need_servecing();
        },
        'sendData2':(context){
          return SEND2();
        },
        'info2':(context){
          return INFO2();
        },








      } ,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Option selectedOption = Option.LogIn;
  String currentuser1;

  @override
  Widget build(BuildContext context) {
    final  Map<String, Object>rcvdData = ModalRoute.of(context).settings.arguments;
    currentuser1=rcvdData.toString();
    print(currentuser1);

    Size size = MediaQuery.of(context).size;

    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: kPrimaryColor,
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.white),
              ],
            ),
            //  Align(
            //      alignment: Alignment.topLeft,
            //     child: Padding(
            //       padding: EdgeInsets.all(32),
            //      child: Text(
            //        "Login Page",
            //         style: TextStyle(
            //          color: Colors.white,
            //           fontSize: 24,
            //          fontWeight: FontWeight.bold,
            //         ),
            ///         ),
            //        ),
            //      ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coffe machines Service Company',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "coffee cup in hand at syria land",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //  Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Padding(
            //    padding: EdgeInsets.all(32),
            //    child: Row(
            //     children: [
            //       Icon(
            //       Icons.keyboard_arrow_left,
            //        color: Colors.white,
            //        size: 28,
            //      ),
            //       SizedBox(
            //         width: 8,
            //       ),
            //       Text(
            //         "HOME",
            //        style: TextStyle(
            //           color: Colors.white,
            //          fontSize: 16,
            //         ),
            //        ),
            //      ],
            //      ),
            //       ),
            //     ),
            //    Align(
            //   alignment: Alignment.topRight,
            //  child: Padding(
            //   padding: EdgeInsets.all(32),
            //   child: Icon(
            // Icons.menu,
            //    color: Color(0xFFFE4350),
            //    size: 28,
            //  ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Copyright 2021",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),

              //Animation 1
              //transitionBuilder: (widget, animation) => RotationTransition(
              //  turns: animation,
              //  child: widget,
              //),
              //switchOutCurve: Curves.easeInOutCubic,
              //switchInCurve: Curves.fastLinearToSlowEaseIn,

              //Animation 2
              transitionBuilder: (widget, animation) =>
                  ScaleTransition(child: widget, scale: animation),

              child: selectedOption == Option.LogIn
                  ? LogIn2(
                onSignUpSelected: () {
                  setState(() {
                    selectedOption = Option.SignUp;
                  });
                },
              )
                  : SEND3(
                onLogInSelected: () {
                  setState(() {
                    selectedOption = Option.LogIn;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
