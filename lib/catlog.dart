
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fire99/adsManger.dart';
import 'package:fire99/login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import 'home_screen.dart';



class PostsScreen extends StatefulWidget {

  final ud;
  PostsScreen(this.ud);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  String allposts;

 

  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;



   final _nativeAdController = NativeAdmobController();
   AdmobBannerSize bannerSize;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
   AdmobInterstitial intersitialAd;

  @override
  void initState() {
  
    super.initState();
    bannerSize = AdmobBannerSize.BANNER;

    intersitialAd = AdmobInterstitial(
        adUnitId:   AdsManger.interstitialAd,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) intersitialAd.load();
        //  handleEvent(event, args, 'Interstitial');
        });
        intersitialAd.load();
       
  _nativeAdController.reloadAd(forceRefresh:true);
    



    void showSnackBar(String content) {

      scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(content),
          duration: Duration(milliseconds: 1500),
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

  @override
  void dispose() {
    intersitialAd.dispose();
    _nativeAdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   // final user = FirebaseAuth.instance.currentUser;
   // final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
      backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           // print(posts.data().length);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
            // Add your onPressed code here!
          },
          child: const Icon(Icons.home),
          backgroundColor: Colors.greenAccent,
          splashColor: Colors.white,
          focusColor: Colors.white,
          foregroundColor: Colors.white,
          hoverColor: Colors.white,
          shape:  RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(50)),
        ),
      body:
          Container(
            color: Colors.white,
            child: Row(
              children: [
                /*Expanded(child: Text("hello")),*/
                Expanded(
                  child: Column(
                      children: [
                        Container(
                            width:200,
                           // height:60,
                            child:NativeAdmob(
                              adUnitID:AdsManger.nativeAdunit,
                              numberAds:3,
                              controller: _nativeAdController,
                              type:NativeAdmobType.banner,
                            )
                        ),

                        /*SizedBox(
                          height:7,
                        ),*/
                        Flexible(
                          //child: Expanded(
                          child: StreamBuilder(

                              stream:
                              FirebaseFirestore.instance.collection('posts5')
                              //     .where("name",isNotEqualTo:null)
                                  .snapshots(),
                              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                final docs =snapshot.data.docs;
                                // int len=docs.length;

                                if (!snapshot.hasData) return Center(child: Text('Loading'));

                                if(snapshot.hasData==null) return Center(child: Text('Loading'));

                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                                  default:

                                    return ListView.builder(
                                        itemCount: snapshot.data.documents.length ~/ 2,

                                        itemBuilder: (context, index) {
                                          DocumentSnapshot posts = snapshot.data.documents[index ];
                                          // int len=snapshot.data.documents.length;
                                          if(snapshot.data == null) return CircularProgressIndicator();
                                          // (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                          return
                                            Container(
                                              color: Colors.white,
                                              child: Column(
                                                children: <Widget>[
                                                  /*So we get Image first and after the txt*/

                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    height: 320,
                                                    //  color: Color.fromRGBO(41, 30, 83, 1),
                                                    width: MediaQuery.of(context).size.width / 1.1,
                                                    child: InkWell(
                                                      child: Card(
                                                        child:
                                                        Container(
                                                          //backgroundImage: (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                                          child:
                                                          Image.network(


                                                              posts.data()['img']??" ",


                                                              fit: BoxFit.fill),
                                                        ),
                                                      ),
                                                      onTap: ()  {



                                                        intersitialAd.show();
                                                        print(posts.data().length);

                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: ListTile(
                                                      // leading: Image.network(posts.data()['img']),
                                                      title:
                                                      Text(posts.data()['name']??"x",
                                                          style:TextStyle(color:Colors.black,fontSize:24,fontWeight:FontWeight.w300)),
                                                      subtitle: Container(
                                                        height:30,
                                                        child: Text(
                                                          // _language.towner() ?? "Owner : "+
                                                          posts.data()['user']['name']??"x",style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.w300),),),
                                                      trailing: Text(posts.data()['price'] ??" ",style:TextStyle(color:Colors.green,fontSize:20,fontWeight:FontWeight.w300)),
                                                    ),
                                                  ),

                                                ],
                                              ),

                                            );
                                        });
                                }
                              }
                          ),
                        ),

                      ]),
                ),
                Expanded(
                  child: Column(
                      children: [
                       Container(
                            width:200,
                           // height:60,
                            child:NativeAdmob(
                              adUnitID:AdsManger.nativeAdunit,
                              numberAds:3,
                              controller: _nativeAdController,
                              type:NativeAdmobType.banner,
                            )
                        ),

                        // SizedBox(
                        //   height:7,
                        // ),
                        Flexible(
                                  //child: Expanded(
                                    child: StreamBuilder(

                                        stream:
                                        FirebaseFirestore.instance.collection('posts5')
                                       //     .where("name",isNotEqualTo:null)
                                            .snapshots(),
                                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                          final docs =snapshot.data.docs;
                                         // int len=docs.length;

                                          if (!snapshot.hasData) return Center(child: Text('Loading'));

                                          if(snapshot.hasData==null) return Center(child: Text('Loading'));

                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return new Text('Loading...');
                                 //.where("category", isEqualTo:"tec")
                                            default:

                                              return ListView.builder(
                                                  itemCount: snapshot.data.documents.length ~/ 2 +1,

                                                  itemBuilder: (context, index) {
                                                    DocumentSnapshot posts = snapshot.data.documents[index + snapshot.data.documents.length ~/ 2];
                                                    //DocumentSnapshot posts1 = snapshot.data.documents[5];
                                                  // int len=snapshot.data.documents.length;
                                                    if(snapshot.data == null) return CircularProgressIndicator();
                                                   // (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                                    return
                                                       Container(
                                                        color: Colors.white,
                                                        child: Column(
                                                          children: <Widget>[
                                                            /*So we get Image first and after the txt*/

                                                            Container(
                                                              padding: EdgeInsets.all(10),
                                                              height: 320,
                                                            //  color: Color.fromRGBO(41, 30, 83, 1),
                                                              width: MediaQuery.of(context).size.width / 1.1,
                                                              child: InkWell(
                                                                child: Card(
                                                                  child:
                                                                  Container(
                                                        //backgroundImage: (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                                                    child:
                                                                    Image.network(


                                                                        posts.data()['img']??" ",


                                                                        fit: BoxFit.fill),
                                                                  ),
                                                                ),
                                                                onTap: ()  {



                                                               intersitialAd.show();
                                                               print(
                                                                 //the lenght
                                                                  snapshot.data.documents.length
                                                               );

                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets.all(10),
                                                              child: ListTile(
                                                               // leading: Image.network(posts.data()['img']),
                                                                title:
                                                                Text(posts.data()['name']??"x",
                                                        style:TextStyle(color:Colors.black,fontSize:24,fontWeight:FontWeight.w300)),
                                                                subtitle: Container(
                                                                    height:30,
                                                                    child: Text(
                                                                     // _language.towner() ?? "Owner : "+
                                                                        posts.data()['user']['name']??"x",style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.w300),),),
                                                               trailing: Text(posts.data()['price'] ??" ",style:TextStyle(color:Colors.green,fontSize:20,fontWeight:FontWeight.w300)),
                                                              ),
                                                            ),

                                                          ],
                                                        ),

                                                    );
                                                  });
                                          }
                                        }
                                    ),
                                  ),

                        ]),
                ),
              ],
            )) );
  }
}
