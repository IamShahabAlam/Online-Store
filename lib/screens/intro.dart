import 'package:appUp_one/components/buttons.dart';
import 'package:appUp_one/components/constants.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  final _advancedDrawerController = AdvancedDrawerController();


  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return AdvancedDrawer(
      backdropColor: kinactiveCardColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),

      drawer:SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 130.0,
                  height: 130.0,
                  margin: const EdgeInsets.only(
                    top: 30.0,
                    bottom: 24.0,
                  ),
                  padding: EdgeInsets.only(bottom: 0.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    // color: Colors.black26,
                    // shape: BoxShape.circle,
                  ),

                    child: Image.asset(
                      'assets/logo.png',
                    ),

                ),

                // Text("You're Fit App".toUpperCase(), style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold, color: Colors.grey[800]),),

                SizedBox(height: _h*0.03,),

                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesomeIcons.solidUser,color: kactiveCardColor, size: 20.0,),
                  title: Text('Shahab Alam' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  subtitle: Text("CSC-18F-025",style: TextStyle(color: kactiveCardColor, fontSize: 16,fontWeight: FontWeight.bold),),
                ),

                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesomeIcons.solidUser, color: kactiveCardColor, size: 20.0,),
                  title: Text('Zaryab Alam',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  subtitle: Text("CSC-18F-133",style: TextStyle(color: kactiveCardColor, fontSize: 16,fontWeight: FontWeight.bold),),
                ),

                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesomeIcons.solidUser, color: kactiveCardColor, size: 20.0,),
                  title: Text('Noor',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  subtitle: Text("CSC-20S-097",style: TextStyle(color: kactiveCardColor, fontSize: 16,fontWeight: FontWeight.bold),),
                ),


                Divider(color: kactiveCardColor ,),

                SizedBox(height: _h*0.02,),

                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesomeIcons.buildingColumns, color: kactiveCardColor, size: 20.0,),
                  title: Text('SMI University',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                  // subtitle: Text("CSC-18F-133",style: TextStyle(color: kactiveCardColor, fontSize: 16),),
                ),

                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesomeIcons.mobileScreen, color: kactiveCardColor, size: 20.0,),
                  title: Text('App Up Competition 2022',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                ),

                Spacer(),

                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,


      child: Scaffold(
        backgroundColor: kBG,
        appBar: AppBar(backgroundColor: kBG, elevation: 0.0,
          leading:IconButton(  color: kactiveCardColor, iconSize: 30.0,
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),

        ),
        body: Column(

          mainAxisSize: MainAxisSize.max ,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
// LOGO
            Align( alignment: Alignment.center,
                child:  Image.asset("assets/logo.png", height: _h*0.25 , width: _w*0.6, )),

            Container(
              margin: EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              child: Text("ONLINE STORE" , style: TextStyle(fontSize: 30.0, color: kactiveCardColor , fontWeight: FontWeight.bold),),
            ),

// Text
            Container( margin: EdgeInsets.symmetric(horizontal: _w*0.06 , vertical: _h*0.06),
              child: Text("This is an Online Store. Its Entirely built on Flutter by Shahab Alam (CSC-18F-025) , Zaryab Alam (CSC-18f-133) and Noor (CSC-20S-097), The Students of Sindh Madressatul Islam University.",
                style: TextStyle(fontSize: 15, height: 1.35 ), textAlign: TextAlign.justify,),
            ),

//  Button
            HomeBtn(
              heightB: 0.08,
              widthB: 0.6,
              name: "Log In",
              onpressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Login(), ));},
              t_margin: 0.04,
              firstClr: kactiveCardColor,
              lastClr : kBMRactiveCardColor,
            ),

//  Button
            HomeBtn(
              heightB: 0.08,
              widthB: 0.6,
              name: "Sign Up",
              t_margin: 0.04,
              onpressed:  (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Register(), ));},
              lastClr: kactiveCardColor,
              firstClr: kBMRactiveCardColor,
            ),



          ],
        ),
      ),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

