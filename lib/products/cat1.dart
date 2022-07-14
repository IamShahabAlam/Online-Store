import 'package:appUp_one/categories/pets.dart';
import 'package:appUp_one/checkout/cat1_order.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Cat1 extends StatefulWidget {

  @override
  State<Cat1> createState() => _Cat1State();
}

class _Cat1State extends State<Cat1> {
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
   top: -85,
            child: Container(
              height: _h * 0.60,
              width: _w * 0.99,
              child: Image.network("https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg"),
            ),
          ),
 //===============================================================================================
      Positioned(
        top: 230,
        left: 15,
        child: 
      Container(
        child: Text("Rs. 15,000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.green ),),
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
        child: Text("Persian Cat White", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black87 ),),
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
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Pets()));},
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
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Cat1_Order()));},
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