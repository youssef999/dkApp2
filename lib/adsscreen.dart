
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startapp/startapp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'adsManger.dart';
import 'colorr.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';




class adsscreen extends StatefulWidget {

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<adsscreen> {
  String allposts;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  final _nativeAd=NativeAdmobController();
  AdmobBannerSize bannerSize;
  int money=0;
  int coins=0;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobInterstitial intersitialAd;
  SharedPreferences prefs ;



  saveData(int coin) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('coin2',coin);
    // prefs.setInt('money',m);
  }
  saveData2(int m) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('money',m);
    // prefs.setInt('money',m);
  }

  getData()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      // money =prefs.getInt('money')??money;
      coins =prefs.getInt('coin2')??coins;
    });
  }
  getData2()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      money =prefs.getInt('money')??money;
      // coins =prefs.getInt('coins')??coins;
    });
  }
  RewardedVideoAd videoAd=RewardedVideoAd.instance;
  @override
  void initState() {

    FirebaseAdMob.instance.initialize(appId:'ca-app-pub-8832245228844811~9613708860');
    setState(() {
      getData();
      getData2();
    });


    /*RewardedVideoAd.instance.load(
        adUnitId:'ca-app-pub-8832245228844811/4525033713',
        //AdmobReward.testAdUnitId,
        // "ca-app-pub-9553580055895935/1690226045",
        targetingInfo: MobileAdTargetingInfo());

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        coins=coins+rewardAmount;
      }
    };

*/
    super.initState();
    bannerSize = AdmobBannerSize.BANNER;

    intersitialAd = AdmobInterstitial(
        adUnitId:  'ca-app-pub-8832245228844811/4121709038',
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) intersitialAd.load();
          //  handleEvent(event, args, 'Interstitial');
        });
    _nativeAd.reloadAd(forceRefresh:true);
    intersitialAd.load();


    void showSnackBar(String content) {

      scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(content),
          duration: Duration(milliseconds: 2500),
        ),
      );
    }


    void handleEvent(
        AdmobAdEvent event, Map<String, dynamic> args, String adType) {
      switch (event) {
        case AdmobAdEvent.loaded:
          showSnackBar('New Admob $adType Ad loaded!');
          break;
        case AdmobAdEvent.opened:
          showSnackBar('Admob $adType Ad opened!');
          break;
        case AdmobAdEvent.closed:
          showSnackBar('Admob $adType Ad closed!');
          break;
        case AdmobAdEvent.failedToLoad:
          showSnackBar('Admob $adType failed to load. :(');
          break;
        case AdmobAdEvent.rewarded:
          showDialog(
            context: scaffoldState.currentContext,
            builder: (BuildContext context) {
              return WillPopScope(
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Reward callback fired. Thanks Andrew!'),
                      Text('Type: ${args['type']}'),
                      Text('Amount: ${args['amount']}'),
                    ],
                  ),
                ),
                onWillPop: () async {
                  scaffoldState.currentState.hideCurrentSnackBar();
                  return true;
                },
              );
            },
          );
          break;
        default:
      }
    }




  }



  /*Future update(String newEmail) async {

    var message;
    FirebaseUser firebaseUser =await FirebaseAuth.instance.currentUser;
    firebaseUser
        .updateEmail(newEmail)
        .then(
          (value) => message = 'Success',
    )
        .catchError((onError) => message = 'error');
    return message;
  }
  Future update2(String newPass) async {
    var message;
    FirebaseUser firebaseUser =await FirebaseAuth.instance.currentUser;
    firebaseUser
        .updatePassword(newPass)
        .then(
          (value) => message = 'Success',
    )
        .catchError((onError) => message = 'error');
    return message;
  }*/
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
    /*final user = FirebaseAuth.instance.currentUser;
    final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();*/

    return Scaffold(
        backgroundColor: Color.fromRGBO(41, 30, 83, 1),
        appBar: AppBar(
          title:

          Center(child: Row(
            children: [
              SizedBox(
                  width:40
              ),
              Text(' D', style: TextStyle(
                  color: Colors.white,fontWeight:FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 20)),
              Text('k', style: TextStyle(
                  color: Colors.white,fontWeight:FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 20)),
            ],
          )),
          backgroundColor:Colors.blue[900],
          elevation: 6,
        ),
        //drawer: SidebarPage(),
        body:
        Container(
          child: Container(
              child:ListView(
                  children: <Widget>[

                    Column(
                      children: [
                        SizedBox(
                          height:10,
                        ),
                        Container(
                            child:Text(coins.toString(),style:TextStyle(color:Colors.cyanAccent,fontSize:22,fontWeight:FontWeight.w900),)
                        ),
                        SizedBox(
                          height:5,
                        ),
                        Container(
                            child:Text("Coins",style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)
                        ),
                      ],
                    ),
                    SizedBox(
                        height:30
                    ),
                        Container(
                          child: InkWell(
                              child: Container(
                                child: Image.asset('assets/v1z.png')
                              )
                              , onTap: () async {
                           await StartApp.showRewardedAd
                              (onVideoCompleted: () {
                              setState(() {
                                coins = coins +10;
                                saveData(coins);
                                saveData2(money);
                              });
                              saveData(coins);
                            }, onFailedToReceiveAd: (String error) {
                             // this.error = error;
                            });
                            saveData(coins);
                          }
                          ),
                        ),
                        SizedBox(
                          height:24,
                        ),
                    Container(
                      width:400,
                      color:Colors.redAccent,
                        child: AdBanner()),
                    SizedBox(
                      height:24,
                    ),
                    Container(
                      child: InkWell(
                          child: Container(
                              child: Image.asset('assets/v1z.png')
                          )
                          , onTap: () async {
                        await StartApp.showRewardedAd
                          (onVideoCompleted: () {
                          setState(() {
                            coins = coins +10;
                            saveData(coins);
                            saveData2(money);
                            //videoCompleted = true;
                          });
                          saveData(coins);
                        }, onFailedToReceiveAd: (String error) {
                          // this.error = error;
                        });
                        saveData(coins);
                      }
                      ),
                    ),
                    SizedBox(
                      height:24,
                    ),
                    Container(
                        width:400,
                        color:Colors.redAccent,
                        child: AdBanner()),

                    SizedBox(
                      height:24,
                    ),
                    Container(
                      child: InkWell(
                          child: Container(
                              child: Image.asset('assets/v1z.png')
                          )

                          , onTap: () async {
                        await StartApp.showRewardedAd
                          (onVideoCompleted: () {
                          setState(() {
                            coins = coins +10;
                            saveData(coins);
                            saveData2(money);
                            //videoCompleted = true;
                          });
                          saveData(coins);

                        }, onFailedToReceiveAd: (String error) {
                          // this.error = error;
                        });
                        saveData(coins);

                      }

                      ),
                    ),
                    SizedBox(
                      height:24,
                    ),



                    Container(
                        width:400,
                        color:Colors.redAccent,
                        child: AdBanner()),


                    SizedBox(
                      height:24,
                    ),

                    Container(
                      child: InkWell(
                          child: Container(
                              child: Image.asset('assets/v1z.png')

                          )

                          , onTap: () async {
                        await StartApp.showRewardedAd
                          (onVideoCompleted: () {
                          setState(() {
                            coins = coins +10;
                            saveData(coins);
                            saveData2(money);
                            //videoCompleted = true;
                          });
                          saveData(coins);

                        }, onFailedToReceiveAd: (String error) {
                          // this.error = error;
                        });
                        saveData(coins);

                      }

                      ),
                    ),
                    SizedBox(
                      height:24,
                    ),



                    Container(
                        width:400,
                        color:Colors.redAccent,
                        child: AdBanner()),


                    SizedBox(
                      height:24,
                    ),

                    Container(
                      child: InkWell(
                          child: Container(
                              child: Image.asset('assets/v1z.png')

                          )

                          , onTap: () async {
                        await StartApp.showRewardedAd
                          (onVideoCompleted: () {
                          setState(() {
                            coins = coins +10;
                            saveData(coins);
                            saveData2(money);
                            //videoCompleted = true;
                          });
                          saveData(coins);

                        }, onFailedToReceiveAd: (String error) {
                          // this.error = error;
                        });
                        saveData(coins);

                      }

                      ),
                    ),
                    SizedBox(
                      height:24,
                    ),



                    Container(
                        width:400,
                        color:Colors.redAccent,
                        child: AdBanner()),


                    SizedBox(
                      height:24,
                    ),


                    Container(
                      child: InkWell(
                          child: Container(
                              child: Image.asset('assets/v1z.png')

                          )

                          , onTap: () async {
                        await StartApp.showRewardedAd
                          (onVideoCompleted: () {
                          setState(() {
                            coins = coins +10;
                            saveData(coins);
                            saveData2(money);
                            //videoCompleted = true;
                          });
                          saveData(coins);

                        }, onFailedToReceiveAd: (String error) {
                          // this.error = error;
                        });
                        saveData(coins);

                      }

                      ),
                    ),
                    SizedBox(
                      height:24,
                    ),



                    Container(
                        width:400,
                        color:Colors.redAccent,
                        child: AdBanner()),


                    SizedBox(
                      height:24,
                    ),

                    Container(
                      child: InkWell(
                          child: Container(
                              child: Image.asset('assets/v1z.png')

                          )

                          , onTap: () async {
                        await StartApp.showRewardedAd
                          (onVideoCompleted: () {
                          setState(() {
                            coins = coins +10;
                            saveData(coins);
                            saveData2(money);
                            //videoCompleted = true;
                          });
                          saveData(coins);

                        }, onFailedToReceiveAd: (String error) {
                          // this.error = error;
                        });
                        saveData(coins);

                      }

                      ),
                    ),
                    SizedBox(
                      height:24,
                    ),



                    Container(
                        width:400,
                        color:Colors.redAccent,
                        child: AdBanner()),



                    SizedBox(
                      height:24,
                    ),


                    Container(
                      child: InkWell(
                          child: Container(
                              child: Image.asset('assets/v1z.png')

                          )

                          , onTap: () async {
                        await StartApp.showRewardedAd
                          (onVideoCompleted: () {
                          setState(() {
                            coins = coins +10;
                            saveData(coins);
                            saveData2(money);
                            //videoCompleted = true;
                          });
                          saveData(coins);

                        }, onFailedToReceiveAd: (String error) {
                          // this.error = error;
                        });
                        saveData(coins);

                      }

                      ),
                    ),
                    SizedBox(
                      height:24,
                    ),



                    Container(
                        width:400,
                        color:Colors.redAccent,
                        child: AdBanner()),

                  ],
                ),


    )));
  }}



//),

// Container(
//   color: Color.fromRGBO(41, 30, 83, 1),
//   padding: const EdgeInsets.only(top:40),
//   child: CurvedNavigationBar(
//       color:Colors.indigo[900],
//       backgroundColor: Color.fromRGBO(41, 30, 83, 1),
//       //buttonBackgroundColor:Colors.blue,
//       items:<Widget>[
//         Icon(Icons.home,size:24,color:Colors.red),
//         //  Icon(Icons.add_box,size:24,color:Colors.blue),
//         Icon(Icons.messenger_rounded,size:24,color:Colors.red),
//         // Icon(Icons.account_circle,size:24,color:Colors.white),
//       ],
//
//       animationCurve:Curves.bounceOut,
//       onTap:(index) async {
//         final user = FirebaseAuth.instance.currentUser;
//         final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//         String ud=userData['username'];
//
//
//         /* if(index==1)
//            {
//              intersitialAd.show();
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) {
//                return AddPost();
//              }));
//         }*/
//         if(index==1){
//           intersitialAd.show();
//           Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatScreen2(ud)));
//         }
//
//       }
//
//   ),
// )


