import 'package:flutter/material.dart';

import '../home_screen.dart';
class RewardedVideos extends StatefulWidget {
  const RewardedVideos({key}) : super(key: key);
  @override
  _RewardedVideosState createState() => _RewardedVideosState();
}

class _RewardedVideosState extends State<RewardedVideos> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
    return
 Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

      backgroundColor: Colors.black38,
      body:  Center(
        child: SafeArea(
          child:
          Column(
            children: [

              Expanded(
                child: Container(
                  color: Colors.black38,
                  child: Icon(Icons.live_tv,color: Colors.white,size: 100,),
                ),
              ),

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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
    );

  }
}
