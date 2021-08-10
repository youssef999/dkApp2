

  import 'package:flutter/material.dart';
import 'package:flutter_pollfish/flutter_pollfish.dart';

class survey2 extends StatefulWidget {


  @override
  _survey2State createState() => _survey2State();
}

class _survey2State extends State<survey2> {

  @override
  Widget build(BuildContext context) {
  //  FlutterPollfish.instance.init(apiKey: 'YOUR_API_KEY');
    FlutterPollfish.instance.init(
        apiKey: 'b77bb0f8-5962-4882-a23c-2e6c9e99a84a',
  //      indicatorPosition: 5,
        indicatorPadding: 40,
        rewardMode: false,
        releaseMode: true,
        requestUUID: 'USER_INTERNAL_ID',
        offerwallMode: false,
        userProperties: <String, dynamic>{
          'gender': '1',
          'education': '1',

        });

    setState(() {

    });

    return Scaffold(
        backgroundColor:Colors.red,
      body:Container(
        color:Colors.red,
        child:Column(
          children: [
            SizedBox(
              height:190
            ),
         /*   Center(
              child: RaisedButton(
                color:Colors.redAccent,
                onPressed:(){
                  FlutterPollfish.instance.show();
                },
                child:Text('Start Survey')
              ),
            ),*/
          ],
        )
      )
    );
  }
}
