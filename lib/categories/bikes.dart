import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/components/constants.dart';
import 'package:firebase_practice/screens/check.dart';
import 'package:firebase_practice/screens/home.dart';
import 'package:firebase_practice/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'elec.dart';

class Bikes extends StatefulWidget {
  @override
  State<Bikes> createState() => _BikesState();
}

class _BikesState extends State<Bikes> {
  var itemPics = [
    "https://dnd.com.pk/wp-content/uploads/2021/04/unnamed-3.jpg",
    "https://i.pinimg.com/originals/37/df/3a/37df3a2db0b4c2389c338cd08fb9673d.png",
    "https://www.wheelsinpak.com/wp-content/uploads/2021/02/ahsanautos.pk-honda-pridor-100cc-black-colour-min.jpg",
    "https://motorcycleshop.pk/img/cms/360-Red-20-1.png",
    "https://driver.pk/wp-content/uploads/2017/02/Zxmco-200cc-Cruise-2018-Price-in-Pakistan.jpg",
    "https://www.bikes4sale.in/pictures/default/yamaha-ybr-125g/yamaha-ybr-125g-640.jpg"
  ];

  var itemNames = [
    "Yamaha YBR",
    "SP Archi 150",
    "Honda Pridor",
    "Honda CB 150F",
    "Zxmco Cruise",
    "Yamaha YBR G"
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
            "Bikes",
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
              const DrawerHeader(

                decoration: BoxDecoration(
                  color: kactiveCardColor,
                ),
                child: Text('MENU', style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),),
              ),

              ListTile(
                // leading: Icon(
                //   FontAwesomeIcons.circleDot,
                // ),
                title: Text("CATEGORIES", style: TextStyle(fontSize: 25.0),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              SizedBox(height: 20,),

              ListTile(
                leading: Icon(
                  FontAwesomeIcons.home, color: kactiveCardColor,
                ),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),


              ListTile(
                leading: Icon(
                  FontAwesomeIcons.shirt,color: kactiveCardColor,
                ),
                title: Text("Elecion"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Elec()));
                },
              ),
              

              ListTile(
                leading: Icon(
                  Icons.electrical_services,color: kactiveCardColor,
                ),
                title: Text("Electronics"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),


              ListTile(
                leading: Icon(
                  Icons.directions_bike, color: kactiveCardColor,
                ),
                title: Text("Bikes"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              SizedBox(height: 20,),

              Divider(height: 0.5 , thickness: 1.0, color: kactiveCardColor,),

              ListTile(
                trailing: Icon(Icons.logout , color: kactiveCardColor,),
                leading: Icon(
                  Icons.check_outlined, color: kactiveCardColor,
                ),
                title: Text("Check Out"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Check()));
                },
              ),

              Divider(height: 0.5 , thickness: 1.0, color: kactiveCardColor,),

              SizedBox(height: 40,),

              Text("Terms of Service | Privacy Policy" , textAlign: TextAlign.center , style: TextStyle(color: Colors.grey, fontSize: 12),)
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
                                  "https://i.brecorder.com/primary/2021/04/60743a5e470e4.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "YBR ShowStopper",
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
                                  "https://driver.pk/wp-content/uploads/2017/02/ZXMCO-200cc-Cruise-Red.jpg.webp"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Zxmco Cruise ",
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
                                  "https://static.pakwheels.com/2017/10/Super-Power-Archi-150cc-e1508497501292.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Archi Launched",
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
