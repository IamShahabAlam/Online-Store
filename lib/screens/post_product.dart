import 'package:appUp_one/components/buttons.dart';
import 'package:appUp_one/components/constants.dart';
import 'package:clippy_flutter/buttcheek.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/painting.dart';

class Post_Product extends StatefulWidget {

  @override
  _Post_ProductState createState() => _Post_ProductState();
}

class _Post_ProductState extends State<Post_Product> {

  String dropdownValue;

  var items = [
    "Fashion", "Electronics" , "Mobiles" , "Bikes" , "Pets" , "Others"
  ];

  final List<IconData> iconsList = [
    Icons.add_a_photo_outlined,
    Icons.add_a_photo_outlined,
    Icons.add_a_photo_outlined,
    Icons.add_a_photo_outlined,
    Icons.add_a_photo_outlined,
    Icons.add_a_photo_outlined,
    Icons.add_a_photo_outlined,
    Icons.add_a_photo_outlined,

  ];

  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBG,
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection. ltr,

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
            margin: EdgeInsets.only(left: 25.0 , top: 15.0, bottom: 10.0),
            child: Text("Select Categories" , style: TextStyle(color: Colors.grey , fontSize: 14.0),) ,),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left:30.0, right: 30.0 , bottom: 20.0),
              padding:  EdgeInsets.only(left:20.0,),
              decoration: BoxDecoration(
                color: Color(0xFFd8f2d9) ,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: kBMRactiveCardColor , ),
              ),
              child: DropdownButton(
                // iconEnabledColor:  Color(0xFFd8f2d9) ,
                focusColor:  Color(0xFFd8f2d9) ,
                dropdownColor: Color(0xFFd8f2d9),
                disabledHint: Text("Select Categories"),
                itemHeight: 60.0,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 30.0,
                value: dropdownValue,
                hint: Container(margin: EdgeInsets.only(right: _w*0.46), child: Text("Categories" , )),
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
            PostField(
              maxLen: 70,
              maxLines: 1 ,
              height: 20 ,
              label: "     Title" ,
              helper: " Mention the key features of your item" ,
              hint: "     Ad Title" ,
            ),


//  Description
            PostField(
              maxLines: 10 ,
              height: 40,
              maxLen: 2000,
              hint:  "    Ad Description",
              helper: " Include quality, features and warranty",
              label:  "      Description",
            ),

// Brand
            PostField(
              maxLen: 50,
              maxLines: 1 ,
              height: 20 ,
              label: "     Brand" ,
              helper: " Mention the Manufactures of your item" ,
              hint: "     Ad Brand" ,
            ),

 // Price
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 20.0),
              child: Text("Set Price".toUpperCase() ,textAlign: TextAlign.left ,style: TextStyle(color: kBMRactiveCardColor, fontSize: 25.0 , fontWeight: FontWeight.bold), ),
            ),

            PostField(
              preText: "   Rs  |  ",
              maxLines: 1 ,
              height: 20 ,
              label: "    Price" ,
              helper: " Price in Pakistani Rupees" ,
              hint: "     Price" ,
            ),

// ================================ Picture  ========================================

// Pictures
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 20.0),
              child: Text("upload pictures".toUpperCase() ,textAlign: TextAlign.left ,style: TextStyle(color: kBMRactiveCardColor, fontSize: 25.0 , fontWeight: FontWeight.bold), ),
            ),

            GridView.count(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
              crossAxisCount: 4,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              shrinkWrap: true,
              children: List.generate(iconsList.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xffdff6e0),
                    border: Border.all(color: kBMRactiveCardColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(iconsList[index] , color: kBMRactiveCardColor,),
                );
              }
              )
            ),


// ================================  Button  ========================================

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: HomeBtn(
                  heightB: 0.07,
                  widthB: 0.4,
                  name: "Sell",
                  t_margin: 0.045,
                  onpressed:  (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Post_Product(), ));
                  },
                  lastClr: kactiveCardColor,
                  firstClr: kBMRactiveCardColor,
                ),
              ),
            ),


// ================================  X ========================================
// ================================  X ========================================

          ],
        ),
      ),
    );
  }
}

class PostField extends StatelessWidget {

   PostField({this.height,this.helper,this.maxLen,this.hint,this.label,this.maxLines, this.preText});
   final String label , hint  , helper , preText;
   final int  maxLen , maxLines ;
   final double height ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0 ,vertical: 15.0),
      child: TextField(
        minLines: 1,
        maxLines: maxLines,
        cursorColor: kactiveCardColor,
        maxLength: maxLen,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          filled: true,
          fillColor: kactiveCardColor.withOpacity(0.2),
          prefixText: preText,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: height),
          helperText: helper,
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(color: kBMRactiveCardColor),
          focusColor: kactiveCardColor,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(color: kBMRactiveCardColor)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0) , borderSide: BorderSide(color: kactiveCardColor))
        ),
      ),
    );
  }
}
