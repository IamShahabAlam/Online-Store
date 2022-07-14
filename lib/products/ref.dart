
import 'package:appUp_one/checkout/ref_order.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Ref extends StatefulWidget {

  @override
  State<Ref> createState() => _RefState();
}

class _RefState extends State<Ref> {
  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Colors.green,
          brightness: Brightness.dark,
        
          title: 
               Text(
            "Checkout",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
//===============================================================================================
//===============================================================================================
      body: 
      Stack(
        children: [
          Container(
            width: double.infinity
          ),
          Positioned(
   top: -25,
   left: 25,
            child: Container(
              height: _h * 0.45,
              width: _w * 0.85,
              child: Image.network("https://hadielectronics.com.pk/wp-content/uploads/2021/06/74.jpg"),
            ),
          ),
 //===============================================================================================
      Positioned(
        top: 230,
        left: 15,
        child: 
      Container(
        child: Text("Rs. 95,000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.green ),),
      )),
//===============================================================================================
      Positioned(
        top: 275,
        left: 0,
        child: Container(
        height: _h *0.003,
        width: _w * 0.999,
        color: Colors.black12,
      ),
      ),
//===============================================================================================
        Positioned(
        top: 290,
        left: 15,
        child: 
      Container(
        child: Text("Haier Refrigerator", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black87 ),),
      )),
//===============================================================================================
        Positioned(
        top: 330,
        left: 0,
        child: Container(
        height: _h *0.11,
        width: _w * 0.999,
        color: Colors.green,    
      ),
      ),
//===============================================================================================
Positioned(
        top: 340,
        left: 15,
        child: 
      Container(
        child: Text("Online Store", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white ),),
      )),


//===============================================================================================

Positioned(
        top: 345,
        left: 135,
        child: 
      Container(
        child: Text("App Up 2022", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white ),),
      )),


//===============================================================================================

//===============================================================================================
//===============================================================================================

Positioned(
          top: 420,
          left: 15,
          child: Container(
            child: Row(
              children: [
                Text("Description: ", style: TextStyle(fontSize: 14, color: Colors.black54),),
                SizedBox(width: 3,),
                Text("Genuine Product, Original Warranty, Lowest Prize", style: TextStyle(fontSize: 12, color: Colors.black,),)
              ],
            ),
          ),
        ),

//===============================================================================================

Positioned(
        bottom: 15,
        right: 90,
        child: 
      Container(
        height: 43,
         child: ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Ref_Order()));},
                  child: Text("Checkout", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  ),
                ),
      )),

//===============================================================================================



        ],     
      ),
        );
    
  }
}