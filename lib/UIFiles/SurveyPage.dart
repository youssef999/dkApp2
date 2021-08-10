import 'package:flutter/material.dart';
class SurveyPage extends StatefulWidget {
  const SurveyPage({ key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      SafeArea(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          Expanded(child: Image.asset("assets/images/SURVEYS.png")),
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
    );
  }
}
