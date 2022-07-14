import 'package:appUp_one/categories/bikes.dart';
import 'package:appUp_one/categories/mob.dart';
import 'package:appUp_one/categories/pets.dart';
import 'elec.dart';
import 'others.dart';
import 'package:appUp_one/components/constants.dart';
import 'package:appUp_one/components/navBar.dart';
import 'package:appUp_one/products/cap.dart';
import 'package:appUp_one/products/jeans.dart';
import 'package:appUp_one/products/shirt.dart';
import 'package:appUp_one/products/shoes.dart';
import 'package:appUp_one/products/suit.dart';
import 'package:appUp_one/products/watch.dart';
import 'package:appUp_one/screens/check.dart';
import 'package:appUp_one/screens/home.dart';
import 'package:appUp_one/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';



class Fash extends StatefulWidget {
  @override
  State<Fash> createState() => _FashState();
}

class _FashState extends State<Fash> {
  var itemPics = [
    "https://cdn.edenrobe.com/media/catalog/product/cache/4fa8627ad3552d906aaca1ac84f49d9c/0/n/0n9a2777-emtps22-020.jpg",
    "https://images.pexels.com/photos/280250/pexels-photo-280250.jpeg?cs=srgb&dl=pexels-pixabay-280250.jpg&fm=jpg",
    "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?cs=srgb&dl=pexels-pixabay-267301.jpg&fm=jpg",
    "https://thumbs.dreamstime.com/b/blue-jeans-isolated-white-34440719.jpg",
    "https://image.shutterstock.com/image-photo/baseball-cap-isolated-on-white-260nw-610601909.jpg",
    "https://image.made-in-china.com/202f0j00aocfdbgKEkqv/Ready-to-Ship-Latest-Design-Groom-Wedding-Pictures-Men-s-Coat-Pant-Designs-Wedding-Suit-Made-in-China.jpg"
  ];

  var itemNames = [
    "Polo Shirt",
    "Wristwatch",
    "Shoes",
    "Denum Jeans",
    "Cap",
    "Suit"
  ];

  var itemReviews = [
    "(14 Reviews)",
    "(28 Reviews)",
    "(02 Reviews)",
    "(39 Reviews)",
    "(04 Reviews)",
    "(110 Reviews)"
  ];

  dynamic itemPages = [
  Shirt(),
  Watch(),
  Shoe(),
  Jeans(),
  Cap(),
  Suit(),
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
            "Fashion",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => BNB()));
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
                                  "https://cdn.mos.cms.futurecdn.net/B9aLfh58bFD4w4REnN5q7G.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Fathers Day Special",
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
                                  "https://img.freepik.com/free-vector/pair-leather-sports-shoes-wood-background_1284-17526.jpg?w=2000"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Nike Shoes",
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
                                  "https://i.pinimg.com/originals/85/89/ee/8589ee871af24d3d66b52a2be6eb7eba.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Shalwar Kameez",
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

                    //4th Image of Slider
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
                                  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/suit-sale-video-ad-design-template-78616d0f45bc752096797eab567100e3.jpg?ts=1632689844"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Suit Offers ",
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
                              Text("   4.0")
                            ]),
                        Text("(22 Reviews)")
                      ],
                    ),

                    //5th Image of Slider
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
                                  "https://i.ytimg.com/vi/2JbhsIuFv48/maxresdefault.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Shirt & Life",
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
                        Text("(63 Reviews)")
                      ],
                    ),

                    //6th Image of Slider
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
                                  "https://image.shutterstock.com/image-vector/quote-tshirt-coffee-comes-brilliant-260nw-1858968316.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Even More Tshirts",
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
                              Text("   3.0")
                            ]),
                        Text("(59 Reviews)")
                      ],
                    ),

                    //7th Image of Slider
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
                                  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/retail-sale-jeans-template-design-0869fbbe0cf85fc470f9217bbe9e030b_screen.jpg?ts=1561378520"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Jeans Rules",
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
                        Text("(142 Reviews)")
                      ],
                    ),

                    //8th Image of Slider
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
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB2nJ9tJIor1wa8bLRNLus-IS8hGNGD9e_gQ&usqp=CAU"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Western Clothing",
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
                              Text("   3.5")
                            ]),
                        Text("(17 Reviews)")
                      ],
                    ),

                    //9th Image of Slider
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
                                  "https://www.stylostreet.com/wp-content/uploads/2019/10/khaadi-pet-colors.png"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Khaddi Offers",
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
                        Text("(33 Reviews)")
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
                  child:  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => itemPages[index]),
            );
          },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                       height: MediaQuery.of(context).size.height / 6.0,
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
