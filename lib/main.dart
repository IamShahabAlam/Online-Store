
import 'dart:ui' as ui;
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:appUp_one/screens/category.dart';
import 'package:appUp_one/screens/intro.dart';
import 'package:appUp_one/screens/login.dart';
import 'package:appUp_one/screens/profile.dart';
import 'package:appUp_one/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'components/constants.dart';
import 'screens/home.dart';
import 'components/navBar.dart';


// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     'This channel is used for important notifications.', // description
//     importance: Importance.high,
//     playSound: true);
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('A bg message just showed up :  ${message.messageId}');
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   runApp(MyApp());
// }


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

  // int _counter = 0;

  // void initState() {
  //   super.initState();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification notification = message.notification;
  //     AndroidNotification android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               channel.description,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher',
  //             ),
  //           ));
  //     }
  //   });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   RemoteNotification notification = message.notification;
    //   AndroidNotification android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             title: Text(notification.title),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [Text(notification.body)],
    //               ),
    //             ),
    //           );
    //         });
    //   }
    // });
  // }

  // void showNotification() {
  //   setState(() {
  //     _counter++;
  //   });
  //   flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Testing $_counter",
  //       "How you doin ?",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name, channel.description,
  //               importance: Importance.high,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher')));
  // }

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
                "/prof" : (context) => Profile(),


              }

            );
          }
          return Container(child: Text("WAIT! Loading..."),);
        }
        );
  }
}

