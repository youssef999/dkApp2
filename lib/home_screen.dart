import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/Helpers/alarm_manager.dart';
import 'package:fire99/OldProfile.dart';
import 'package:fire99/Screens/alarm_screen.dart';
import 'package:fire99/UIFiles/RewardedVideos.dart';
import 'package:fire99/UIFiles/SurveyPage.dart';
import 'package:fire99/UIFiles/Videos.dart';
import 'package:fire99/UIFiles/Wallet.dart';
import 'package:fire99/addpost.dart';
import 'package:fire99/adsscreen.dart';
import 'package:fire99/catlog.dart';
import 'package:fire99/colorr.dart';
import 'package:fire99/licences.dart';
import 'package:fire99/log3.dart';
import 'package:fire99/profx.dart';
import 'package:fire99/screen.dart';
import 'package:fire99/screen2.dart';
import 'package:fire99/survey.dart';
import 'package:fire99/survey2.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle =
        TextStyle(fontSize: 14, color: Color.fromRGBO(63, 63, 63, 1));

    var boxDecoration =
    BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0xffffffff).withOpacity(0.3),
          blurRadius: 7,
          spreadRadius: 1,
          offset: Offset(0, 4), // Shadow position
        ),
      ],
    );

  var txtStyle=
    TextStyle(
    color: Colors.white,
    fontSize: 25,
    letterSpacing: 10,
    shadows: <Shadow>[
    Shadow(
    offset: Offset(-10.0, 5.0),
    blurRadius: 10.0,
    color: Color(0xff000000)
        .withOpacity(0.5),
    ),
    ],
    );
  var btnStyle= ButtonStyle(
    shape: MaterialStateProperty.all<
    RoundedRectangleBorder>(
    RoundedRectangleBorder(
    //borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(color: Colors.white),
    ),
    ),
    backgroundColor:
    MaterialStateProperty.all<Color>(
    Color(0xff8B669C).withOpacity(1)),
    );

    return

      Scaffold(
        body: SafeArea(
       child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _width,
              height: _height / 19,
              child: Center(
                  child:
              SizedBox()
              ),
              //Like the pourcentage exactly
            ),
            Container(
              //how much banner in bottom
              height: _height * 0.86,
              child: Stack(
                // fit: BoxFit.cover,
                children: [
                  Positioned(
                      height: _height / 1.4,
                      width: _width / 1.1,
                      left: _width / 20,
                      top: _height / 10 + 2,

                      /*  left: -_width / 9,
                          top: -_height / 9,*/

                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration:
                                boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed:

                                      () async {
                                    final user = FirebaseAuth.instance.currentUser;
                                    final userData = await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user.uid)
                                        .get();
                                    String ud = userData['username'];
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          //return AddPost(ud);
                                          return Videos();
                                        }));
                                  },
                                  child: Text(
                                    "VIDEOS",
                                    style:
                                    txtStyle,
                                  ),
                                  style:
                                 btnStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration:
                                boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: ()  {


                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                         // return licences(ud);
                                          return  adsscreen();
                                        }));
                                  },
                                  child: Text(
                                    "REWARDED VIDEOS ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      letterSpacing: 6,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(-10.0, 5.0),
                                          blurRadius: 10.0,
                                          color: Color(0xff000000)
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: btnStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration:
                                boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          //return survey();
                                          return survey2();
                                        }));
                                  },
                                  child: Text(
                                    "SURVEYS",
                                    style:

                                    txtStyle,
                                  ),
                                  style: btnStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration:
                                boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final user = FirebaseAuth.instance.currentUser;
                                    final userData = await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user.uid)
                                        .get();
                                    String ud = userData['username'];

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return PostsScreen(ud);
                                        }));
                                  },
                                  child: Text(
                                    "CATALOGUE",
                                    style:
                                    txtStyle,
                                  ),
                                  style:
                                  btnStyle,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration: boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final user = FirebaseAuth.instance.currentUser;
                                    final userData = await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user.uid)
                                        .get();
                                    String ud = userData['username'];

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                         return Wallet();
                                          // return screen2(ud);
                                          // return Screen(ud);
                                        }));
                                  },


                                  child: Text(
                                    "WALLET",
                                    style: txtStyle,
                                  ),
                                  style: btnStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration: boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final user = FirebaseAuth.instance.currentUser;
                                    final userData = await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user.uid)
                                        .get();
                                    String ud = userData['username'];

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return Profilex(ud);
                                        }));
                                  },
                                  child: Text(
                                    "PROFILE",
                                    style: txtStyle,
                                  ),
                                  style: btnStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration: boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final user = FirebaseAuth.instance.currentUser;
                                    final userData = await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user.uid)
                                        .get();
                                    String ud = userData['username'];

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return licences(ud);
                                        }));
                                  },
                                  child: Text(
                                    " Add licences ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      letterSpacing: 6,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(-10.0, 5.0),
                                          blurRadius: 10.0,
                                          color: Color(0xff000000)
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: btnStyle,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                //Container for box shadow + blur
                                decoration: boxDecoration,

                                //Material fox box shadow 2
                                child: ElevatedButton(
                                  onPressed: ()  {

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return LoginScreen3();
                                        }));
                                  },
                                  child: Text(
                                    " All licences  ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      letterSpacing: 6,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(-10.0, 5.0),
                                          blurRadius: 10.0,
                                          color: Color(0xff000000)
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: btnStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //The box itself
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff3965fa),
                                blurRadius: 16,
                                spreadRadius: 10,
                                //offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                            gradient: LinearGradient(
                               begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xffFD067D).withOpacity(0.9),
                                Color(0xff4200FF).withOpacity(0.65),
                              ],
                            )),
                        //color: Colors.red,
                      )),
                  Positioned(
                    top: 10,
                    //  height: _height,
                    child: Container(
                      width: 400,
                      height: 150,
                      color: Colors.lightBlueAccent[300],
                      child: Image.asset('assets/Group 598 1.png'),
                    ),
                  ),
                ],
              ),
            ),

            //Banner Ads
            Container(
              width: _width,
              height: _height / 13,
              child: Center(
                  child: Text(
                "Banner Ads",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xffA903F8),
                    Color(0xffF805A5).withOpacity(0.29),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
