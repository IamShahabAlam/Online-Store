import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/components/constants.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Last extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void logout() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
      } catch (e) {
      }
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        brightness: Brightness.dark,
        elevation: 10,

        title: Center(
            child: Text(
              "Online Store",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        actions: [
          FlatButton(
              padding: EdgeInsets.only(left: 50),
              textColor: Colors.black,
              onPressed: logout,
              child: Icon(Icons.power_settings_new))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.star, color: kactiveCardColor, size: 200.0,),

            Container( alignment: Alignment.center,
              child:  Text("THANK YOU!" , style: TextStyle(fontSize: 40.0 , fontWeight: FontWeight.bold ),),
            ),

            SizedBox(height: 40.0,),

            Container( height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                 style: ElevatedButton.styleFrom(primary: kactiveCardColor),
                  onPressed: (){Navigator.pushNamed(context, "/intro");},
                  child: Icon(Icons.home_outlined, color: Colors.white, size: 30.0,)),
            )
          ],
        ),
      ),
    );
  }
}
