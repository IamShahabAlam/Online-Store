import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_practice/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'category.dart';
import 'home.dart';
import 'intro.dart';

class BNB extends StatefulWidget {
  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {

  int _currentIndex = 1;

  final screens = [Cate(), Home(), Intro()];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {


    void onItemTapped(int index){
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      extendBody: true,
      body: Center(
        child: screens.elementAt(_currentIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // Dependency
        // animationDuration: Duration(seconds: 1),
        // animationCurve: Curves.easeInBack,
        key: _bottomNavigationKey,
        index: _currentIndex,
        color:  Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 50,
        backgroundColor:  kactiveCardColor, // dependency
        items: <Widget>[

          Icon(FontAwesomeIcons.elementor, size: 25, color: Colors.black,),

          Icon(Icons.home, size: 25, color: Colors.black,),

          Icon(FontAwesomeIcons.userAlt, size: 20, color:  Colors.black,),
        ],
        letIndexChange: (index) => true,
        onTap: onItemTapped,

      ),
    );
  }
}
