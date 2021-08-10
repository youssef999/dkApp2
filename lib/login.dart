import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/home_screen.dart';
import 'package:fire99/register2.dart';
import 'package:fire99/reset.dart';
import 'package:fire99/screen2.dart';
import 'package:fire99/videoscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'Helpers/remember_me.dart';
import 'colorr.dart';
import 'register2.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = './login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void initState() {
    super.initState();
    const double HH = 1;
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery
        .of(context)
        .size
        .width;
    double _height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        backgroundColor: Colors.white,
        body:

        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
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
                      )),
                  //Like the pourcentage exactly
                ),
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(height: 50,),

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
                                            offset: Offset(
                                                4, 8), // Shadow position
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
                                                borderSide: new BorderSide(
                                                    color: Colors.teal)
                                            ),
                                            labelText: 'User name',
                                            labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),

                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0,

                                              ),
                                            ),
                                          ),


                                          //validation ..

                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill user name Input';
                                            }
                                            return null;
                                          },
                                          controller: _emailcontroller,

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
                                        boxShadow:
                                        [
                                          BoxShadow(
                                            color: Color(0xff2f2e2e),
                                            blurRadius: 46,
                                            //spreadRadius: 100,
                                            offset: Offset(
                                                4, 8), // Shadow position
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
                                                borderSide: new BorderSide(
                                                    color: Colors.teal)
                                            ),
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),

                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(5.0),
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


                                  //Forget Password btn
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 200,
                                      right: 10,
                                    ),
                                    child:
                                    Container(
                                      margin: EdgeInsets.all(1),
                                      height: 30.0,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            100),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Color(0xff383838)
                                                .withOpacity(0.5),
                                            //color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: Offset(-10, 10),
                                          ),
                                        ],
                                      ),
                                      child:
                                      ElevatedButton(
                                        onPressed: () {
                                          // Respond to button press
                                        },
                                        child: Text(
                                          "forgot password", style: TextStyle(
                                          fontSize: 11,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(-10.0, 5.0),
                                              blurRadius: 3.0,
                                              color: Color(0xff89898e),
                                            ),
                                            /*Shadow(
                                              offset: Offset(10.0, 10.0),
                                              blurRadius: 8.0,
                                              color: Color.fromARGB(125, 0, 0, 255),
                                            ),*/
                                          ],

                                        ),),
                                        style:
                                        ButtonStyle(

                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(

                                              borderRadius: BorderRadius
                                                  .circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.grey),

                                            ),

                                          ),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(
                                                  0xff8B669C)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen2()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10),
                                      //padding: EdgeInsets.only(left:15,bottom:15,right:15),
                                      //alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          Text(
                                            "I don't have an account ?",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Sign up",
                                            style: TextStyle(
                                                color: Colors.white30,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                fontStyle: FontStyle.italic),
                                          ),


                                        ],
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),

                            ),

                            decoration:
                            BoxDecoration(
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

//Auth2 three elements
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
                                onTap: () async {
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
                                  child: Image.asset(
                                      "assets/images/facebook.png"),
                                  decoration: BoxDecoration(

                                      shape: BoxShape.circle,
                                      color: Color(0xFFe0f2f1),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Color(0xffAD23DD).withOpacity(
                                              0.5),
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
                                  child: Image.asset(
                                    "assets/images/gmail-02 (1) 1.png",
                                    width: _width / 1000,),

                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFe0f2f1),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Color(0xffAD23DD).withOpacity(
                                              0.5),
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
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Color(0xffAD23DD).withOpacity(
                                            0.5),
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
                        top: _height / 1.5,
                        left: _width / 3.8,
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

                            child: Text("Log in", style: TextStyle(
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

                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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

                            onPressed: () async {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                  email: _emailcontroller.text,
                                  password: _passwordcontroller.text);

                          /*    if (userCredential.user.emailVerified == false) {
                                User user = FirebaseAuth.instance.currentUser;
                                await user.sendEmailVerification();

                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                    new AlertDialog(
                                      title: new Text(" OPEN YOUR EMAIL "),
                                      content: new Text(
                                          "We sent a message to your check it to verify your account"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(' OK '),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                    return LoginScreen();
                                                  }),
                                            );
                                          },
                                        )
                                      ],
                                    ));
                              }*/
                              //else {
                                if (isRememberMe) {
                                  await setRememberMe(isRememberMe);
                                  await setEmail(_emailcontroller.text.trim());
                                  await setPassword(
                                      _passwordcontroller.text.trim());
                                } else {
                                  await setRememberMe(isRememberMe);
                                  await setEmail('');
                                  await setPassword('');
                                }
                            //  }
                              if (_formkey.currentState.validate()
                                //  userCredential.user.emailVerified == true
                              ) {
                                WidgetsFlutterBinding.ensureInitialized();
                                await Firebase.initializeApp();

                                var result = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: _emailcontroller.text,
                                    password: _passwordcontroller.text);

                                final user = FirebaseAuth.instance.currentUser;
                                final userData = await FirebaseFirestore
                                    .instance
                                    .collection('users')
                                    .doc(user.uid)
                                    .get();
                                String ud = userData['username'];
                                await setUd(ud);

                                if (result != null) {
                                  // pushReplacement
                                  print('welcomee');
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                } else {
                                  print('user not found');
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




/*
*
* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/home_screen.dart';
import 'package:fire99/register2.dart';
import 'package:fire99/reset.dart';
import 'package:fire99/screen2.dart';
import 'package:fire99/videoscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'Helpers/remember_me.dart';
import 'colorr.dart';
import 'register2.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = './login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        /* appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          iconTheme: IconThemeData(color: Colors.red),
          title:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                     Colors.white,

                    Colors.lightBlueAccent,

                    // Colors.lightBlueAccent,
                    //Colors.white,
                  ])),
              height:30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width:40,
                      ),
                      / / Container(
                 width:80,
                 child:Image.asset('assets/l1.jfif')
               ),/ /
                      Text( " Coin",style:TextStyle(color:Colors.red,fontWeight:FontWeight.bold,fontSize:23)),
                      Text( "s",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:23)),
                      //  Text("  Broker",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),
                    ],
                  ))
          ),
          //backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            SizedBox(
              height:10,
            ),




          ]
      ),*/
        body: Container(
      color: btnforGroundColr,
      //Color.fromRGBO(41, 30, 83, 1),
      padding: EdgeInsets.all(16),

      child: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Row(children: <Widget>[

                     Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily:'',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    )),

                ]),
                Container(
                  width: 400,
                  height: 150,
                  color: Colors.lightBlueAccent[300],
                  child: Image.asset('assets/signup.png'),
                ),
                SizedBox(height: 15),
                TextFormField(
                  //Email/
                  controller: _emailcontroller,
                  cursorColor: Colors.purple,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    hoverColor: Colors.deepPurple,
                    labelText: ' Email',
                    hintText: 'Enter your email ',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.deepPurple, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),

                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide()
                    ),
                    // fillColor: Colors.white,
                    filled: true,
                    fillColor: Colors.white,


                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    labelStyle:TextStyle(                      fontSize: 18,

                      color: Colors.deepPurple,
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Password Input';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //Password/
                  cursorColor: Colors.deepPurple,
                  obscureText: true,
                  controller: _passwordcontroller,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: ' Password',
                    hintText: 'Enter your password ',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(

                        color: Colors.deepPurple, width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),

                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide()
                    ),
                    // fillColor: Colors.white,
                    filled: true,
                    fillColor: Colors.white,


                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,

                    ),
                    labelStyle:TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,

                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Password Input';
                    }
                    return null;
                  },
                ),
                CheckboxListTile(
                    activeColor: Colors.deepPurple,
                    title: Text('Remember me',
                        style: TextStyle(color: Colors.deepPurple)),
                    value: isRememberMe,
                    onChanged: (value) async {
                      isRememberMe = value;

                      setState(() {});
                    }),
                SizedBox(
                  height: 3,
                ),
                Container(
                  width: 320,
                  child: Container(
                    // color:  Colors.purple,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                          borderRadius:
                          BorderRadius.all(Radius.circular(30)),),
                      child: FlatButton(
                 color: Colors.transparent,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                                  email: _emailcontroller.text,
                                  password: _passwordcontroller.text);

                          if (userCredential.user.emailVerified == false) {
                            User user = FirebaseAuth.instance.currentUser;
                            await user.sendEmailVerification();

                            showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                      title: new Text(" OPEN YOUR EMAIL "),
                                      content: new Text(
                                          "We sent a message to your check it to verify your account"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(' OK '),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return LoginScreen();
                                              }),
                                            );
                                          },
                                        )
                                      ],
                                    ));
                          } else {
                            if (isRememberMe) {
                              await setRememberMe(isRememberMe);
                              await setEmail(_emailcontroller.text.trim());
                              await setPassword(_passwordcontroller.text.trim());
                            } else {
                              await setRememberMe(isRememberMe);
                              await setEmail('');
                              await setPassword('');
                            }
                          }
                          if (_formkey.currentState.validate() &&
                              userCredential.user.emailVerified == true) {
                            WidgetsFlutterBinding.ensureInitialized();
                            await Firebase.initializeApp();

                            var result = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailcontroller.text,
                                    password: _passwordcontroller.text);

                            final user = FirebaseAuth.instance.currentUser;
                            final userData = await FirebaseFirestore.instance
                                .collection('users')
                                .doc(user.uid)
                                .get();
                            String ud = userData['username'];
                            await setUd(ud);

                            if (result != null) {
                              // pushReplacement
                              print('welcomee');
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            } else {
                              print('user not found');
                            }
                          }
                        },
                      ),
                    ),

                  ),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                      MaterialPageRoute(
                          builder: (context) => ResetScreen()),);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    //padding: EdgeInsets.only(left:15,bottom:15,right:15),
                    //alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400,
                            color: kPrimaryColor)),


                      ],
                    ),
                  ),
                ),

                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                        Text(
                          "O R",
                          style: TextStyle(
                              color:kPrimaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    )),

                TextButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen2()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    //padding: EdgeInsets.only(left:15,bottom:15,right:15),
                    //alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "I don't have an account ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic),
                        ),


                      ],
                    ),

                  ),
                ),


                Container(
                  decoration: BoxDecoration(


                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: SignInButton(

                    Buttons.Google,
                    text: "Sign up with Google",

                    onPressed: () async {
                      await sginInWithGoogle();


                    },


                  ),
                ),
                Row(
                  children: [
                    Text('Like us on: ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.facebook),
                        color: Colors.blue[900],
                        onPressed: () async {
                          const url = 'https://facebook.com';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.instagram),
                        color: Color.fromRGBO(220, 48, 151, 1),
                        onPressed: () async {
                          const url = 'https://instagram.com';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }
                    ),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('share app',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
        ),

                  IconButton(
                        icon: Icon(FontAwesomeIcons.share),
                        color: Colors.deepPurple,
                        onPressed: () {
                          Share.share("Hello! Join us  now , Check the app on the store  https://play.google.com/store/apps/details?id=com.jo777.bankster");
                        }
                    )
                  ],
                )



              ],
            )),
      ),
    ));
  }

  Future<void> sginInWithGoogle() async /* Sgin in with google method*/
  {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  }
}
*/