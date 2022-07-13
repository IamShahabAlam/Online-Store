import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/categories/mob.dart';
import 'package:firebase_practice/categories/pets.dart';
import 'package:firebase_practice/components/constants.dart';
import 'package:firebase_practice/screens/check.dart';
import 'package:firebase_practice/screens/home.dart';
import 'package:firebase_practice/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bikes.dart';
import 'elec.dart';
import 'fash.dart';
import 'others.dart';

class Others extends StatefulWidget {
  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  var itemPics = [
    "https://albakio.com.pk/lms/wp-content/uploads/2021/06/185.jpg",
    "https://cdn.shopify.com/s/files/1/0554/7176/7611/products/image_8e2aa6fb-c285-4476-b146-650a8d481e90_1445x.jpg?v=1642419080",
    "https://cdn.shopify.com/s/files/1/0107/6992/4153/products/Mouse_M607_1024x1024.jpg?v=1572980047",
    "https://i.pinimg.com/550x/13/aa/ee/13aaeeee2e17a99f5ca6ffd43ff2b6ee.jpg",
    "https://thesportsfactory.pk/wp-content/uploads/2020/11/CA-15000-plus%E2%98%BA1-min.jpg",
    "https://cdn.shopify.com/s/files/1/0022/1272/4800/products/1489575965_1200x1200.jpg?v=1543155821"
  ];

  var itemNames = [
    "Dollar Mypencil",
    "Tennis Ball",
    "Redragon Mouse",
    "Nike Socks",
    "CA Bat",
    "Artemis SR1000s"
  ];

  var itemReviews = [
    "(14 Reviews)",
    "(28 Reviews)",
    "(02 Reviews)",
    "(39 Reviews)",
    "(04 Reviews)",
    "(110 Reviews)"
  ];

  @override
  Widget build(BuildContext context) {

    void logout() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
      } catch (e) {
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          brightness: Brightness.dark,
          elevation: 10,

          title: Center(
              child: Text(
            "Others",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
          actions: [
            FlatButton(
                padding: EdgeInsets.only(left: 50),
                textColor: Colors.black,
                onPressed: logout,
                child: Icon(Icons.power_settings_new))
          ],
        ),

        // ===========================================================

      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://img.freepik.com/premium-vector/dark-green-ray-burst-background_1164-1709.jpg",) , fit: BoxFit.cover, ),
                // color: kactiveCardColor,
              ),
              child: Column(
                children: [
                  SizedBox( height: 100, width: 100,
                      child: Image.asset("assets/logo.png",  )),
                ],
              ),
            ),

            ListTile(
              title: Text("Categories".toUpperCase(),textAlign: TextAlign.center ,style: TextStyle(fontSize: 22.0, color: kBMRactiveCardColor, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.0,),

            ListTile(
              visualDensity: VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0, ),
              tileColor: kactiveCardColor.withOpacity(0.2),
              leading: Icon(
                FontAwesomeIcons.home, color: kactiveCardColor, size: 20,
              ),
              title: Text("Home"),
              trailing: Icon(Icons.chevron_right, color: kactiveCardColor, size: 25.0,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),


            ListTile(
              visualDensity: VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              leading: Icon(
                FontAwesomeIcons.shirt,color: kactiveCardColor, size: 20,
              ),
              title: Text("Fashion"),
              trailing: Icon(Icons.chevron_right, color: kactiveCardColor, size: 25.0,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Fash()));
              },
            ),


            ListTile(
              visualDensity: VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              tileColor: kactiveCardColor.withOpacity(0.2),
              leading: Icon(
                FontAwesomeIcons.plug,color: kactiveCardColor, size: 25,
              ),
              title: Text("Electronics"),
              trailing: Icon(Icons.chevron_right, color: kactiveCardColor, size: 25.0,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Elec()));
              },
            ),


            ListTile(
              visualDensity: VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              leading: Icon(
                FontAwesomeIcons.motorcycle, color: kactiveCardColor, size: 22,
              ),
              title: Text("Bikes"),
              trailing: Icon(Icons.chevron_right, color: kactiveCardColor, size: 25.0,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Bikes()));
              },
            ),

            ListTile(
              visualDensity: VisualDensity(vertical: -2),

              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              tileColor: kactiveCardColor.withOpacity(0.2),
              leading: Icon(
                FontAwesomeIcons.mobileRetro, color: kactiveCardColor, size: 22,
              ),
              title: Text("Mobiles"),
              trailing: Icon(Icons.chevron_right, color: kactiveCardColor, size: 25.0,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Mob()));
              },
            ),


            ListTile(
              visualDensity: VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              leading: Icon(
                Icons.pets, color: kactiveCardColor,
              ),
              title: Text("Pet"),
              trailing: Icon(Icons.chevron_right, color: kactiveCardColor, size: 25.0,),

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pets()));
              },
            ),

            ListTile(
              visualDensity: VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
              tileColor: kactiveCardColor.withOpacity(0.2),
              leading: Icon(
                Icons.more_rounded, color: kactiveCardColor, size: 19.0,
              ),
              title: Text("Others"),
              trailing: Icon(Icons.chevron_right, color: kactiveCardColor, size: 25.0,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Others()));
              },
            ),


            // SizedBox(height: 20,),

            // Text("Terms of Service | Privacy Policy" , textAlign: TextAlign.center , style: TextStyle(color: Colors.grey, fontSize: 12),)
          ],
        ),
      ),


        // ===========================================================

        body: SingleChildScrollView(
          child: Column(
              children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              leading: Text(
                " Popular Items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              trailing: GestureDetector(
                  onTap: () {},
                  child: Text("View More",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                      ))),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 0.5,
                          height: MediaQuery.of(context).size.height / 3.8,
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: Alignment(0, 0),
                              image: NetworkImage(
                                  "https://pbs.twimg.com/media/FJct0qQWQAEUPNv.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Dollar Stationary",
                              style: TextStyle(fontSize: 18),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text("   4.0")
                            ]),
                        Text("(16 Reviews)")
                      ],
                    ),

                    //2nd Image of Slider
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 0.5,
                          height: MediaQuery.of(context).size.height / 3.8,
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: Alignment(0, 0),
                              image: NetworkImage(
                                  "https://www.crayola.com/-/media/Crafts-New/Poster-Frames/Heart-Mothers-Day-Wreath_Poster-Frame.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Mother's Day Special",
                              style: TextStyle(fontSize: 18),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text("   5.0")
                            ]),
                        Text("(24 Reviews)")
                      ],
                    ),

                    //3rd Image of Slider
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 0.5,
                          height: MediaQuery.of(context).size.height / 3.8,
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: Alignment(0, 0),
                              image: NetworkImage(
                                  "https://www.ca-sports.com.pk/images/Imam-ul-Haaq.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Unleashed Spirit",
                              style: TextStyle(fontSize: 18),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text("   5.0")
                            ]),
                        Text("(104 Reviews)")
                      ],
                    ),

                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 281.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.easeInBack,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 700),
                    viewportFraction: 0.85,
                  ),
                ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              leading: Text(
                "Items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              trailing: GestureDetector(
                  onTap: () {},
                  child: Text("View More",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                      ))),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
              children: List.generate(itemNames.length, (index) {
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          blurRadius: 2,
                          spreadRadius: 0.7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11)),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.height / 5.5,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment(0, 0),
                            image: NetworkImage(itemPics[index]),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        itemNames[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Text("   5.0", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        itemReviews[index],
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                );
              }),
            ),

          ]),
        ),
    );


  }
}
