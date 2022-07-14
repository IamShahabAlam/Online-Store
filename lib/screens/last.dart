import 'package:appUp_one/components/buttons.dart';
import 'package:appUp_one/components/constants.dart';
import 'package:appUp_one/components/navBar.dart';
import 'package:appUp_one/screens/rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'rating.dart';
import 'home.dart';

class Last extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Scaffold( 
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0,

        
//========================================================================================================

      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
          ),
          Positioned
          (
            top:0,
            left: 0,
            child: Container(
              height: _h * 0.65,
              width: _w * 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.green,
                Colors.green[200],
              ],
            )
              ),
            )),

//======================================================================================================== 

            Positioned
          (
            top:65,
            left: 100,
            child: Text("Order \nPlaced !", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 45, color: Colors.white),)),

//========================================================================================================
  Positioned
          (
            top:240,
            left: 0,
            child: Container(
              height: _h * 0.65,
              width: _w * 0.999,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(70.0),
            )),),

//========================================================================================================    
    Container(
      margin: EdgeInsets.only(left: 58),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: _h * 0.22,),
          Icon(Icons.check_circle_rounded, size: 110, color: Colors.green,),
          SizedBox(height: _h* 0.008,),
          Text('Thank you for shopping', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black) ),
          SizedBox(height: _h* 0.015,),
          Text('Your order will be delivered \nin 8-10 working days',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54) )
        ],
      ),
    ),

//========================================================================================================  

    Positioned(
        bottom: 80,
        right: 120,
        child: 
      Container(

         child:
             HomeBtn(
               heightB: 0.06,
               widthB: 0.4,
               name: "Shop More",
               t_margin: 0.04,
               onpressed:  (){ Navigator.push(context, MaterialPageRoute(builder: (context) => BNB(), ));},
               lastClr: kactiveCardColor,
               firstClr: kBMRactiveCardColor,
             ),
      )),


          Positioned(
              bottom: 22,
              right: 120,
              child:
              Container(

                child:
                HomeBtn(
                  heightB: 0.06,
                  widthB: 0.4,
                  name: "Feedback",
                  t_margin: 0.04,
                  onpressed:  (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Rating() ));},
                  lastClr: kBMRactiveCardColor,
                  firstClr: kactiveCardColor,
                ),
              )),




//========================================================================================================
     
     
     
//========================================================================================================



//========================================================================================================
       ],
),
    );
  }
}
