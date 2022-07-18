

import 'package:appUp_one/components/buttons.dart';
import 'package:appUp_one/components/conatiners.dart';
import 'package:appUp_one/components/constants.dart';
import 'package:appUp_one/components/navBar.dart';
import 'package:appUp_one/screens/category.dart';
import 'package:appUp_one/screens/intro.dart';
import 'package:appUp_one/screens/post_product.dart';
import 'package:clippy_flutter/buttcheek.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pimp_my_button/pimp_my_button.dart';

import 'login.dart';

class Admin extends StatefulWidget {
 @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  final firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream chatsStream = FirebaseFirestore.instance.collection('chats').snapshots();

  Stream usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override



  Future<String> getUserName() async {					// Function name
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Username']; 					 // Field Name
  }

  Future<String> getEmail() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Email'];
  }

  Future<String> getAge() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Age'];
  }

  Future<String> getPhone() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Phone'];
  }

  Future<String> getAddress() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Address'];
  }




  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;


    void logout() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Intro()));
      } catch (e) {
      }
    }


    return Scaffold( backgroundColor: Colors.grey[300],
      body:
      SingleChildScrollView(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ButtCheek(
                  height: 30,
                  child: Image.asset("assets/cover.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,),
                ),

                Positioned( top: 60, left: _w*0.38 ,
                    child: Container( height: 90.0, width: 90.0,
                        child: Image.asset("assets/logo.png" , fit: BoxFit.contain,))),

                Positioned( top: 30.0 , right: 10.0,
                  child: Container(height: 50, width: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: CircleBorder()
                        ),
                        onPressed: logout,
                        child: Icon(Icons.logout, size: 28.0, color: kBMRactiveCardColor,)),
                  ),
                ),
              ],
            ),

// =============================================================================================

            Container( margin: EdgeInsets.symmetric(vertical: 20.0),
                child:
                Text("ADMIN PANEL", style: TextStyle(fontSize: 25, color: kBMRactiveCardColor, fontWeight: FontWeight.bold),)),

            ListTile(
              visualDensity: VisualDensity(vertical: -3.0),
              leading: Icon( FontAwesomeIcons.solidUser, color: kactiveCardColor,),
              title: FBData(function: getUserName(),),
              onTap: () {

              },
            ),

            ListTile(
              leading: Icon(Icons.mail, color: kactiveCardColor,),
              visualDensity: VisualDensity(vertical: -3.0),
              title: FBData(function: getEmail(),),
              onTap: () {

              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.calendarDays, color: kactiveCardColor,),
              visualDensity: VisualDensity(vertical: -3.0),
              title: FBData(function: getAge(),),
              onTap: () {

              },
            ),

            ListTile(
              leading: Icon(Icons.phone, color: kactiveCardColor,),
              visualDensity: VisualDensity(vertical: -3.0),
              title: FBData(function: getPhone(),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.locationDot, color: kactiveCardColor,),
              visualDensity: VisualDensity(vertical: -3.0),
              title: FBData(function: getAddress(),),
              onTap: () {

              },
            ),

            HomeBtn(
              heightB: 0.055,
              widthB: 0.35,
              name: "Post Ad",
              t_margin: 0.04,
              onpressed:  (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Post_Product(), ));},
              lastClr: kactiveCardColor,
              firstClr: kBMRactiveCardColor,
            ),

          ],
        ),
      ),
    );
  }
}
