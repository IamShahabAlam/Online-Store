import 'package:appUp_one/components/constants.dart';
import 'package:clippy_flutter/buttcheek.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Post_Product extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Scaffold(
      body:
      Column(
        children: [
          Stack(
            children: [
              ButtCheek(
                height: 25,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaY: 5.0 ,sigmaX: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    child: Image.asset("assets/cover.jpg",
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,),
                  ),
                ),
              ),

              Positioned( top: 50, left: _w*0.29 ,
                  child: Container( height: 90.0, width: 200.0,
                      child: Text("POST AD" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 40.0, letterSpacing: 2.0),))),

              Positioned( top: 30.0 , left: 10.0,
                child: Container(height: 40, width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,


                  ),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                      ),
                      onPressed: (){Navigator.pop(context);},
                      child: Icon(Icons.arrow_back_ios_outlined, color: kBMRactiveCardColor,)),
                ),
              ),
            ],
          ),
// =============================================================================================



        ],
      ),
    );
  }
}
