import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/colorr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Helpers/remember_me.dart';
import 'colorr.dart';

class Profile extends StatefulWidget {
  final String ud;

  Profile(this.ud);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<Profile> {
  String allposts;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  String v;
  Future resultsLoaded;
  final _nativeAd = NativeAdmobController();
  AdmobBannerSize bannerSize;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobInterstitial intersitialAd;
  String emailId;

  @override
  initState() {
    setState(() {});
    super.initState();
    handleEmailId();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      callBack();
    });

    bannerSize = AdmobBannerSize.BANNER;

    intersitialAd = AdmobInterstitial(
        adUnitId: AdmobInterstitial.testAdUnitId,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) intersitialAd.load();
          //  handleEvent(event, args, 'Interstitial');
        });
    _nativeAd.reloadAd(forceRefresh: true);
    intersitialAd.load();
  }

  callBack() {
    setState(() {});
  }

  handleEmailId() async {
    emailId = await getEmail();
  }

  @override
  void dispose() {
    intersitialAd.dispose();
    _nativeAd.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var StyleBox= BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0xffffffff).withOpacity(0.3),
          blurRadius: 7,
          spreadRadius: 1,
          offset: Offset(0, 4), // Shadow position
        ),
      ],
      border: Border.all(
        color: Colors.white,
      ),
    );
    // final user = FirebaseAuth.instance.currentUser;
    // final userData =
    //     FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: _width,
                  height: _height / 19,
                  child: Center(child: SizedBox()),

                  //Like the pourcentage exactly
                ),
                Container(
                  //how much banner in bottom
                  height: _height * 0.83,
                  child: Stack(
                    // fit: BoxFit.cover,
                    children: [
                      Positioned(
                        //the box height !!
                          height: _height / 1.45,
                          width: _width / 1.1,
                          left: _width / 20,
                          top: _height / 10,

                          /*  left: -_width / 9,
                          top: -_height / 9,*/

                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
/////////////////////
                                //////////////////////////////////
                                //////////////////////////////////
                                ///////////////////////////////////////////////////////
                                /////////////////////////////////////
                                ////


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Container(
                                        child: Row(
                                          //to position the last elemt
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 18.0),
                                              child: Container(
                                                // margin: EdgeInsets.only(
                                                //
                                                // ),
                                                width: 80,
                                                height: 80,
                                                child: Image.asset(
                                                  "assets/images/Ellipse 4.png",
                                                  scale: 0.5,
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFe0f2f1),
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color: Color(0xffAD23DD)
                                                            .withOpacity(0.5),
                                                        //color: Colors.grey.withOpacity(0.1),
                                                        blurRadius: 10,
                                                        offset: Offset(-10, 10),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 50,
                                                right: 0,
                                              ),
                                              child: Container(
                                                height: _height/14,
                                                width: _width/3,
                                                margin: EdgeInsets.only(
                                                  left: 8,
                                                  right: 0,
                                                ),
                                                //Container for box shadow + blur
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xffffffff)
                                                          .withOpacity(0.3),
                                                      blurRadius: 7,
                                                      spreadRadius: 1,
                                                      offset: Offset(
                                                          0, 4), // Shadow position
                                                    ),
                                                  ],
                                                ),

                                                //Material fox box shadow 2
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Respond to button press
                                                  },
                                                  child: Text(
                                                    "jan mennisy",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      //letterSpacing: 10,
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
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(30),
                                                            bottomLeft: Radius.circular(30)

                                                        ),
                                                        side: BorderSide(
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(
                                                        Color(0xffC80B7C)
                                                            .withOpacity(1)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Container(
                                        height: _height / 4.5,
                                        //Container for box shadow + blur
                                        decoration:
                                        StyleBox,
                                        //Material fox box shadow 2
                                        child: Text(
                                          "Jons Info",
                                          style: TextStyle(
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
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                ///////////////
                                ////////////////
                                /////////////////////
                                //////////////

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Container(
                                    //Container for box shadow + blur
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffffffff).withOpacity(0.3),
                                          blurRadius: 7,
                                          spreadRadius: 1,
                                          offset: Offset(0, 4), // Shadow position
                                        ),
                                      ],
                                    ),

                                    //Material fox box shadow 2
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Respond to button press
                                      },
                                      child: Text(
                                        "HELP",
                                        style: TextStyle(
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
                                        ),
                                      ),
                                      style: ButtonStyle(
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
                                      ),
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
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffffffff).withOpacity(0.3),
                                          blurRadius: 7,
                                          spreadRadius: 1,
                                          offset: Offset(0, 4), // Shadow position
                                        ),
                                      ],
                                    ),

                                    //Material fox box shadow 2
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Respond to button press
                                      },
                                      child: Text(
                                        "CONTACT US",
                                        style: TextStyle(
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
                                        ),
                                      ),
                                      style: ButtonStyle(
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
                                      ),
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
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffffffff).withOpacity(0.3),
                                          blurRadius: 7,
                                          spreadRadius: 1,
                                          offset: Offset(0, 4), // Shadow position
                                        ),
                                      ],
                                    ),

                                    //Material fox box shadow 2
                                    child: ElevatedButton(
                                      onPressed: () async {

                                      },
                                      child: Text(
                                        "REPORT PROBLEM",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
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
                                      style: ButtonStyle(
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
                                      ),
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
                          height: 120,
                          color: Colors.lightBlueAccent[300],
                          child: Image.asset('assets/Group 598 1.png',height: 10,),
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
