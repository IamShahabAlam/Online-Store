import 'package:appUp_one/components/constants.dart';
import 'package:clippy_flutter/buttcheek.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Post_Product extends StatefulWidget {

  @override
  _Post_ProductState createState() => _Post_ProductState();
}

class _Post_ProductState extends State<Post_Product> {

  String dropdownValue;

  var items = [
    "Fashion", "Electronics" , "Mobiles" , "Bikes" , "Pets" , "Others"
  ];

  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBG,
      body:
      SingleChildScrollView(
        child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
// ===============================  Cover =========================================
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

// ================================  Fields ========================================
// Ad Details
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 20.0),
              child: Text("Ad Details".toUpperCase() ,textAlign: TextAlign.left ,style: TextStyle(color: kBMRactiveCardColor, fontSize: 25.0 , fontWeight: FontWeight.bold), ),
            ),

// Categories

          Container(
            margin: EdgeInsets.only(left: 25.0),
            child: Text("Select Categories" , style: TextStyle(color: Colors.grey , fontSize: 14.0),) ,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: DropdownButton(

                dropdownColor: kBMRactiveCardColor,
                disabledHint: Text("Select Categories"),
                itemHeight: 60.0,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 30.0,
                value: dropdownValue,
                hint: Container(margin: EdgeInsets.only(right: _w*0.5), child: Text("Categories")),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                      child: Text(items),);
                    }).toList(),
                onChanged: (String newValue){
                  setState((){
                    dropdownValue = newValue;
                  });
                },
              ),
            ),

// Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0 ,vertical: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  helperText: "Key Feature of your product",
                  hintText: "Ad Title",
                  labelText: "Title",

                ),
              ),
            ),
// ================================ X  ========================================
// ================================  X ========================================
// ================================  X ========================================
// ================================  X ========================================

          ],
        ),
      ),
    );
  }
}
