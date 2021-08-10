import 'package:fire99/UIFiles/BannerAdds.dart';
import 'package:fire99/UIFiles/ShapeCustom.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../home_screen.dart';

class Wallet extends StatefulWidget {
  const Wallet({key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var RandomColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      border: Border.all(
                          width: 2.0, color: const Color(0xFFFFFFFF)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff4d4d4e),
                          blurRadius: 16,
                          spreadRadius: 10,
                          offset: Offset(0, 4), // Shadow position
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFD067D).withOpacity(0.9),
                          Color(0xff5f29fd).withOpacity(0.65),
                        ],
                      )),
                  //color: Colors.deepOrange,
                  height: _height / 7,
                  /*Text("336 Kt = \$1,200,000.00"),
                      Text("Balance"),*/
                  child:Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("336 Kt = \$1,200,000.00",style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Color(0xffcd99e8),
                        //fontFamily: pacifi,

                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(-10.0, 5.0),
                            blurRadius: 33.0,
                            color: Color(0xffffffff),
                          ),

                        ],
                      ),),
                      Text("Balance" , style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Color(0xffdddade),
                        //fontFamily: pacifi,

                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(-10.0, 5.0),
                            blurRadius: 33.0,
                            color: Color(0xffffffff),
                          ),

                        ],
                      ),),
                    ],
                  )),
                ),
              ),
              BannerAdds(
                fts: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        //color: Colors.purpleAccent,
                        height: 100,
                        width: 100,
                        child: CustomPaint(
                          child:  Container(
                        margin: EdgeInsets.only(
                        top: _height/26,
                        ),
                          child: Column(
                            children: [
                              Row(
                             //   crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.asset("assets/images/-.png",width: _width/10,),
                                  Image.asset("assets/images/dollar-sign.png",width: _width/10,),
                                ],
                              ),
                              Image.asset("assets/images/Cash In.png"),
                            ],
                          )),
                          painter: ShapeCustom(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        //color: Colors.green,
                        height: 100,
                        width: 100,
                        child: CustomPaint(
                          child: Container(
                              margin: EdgeInsets.only(
                                top: _height/26,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/images/+.png",width: _width/10,),
                                      Image.asset("assets/images/dollar-sign.png",width: _width/10,),
                                    ],
                                  ),
                                  Image.asset("assets/images/Add cas ---h.png",),
                                ],
                              )),
                          painter: ShapeCustom(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        //color: Colors.blue,
                        height: 100,
                        width: 100,
                        child: CustomPaint(
                          child: Container(
                              margin: EdgeInsets.only(
                                top: _height/26,
                              ),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/Card_Icon.png",width: _width/7,),
                                  Image.asset("assets/images/cards.png",width: _width/5,),
                                ],
                              )),
                          painter: ShapeCustom(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //color: Colors.grey,
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/Green_Graph.png"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Image.asset("assets/images/Group 623.png"),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              Container(
                // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                //     .withOpacity(1.0),
                child: Image.asset("assets/images/Group 624.png"),
                height: _height / 4,
              ),
              BannerAdds(
                fts: 20,
              ),
              Container(
                /*color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),*/

                child: Image.asset("assets/images/Group 626.png",
               // height: _height/11,
                  width: _width,
                ),
              ),
              Container(
           /*     color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),*/
                child: Image.asset("assets/images/Group 625.png",
                  width: _width,
                ),
              ),
              BannerAdds(
                fts: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
