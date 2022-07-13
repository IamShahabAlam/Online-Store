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

class Elec extends StatefulWidget {
  @override
  State<Elec> createState() => _ElecState();
}

class _ElecState extends State<Elec> {
  var itemPics = [
    "https://cdn.shopify.com/s/files/1/0605/9026/0388/products/9a0ea9f20d71c3a3c5c3cde16671be5d_4abb9bab-fd05-4051-a57e-9f9f5703552e.jpg?v=1654816454",
    "https://compareprice.pk/wp-content/uploads/2019/07/orient-32-inch-falcon-price.jpg",
    "https://hadielectronics.com.pk/wp-content/uploads/2021/06/74.jpg",
    "https://pakref.com/wp-content/uploads/2021/09/dawlance-dw270es.png",
    "https://media.naheed.pk/catalog/product/cache/49dcd5d85f0fa4d590e132d0368d8132/1/1/1182850-1.jpg",
    "https://cdn.shopify.com/s/files/1/0591/9614/5816/products/WF103-01-1_1024x1024.jpg?v=1631183688"
  ];

  var itemNames = [
    "Haier Inverter AC",
    "Orient LED TV",
    "Haier Refrigerator",
    "Dawlence Washingmachine",
    "Westpoint Blender",
    "WP Vaccuum Cleaner"
  ];

  var itemReviews = [
    "(14 Reviews)",
    "(28 Reviews)",
    "(02 Reviews)",
    "(39 Reviews)",
    "(04 Reviews)",
    "(110 Reviews)"
  ];
 //
 // dynamic itemPages = [
 //    AC(),
 //    AC(),
 //    AC(),
 //    AC(),
 //    AC(),
 //    AC()
 //  ];

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
            "Electronics",
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
                                  "https://blogger.googleusercontent.com/img/a/AVvXsEjS7kB2b7KWOJDBMeOipjOFp16VhHsOl86zz2txUEHEHnBClTutKaRF6Up5K5zYhU5i1w90yd4Yb08xoGqTg_vhqUDRyzS0_RPlgDSVMV8OCJgzIuKD47XWWKYNxwJ80G8bTf9xqY-gY6KDOCqI4Bs9yFXmJKvXjVd6XCgX2whohp5TWKwOWL8Jl8Qm=w1200-h630-p-k-no-nu"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Haier Convertable Series",
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
                                  "https://www.brandsynario.com/wp-content/uploads/2020/02/dawlance.png"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Dawlence Supperior Wash",
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
                                  "https://image.haier.com/ph/W020220418602403316536.jpg"),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Haier Promo",
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
                      GestureDetector(
                        onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => itemPages[index]),
            // );
          },
                        child: Container(
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
