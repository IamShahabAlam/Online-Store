import 'package:appUp_one/components/constants.dart';
import 'package:clippy_flutter/buttcheek.dart';
import 'package:flutter/material.dart';

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
                height: 30,
                child: Image.asset("assets/cover.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,),
              ),

              Positioned( top: 60, left: _w*0.38 ,
                  child: Container( height: 90.0, width: 90.0,
                      child: Image.asset("assets/logo.png" , fit: BoxFit.contain,))),

              Positioned( top: 30.0 , left: 10.0,
                child: Container(height: 40, width: 40,
                  padding: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,

                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          // shape: CircleBorder()
                      ),
                      onPressed: (){},
                      child: Icon(Icons.arrow_back_ios_outlined, size: 25.0, color: kBMRactiveCardColor,)),
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
