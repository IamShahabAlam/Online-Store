import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appUp_one/screens/last.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Check extends StatefulWidget {
  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;


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
        leading: Text(""),
        title: Center(
            child: Text(
          "Checkout",
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
          ),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.07,
              left: _h * 0.05,
              child: Container(
                  child: Icon(Icons.shopping_cart_outlined, size: _h * 0.12))),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.07,
              left: _h * 0.20,
              child: Text(
                "Main Product",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.12,
              left: _h * 0.20,
              child: Text(
                "Items",
                style: TextStyle(fontSize: 15),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.12,
              left: _h * 0.20,
              child: Text(
                "Items",
                style: TextStyle(fontSize: 15),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.16,
              left: _h * 0.20,
              child: Text(
                "2,400",
                style: TextStyle(fontSize: 12, color: Colors.green),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.20,
              left: _h * 0.19,
              child: Container(
                  child: Icon(
                Icons.add,
                size: _h * 0.03,
                color: Colors.black45,
              ))),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.185,
              left: _h * 0.27,
              child: Text(
                "-",
                style: TextStyle(fontSize: 32, color: Colors.black45),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.186,
              left: _h * 0.23,
              child: Text(
                "1",
                style: TextStyle(fontSize: 25, color: Colors.black45),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              bottom: _h * 0.001,
              child: Container(
                height: _h * 0.42,
                width: _w * 0.999,
                decoration: new BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.50,
              left: _w * 0.03,
              child: Text(
                "Price",
                style: TextStyle(fontSize: 20, color: Colors.black26),
              )),
          Positioned(
              top: _h * 0.55,
              left: _w * 0.03,
              child: Text(
                "Shipping fees",
                style: TextStyle(fontSize: 20, color: Colors.black26),
              )),
          Positioned(
              top: _h * 0.60,
              left: _w * 0.03,
              child: Text(
                "Total",
                style: TextStyle(fontSize: 20, color: Colors.black26),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              top: _h * 0.50,
              right: _w * 0.03,
              child: Text(
                "2,400",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              )),
          Positioned(
              top: _h * 0.55,
              right: _w * 0.03,
              child: Text(
                "120",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              )),
          Positioned(
              top: _h * 0.60,
              right: _w * 0.03,
              child: Text(
                "2520",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              bottom: _h * 0.12,
              left: _w * 0.20,
              child: Container(
                height: _h * 0.09,
                width: _w * 0.60,
                child: ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, "/home");},
                  child: Text("Update Cart"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                ),
              )),

          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          Positioned(
              bottom: _h * 0.02,
              left: _w * 0.20,
              child: Container(
                height: _h * 0.09,
                width: _w * 0.60,
                child: ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Last()));},
                  child: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                ),
              )),
          /////////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          // Positioned(
          //   bottom: _h * 0.02,
          //   right: _w * 0.02,
          //   child: new FloatingActionButton(
          //       elevation: 0.0,
          //       child: new Icon(Icons.shopping_cart_outlined),
          //       backgroundColor: Colors.green,
          //       onPressed: () {}),
          // ),
        ],
      ),
    );
  }
}
