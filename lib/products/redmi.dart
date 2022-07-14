
import 'package:appUp_one/categories/mob.dart';
import 'package:appUp_one/checkout/redmi_order.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Redmi extends StatefulWidget {

  @override
  State<Redmi> createState() => _RedmiState();
}

class _RedmiState extends State<Redmi> {
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
   top: -80,
            child: Container(
              height: _h * 0.60,
              width: _w * 0.99,
              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2wz7N2Zelot2NcyYJ9wHI9atHUIXA7zgYJw&usqp=CAU"),
            ),
          ),
 //===============================================================================================
      Positioned(
        top: 230,
        left: 15,
        child: 
      Container(
        child: Text("Rs. 20,000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.green ),),
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
        child: Text("Redmi 9A", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black87 ),),
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

Positioned(
        top: 342,
        right: 10,
        child: 
      Container(
         child: ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Mob()));},
                  child: Text("View All", style: TextStyle(color: Colors.green),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  ),
                ),
      )),

//===============================================================================================
      
        Positioned(
          top: 370,
          left: 15,
          child: Container(
            child: Row(
              children: [
                Icon(FontAwesomeIcons.buildingColumns, color: Colors.white, size: 15,),
                SizedBox(width: 13,),
                Text("Ilma University", style: TextStyle(fontSize: 17, color: Colors.white70),),
              ],
            ),
          ),
        ),

//===============================================================================================

Positioned(
          bottom: 120,
          left: 12,
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
        bottom: 30,
        right: 90,
        child: 
      Container(
        height: 52,
         child: ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Redmi_Order()));},
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