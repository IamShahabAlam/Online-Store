import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


class ContainerWid extends StatelessWidget {
  ContainerWid({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        height: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colour),
      ),
    );
  }
}


// ===================================================================
// For BMI


class ResultCard extends StatelessWidget {
  ResultCard({this.resultText, this.resultValue, this.suggestion ,this.bgCardClr, this.resultTextBgClr, this.suggestionBgClr  });

  final String resultText , resultValue , suggestion;
  final Color bgCardClr, resultTextBgClr, suggestionBgClr ;

@override
  Widget build(BuildContext context) {

  final _h = MediaQuery.of(context).size.height  ;
  final _w = MediaQuery.of(context).size.width;

  return Stack(
    alignment: Alignment.center ,
    children: [
      Container(
        margin: EdgeInsets.only(bottom: _h*0.1),
        height: _h*0.45,
        width: _w*0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: bgCardClr ,

        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Spacer(),
            // Result Text
            Container( 
                height: _h*0.08,
                width: _w*0.52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: resultTextBgClr, borderRadius: BorderRadius.circular(8),
                  boxShadow: [kResultBoxShadow],
                ),
                child: Text(resultText,style: kResultText ,)),

            Spacer(),

            Text(resultValue,style: kBMIStyle,),


            Container(
              height: _h*0.009,
              width: _w*0.4,
              decoration: BoxDecoration(
                color: Colors.white24,
              ),

            ),
            Spacer(flex: 2,),

          ],
        ),
      ),

      // SizedBox(height: _h*0.1,),

      Container(
        margin: EdgeInsets.only(top: _h*0.4),
        padding: const EdgeInsets.all(15.0),
        width: _w*0.8,
        decoration: BoxDecoration(
            color: suggestionBgClr,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [kBtnBoxShadow]
        ),
        child: Text(suggestion,style: kBMIsuggest, textAlign: TextAlign.center,),
      ),
    ],
  );
  }
}


// ===================================================================
// For BMR


class BMRResultCard extends StatelessWidget {
  BMRResultCard({this.topText,this.Active_Value,this.Intense_Value,this.Lactive_Value, this.Moderate_Value, this.Sed_Value});

  final String topText;
  final String Sed_Value , Lactive_Value, Moderate_Value , Active_Value , Intense_Value ;

  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height  ;
    final _w = MediaQuery.of(context).size.width;


    return SizedBox( height: _h*0.64, width: _w*1,
      child: Stack( alignment: Alignment.center,
        children: [

// Grey Card BG
          Positioned( top: 55.0,
            child: Container(
              // margin: EdgeInsets.only(bottom: _h*0.1),
              height: _h*0.52,
              width: _w*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kinactiveCardColor ,),
              child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 0.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(margin: EdgeInsets.only(left: _w*0.05),
                          child: Text("Activity Level" ,style: kbbs,)),

                      Container(margin: EdgeInsets.only(right: _w*0.08),
                          child: Text("Calorie",style: kbbs,))
                ],),

                  ActivityRow(name: "Sedentary" , value: Sed_Value,),
                  ActivityRow(name: "Lightly active" , value: Lactive_Value,),
                  ActivityRow(name: "Moderate" , value: Moderate_Value ,),
                  ActivityRow(name: "Active" , value: Active_Value,),
                  ActivityRow(name: "Intense" , value: Intense_Value,),



              ],),
            ),
          ),

          Positioned( top: 0.0,
              child: Container(
                // margin: EdgeInsets.only(top: _h*0.4),
                padding: const EdgeInsets.all(15.0),
                width: _w*0.8,
                decoration: BoxDecoration(
                    color: kBMRactiveCardColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [kBtnBoxShadow]
                ),
                child: Text(topText,style: kBMRTopText, textAlign: TextAlign.center,),
              ),
            ),



      ],),
    );
  }
}


// ===================================================================


class ActivityRow extends StatelessWidget {
 ActivityRow({this.name , this.value });

 final String name;
 final String value;

  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container( margin: EdgeInsets.only(left: _w*0.05),
            child: Text(name , style: KResultActivity,)),

        Container(
            margin: EdgeInsets.only(right: _w*0.05),
            padding: EdgeInsets.symmetric(vertical: _h*0.005 , horizontal: _w*0.05),
            // height: _h*0.08,
            // width: _w*0.52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kBG, borderRadius: BorderRadius.circular(8),
              boxShadow: [kResultBoxShadow],
            ),
            child: Text(value,style: kResultCalories ,)),
      ],);
  }
}


// ===================================================================
// For Weight Loss

class Guide_List extends StatelessWidget {

  Guide_List({this.type, this.kgPerWeek, this.calories, this.labelColor, this.pointColor});

  final String type, kgPerWeek, calories;
  final Color  labelColor;
  final Color pointColor;

  @override
  Widget build(BuildContext context) {

     final _h = MediaQuery.of(context).size.height;
     final _w = MediaQuery.of(context).size.width;

     return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Point(
          triangleHeight: 30.0,
          edge: Edge.RIGHT,
          child: Container(
            padding: EdgeInsets.only(right: 10.0),
            // margin: EdgeInsets.only(top: 5.0),
            color: pointColor,
            height: _h*0.1,
            width: _w*0.48,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(type, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                Text("$kgPerWeek Kg/week", style: TextStyle(fontSize: 15 ,color: kBG),),

              ],
            ),
          ),
        ),

        Label(
          edge: Edge.LEFT,
          triangleHeight: 30.0,
          child: Container(
            margin: EdgeInsets.only(top: 5.0),
            padding: EdgeInsets.only(left: 10.0),
            color: labelColor,
            height: _h*0.1,
            width: _w*0.40,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(calories, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("Calories/day", style: TextStyle(fontSize: 15 ,color: kBG),),
              ],
            ),
          ),
        ),
      ],
    );

   }
}
