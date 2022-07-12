import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/components/constants.dart';
import 'package:firebase_practice/screens/check.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'data.dart';
import 'login.dart';

class Page extends StatefulWidget {


  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {


  List<String> _options = ["/home", "/login", "/home", "/check", "/home"];
  int _currentIndex = 2;

  Stream chatsStream = FirebaseFirestore.instance.collection('chats').snapshots();

  Stream usersStream = FirebaseFirestore.instance.collection('users').snapshots();

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
      // backgroundColor: Colors.grey[600],
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

      drawer: Drawer(

        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://img.freepik.com/premium-vector/dark-green-ray-burst-background_1164-1709.jpg",) , fit: BoxFit.cover, ),
                // color: kactiveCardColor,
              ),
              child: Column(
                children: [
                  SizedBox( height: 100, width: 100,
                      child: Image.asset("assets/logo.png",  )),
                ],
              ),
            ),

            ListTile(
              // leading: Icon(
              //   FontAwesomeIcons.circleDot,
              // ),
              title: Text("Profile Details".toUpperCase(),textAlign: TextAlign.center ,style: TextStyle(fontSize: 22.0, color: kBMRactiveCardColor, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: 20,),


            ListTile(
              leading: Icon( FontAwesomeIcons.user, color: kactiveCardColor,),
              title: Text("Username"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // Divider(height: 0.5 , thickness: 1.0, color: kactiveCardColor,),


            ListTile(
              leading: Icon(FontAwesomeIcons.calendarDays, color: kactiveCardColor,),
              title: Text("22"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Divider(height: 0.5,thickness: 1.0, color: kactiveCardColor,),

            ListTile(
              leading: Icon(Icons.mail, color: kactiveCardColor,),
              title: Text("User@gmail.com"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.phone, color: kactiveCardColor,),
              title: Text("0311000000"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.addressBook, color: kactiveCardColor,),
              title: Text("Address"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: 70,),
            
            Text("Terms of Service | Privacy Policy" , textAlign: TextAlign.center , style: TextStyle(color: Colors.grey, fontSize: 12),)
          ],
        ),
      ),



      body:  Container(
             child: StreamBuilder<QuerySnapshot>(
              stream: usersStream ,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading....", textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0),);
                }

                return SingleChildScrollView(
                  child: Column(
                    // shrinkWrap: true,
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                      Map data = document.data();
                      return Chat(data: data);
                    }).toList(),
                  ),
                );

              },


    ),
           ),



      bottomNavigationBar: CurvedNavigationBar(
        // Dependency
        // animationDuration: Duration(seconds: 1),
        // animationCurve: Curves.easeInBack,
        index: _currentIndex,
        buttonBackgroundColor: Colors.white,
        // height: 60,
        backgroundColor: Colors.green, // dependency
        items: <Widget>[

          GestureDetector(
            child: Icon(
              FontAwesomeIcons.search,
              size: 20,
            ),
          ),
          Icon(
            Icons.favorite,
            size: 20,
          ),
          Icon(
            Icons.home,
            size: 25,
          ),
          GestureDetector(
            onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Check()));},
            child: Icon(
              FontAwesomeIcons.opencart,
              size: 25,
            ),
          ),
          Icon(
            FontAwesomeIcons.userAlt,
            size: 20,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex= index;
          });
        },
      ),
    );




  }
}



