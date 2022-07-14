
import 'dart:ui' as ui;
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:appUp_one/screens/category.dart';
import 'package:appUp_one/screens/intro.dart';
import 'package:appUp_one/screens/login.dart';
import 'package:appUp_one/screens/admin.dart';
import 'package:appUp_one/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/constants.dart';
import 'screens/home.dart';
import 'components/navBar.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error Found !"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: AnimatedSplashScreen(
                // backgroundColor: kBG,
                splashIconSize: 800,

                splash: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        "assets/logo.png",
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      alignment: Alignment.center,
                      child: Text("ONLINE STORE" , style: TextStyle(fontSize: 30.0, color: kactiveCardColor , fontWeight: FontWeight.bold),),
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "App Up Competition 2022",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    SizedBox(
                        width: 80,
                        child: Divider(
                          color: Colors.grey[700],
                          // color: Colors.green,
                        ))
                  ],
                ),
                splashTransition: SplashTransition.fadeTransition,
                nextScreen: Intro(),
                //  backgroundColor: Colors.grey,
              ),
              routes: {
                "/login" : (context) => Login(),
                "/reg" : (context) => Register(),
                "/home" : (context) => Home(),
                "/intro" : (context) => Intro(),
                "/nav" : (context) => BNB(),
                "/cate" : (context) => Cate(),
                "/admin" : (context) => Admin(),


              }

            );
          }
          return Container(child: Text("WAIT! Loading..."),);
        }
        );
  }
}

