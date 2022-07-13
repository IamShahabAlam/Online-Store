import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appUp_one/categories/bikes.dart';
import 'package:appUp_one/categories/elec.dart';
import 'package:appUp_one/categories/fash.dart';
import 'package:appUp_one/categories/mob.dart';
import 'package:appUp_one/categories/others.dart';
import 'package:appUp_one/categories/pets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:appUp_one/components/constants.dart';
import 'package:appUp_one/screens/check.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home.dart';
import 'login.dart';

class Cate extends StatefulWidget {
 

  @override
  State<Cate> createState() => _CateState();
}

class _CateState extends State<Cate> {
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
            "Category",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),

          actions: [
            FlatButton(
                padding: EdgeInsets.only(left: 40),
                textColor: Colors.black,
                onPressed: logout,
                child: Icon(Icons.power_settings_new))
          ],
        ),
body: Container(
  child: ListView(
  children: [
    Category(Cname: "Electronics",
    icon: Icons.electrical_services,
    items: "25 items",
    page: Elec(),
    
    ),
    Category(Cname: "Fashion",
    icon: Icons.shopping_bag,
    items: "18 items",
    page: Fash()),

    Category(Cname: "Mobiles",
    icon: Icons.mobile_friendly,
    items: "12 items",
    page: Mob(),
    
    ),
    Category(Cname: "Bikes",
    icon: Icons.electric_bike,
    items: "16 items",
    page: Bikes()),

    Category(
    Cname: "Pets",
    icon: Icons.pets,
    items: "32 items",
    page: Pets(),
    ),

    Category(Cname: "Others",
    icon: Icons.more_rounded,
    items: "44 items",
    page: Others()
    ),
  ],
),)
        // ===================================================================


    );
  }
}

class Category extends StatelessWidget {

  Category({ this.Cname, this.icon, this.items, this.page});

  final String Cname, items ;
  final IconData icon;
  final Widget page;
  
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        // padding: EdgeInsets.only(left: 100, top: 6),
        height: MediaQuery
            .of(context)
            .size
            .height / 11,
        width: MediaQuery
            .of(context)
            .size
            .width / 1,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green[100],
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3), // position of a shadow
              )
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.green,
            ),
            Text(
              Cname,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(items),
          ],
        ),
      ),
    );
  }
}