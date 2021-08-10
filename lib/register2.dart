import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';
import 'terms.dart';

class RegisterScreen2 extends StatefulWidget{
  @override
  _RegisterScreen2State createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String valuechoose;
   bool x=false;


  void initState()
  {
    super.initState();
    setState(() {
    });
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _adresscontroller = TextEditingController();

  TextEditingController _jobcontroller = TextEditingController();

  TextEditingController _dateofbirth = TextEditingController();

  TextEditingController _gender = TextEditingController();
  bool checkBoxValue =false;
  File _userImageFile;

  void _pickedImage(File pickedImage){
    _userImageFile=pickedImage;
  }


  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;


    return 
    
    Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      /*  // title: Container(
        //     width:60,
        //     child: Image.asset('assets/s12.png')),*/
        // Text('Registeration'),
        centerTitle: true,

        backgroundColor:     Color(0xffA903F8),
        leading: Icon(Icons.app_registration),
        //elevation:0,
        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.login),
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));


              })],
      ),
backgroundColor: Colors.white,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[


              Container(
                height: _height * 0.8,
                child: Stack(
                  // fit: BoxFit.cover,
                  children: [
                    Positioned(
                        height: _height / 2,
                        width: _width / 1.1,
                        left: _width / 20,
                        top: _height / 10,

                        /*  left: -_width / 9,
                          top: -_height / 9,*/

                        child: Container(
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(height:50 ,),
//User name
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,

                                  ),
                                  child: Container(
                                    //Container for box shadow + blur
                                    decoration: BoxDecoration(
                                      boxShadow:
                                      [
                                        BoxShadow(
                                          color: Color(0xff2f2e2e),
                                          blurRadius: 46,
                                          //spreadRadius: 100,
                                          offset: Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                    ),

                                    //Material fox box shadow 2


                                    child: Material(
                                      elevation: 1.0,
                                      shadowColor: Colors.purpleAccent,
                                      color: Colors.transparent,
                                      child: TextFormField(
                                        //input txt color
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(


                                          border: OutlineInputBorder(
                                              borderSide: new BorderSide(color: Colors.teal)
                                          ),
                                          labelText: 'User name',
                                          labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),

                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2.0,

                                            ),
                                          ),
                                        ),


                                        //validation ..

                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Fill Name';
                                          }
                                          return null;
                                        },
                                        controller: _namecontroller,
                                        autocorrect: true,

                                      ),
                                    ),
                                  ),
                                ),
//Email
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,

                                  ),
                                  child: Container(
                                    //Container for box shadow + blur
                                    decoration: BoxDecoration(
                                      boxShadow:
                                      [
                                        BoxShadow(
                                          color: Color(0xff2f2e2e),
                                          blurRadius: 46,
                                          //spreadRadius: 100,
                                          offset: Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                    ),

                                    //Material fox box shadow 2


                                    child: Material(
                                      elevation: 1.0,
                                      shadowColor: Colors.purpleAccent,
                                      color: Colors.transparent,
                                      child: TextFormField(
                                        //input txt color
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(


                                          border: OutlineInputBorder(
                                              borderSide: new BorderSide(color: Colors.teal)
                                          ),
                                          labelText: 'Email adress',
                                          labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),

                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2.0,

                                            ),
                                          ),
                                        ),


                                        //validation ..

                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Fill Email';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        controller: _emailcontroller,
                                        textCapitalization:TextCapitalization.words,
                                      ),
                                    ),
                                  ),
                                ),
//Password
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Container(
                                    //Container for box shadow + blur
                                    decoration: BoxDecoration(
                                      boxShadow:
                                      [
                                        BoxShadow(
                                          color: Color(0xff2f2e2e),
                                          blurRadius: 46,
                                          //spreadRadius: 100,
                                          offset: Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                    ),

                                    //Material fox box shadow 2
                                    child: Material(
                                      elevation: 1.0,
                                      shadowColor: Colors.purpleAccent,
                                      color: Colors.transparent,
                                      child: TextFormField(
                                        //input txt color
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(


                                          border: OutlineInputBorder(
                                              borderSide: new BorderSide(color: Colors.teal)
                                          ),
                                          labelText: 'Choose a Password',
                                          labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),

                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2.0,

                                            ),
                                          ),
                                        ),


                                        //validation ..

                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Fill Password Input';
                                          }
                                          return null;
                                        },
                                        //hide password
                                        obscureText: true,
                                        controller: _passwordcontroller,

                                      ),
                                    ),
                                  ),
                                ),
//Repeat Password
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Container(
                                    //Container for box shadow + blur
                                    decoration: BoxDecoration(
                                      boxShadow:
                                      [
                                        BoxShadow(
                                          color: Color(0xff2f2e2e),
                                          blurRadius: 46,
                                          //spreadRadius: 100,
                                          offset: Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                    ),

                                    //Material fox box shadow 2
                                    child: Material(
                                      elevation: 1.0,
                                      shadowColor: Colors.purpleAccent,
                                      color: Colors.transparent,
                                      child: TextFormField(
                                        //input txt color
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(


                                          border: OutlineInputBorder(
                                              borderSide: new BorderSide(color: Colors.teal)
                                          ),
                                          labelText: 'Repeat Password',
                                          labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),

                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2.0,

                                            ),
                                          ),
                                        ),


                                        //validation ..

                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Fill Password Input';
                                          }
                                          return null;
                                        },
                                        //hide password
                                        obscureText: true,

                                        //We need to create a controller for its
                                        //controller: _passwordcontroller,

                                      ),
                                    ),
                                  ),
                                ),



                                //Forget Password btn
                                SizedBox(height:40 ,),

                              ],
                            ),
                          ),

                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                              border: Border.all(
                                  width: 5.0,
                                  color: const Color(0xFFFFFFFF)),

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
                        width: _height/2.3,
                        height: _width/3,
                        color: Colors.lightBlueAccent[300],
                        child: Image.asset('assets/Group 598 1.png'),
                      ),
                    ),


                    Positioned(
                      width: _width,
                      top: _height/1.8,
                      child: Container(
                        /*  margin: EdgeInsets.only(

                                      ),*/
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            GestureDetector(
                              onTap:  () async {
                                const url = 'https://facebook.com';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Container(
                                // margin: EdgeInsets.only(
                                //
                                // ),
                                width: 60,
                                height: 60,
                                child: Image.asset("assets/images/facebook.png"),
                                decoration: BoxDecoration(

                                    shape: BoxShape.circle,
                                    color: Color(0xFFe0f2f1),
                                    boxShadow:  <BoxShadow>[
                                      BoxShadow(
                                        color: Color(0xffAD23DD).withOpacity(0.5),
                                        //color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(-10, 10),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await sginInWithGoogle();
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Image.asset("assets/images/gmail-02 (1) 1.png",width: _width/1000,),

                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFe0f2f1),
                                    boxShadow:  <BoxShadow>[
                                      BoxShadow(
                                        color: Color(0xffAD23DD).withOpacity(0.5),
                                        //color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(-10, 10),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: Image.asset("assets/images/25231.png",),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFe0f2f1),
                                  boxShadow:  <BoxShadow>[
                                    BoxShadow(
                                      color: Color(0xffAD23DD).withOpacity(0.5),
                                      //color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: Offset(-10, 10),
                                    ),
                                  ]
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: _height/1.5,
                      left: _width/3.8,
                      //  height: _height,
                      child: Container(
                        margin: EdgeInsets.all(1),
                        height: 40.0,
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffA903F8),
                              Color(0xffF805A5).withOpacity(0.29),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0xffAD23DD).withOpacity(0.5),
                              //color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(-10, 10),
                            ),
                          ],
                        ),
                        child:
                        ElevatedButton(

                          child: Text("Sign up",style: TextStyle(
                            fontSize: 18,
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
                          style:
                          ButtonStyle(

                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white),

                              ),

                            ),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(

                              Color(
                                  0xff9104FF),


                            ),
                          ),

                          onPressed: () async{
                          //Since we don't have this accept terms button
                            if(_formkey.currentState.validate()){
                              var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
                              if(result != null )
                              {
                                Firestore.instance.collection('users').document(result.user.uid).setData({
                                  'username':_namecontroller.text,
                                  'email':_emailcontroller.text,
                                  //we don't get those three fields now
                                  //'social adress':_adresscontroller.text,
                                 // 'job':_jobcontroller.text,
                                 // 'date of birth':_dateofbirth.text,
                                  'coins':"0",

                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }),
                                );

                              }else{
                                print('please try later');
                              }
                            }
                          },

                        ),



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
  Future<void> sginInWithGoogle() async /* Sgin in with google method*/
  {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  }
}