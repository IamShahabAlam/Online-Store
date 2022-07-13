import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/categories/fash.dart';
import 'package:firebase_practice/components/conatiners.dart';
import 'package:firebase_practice/components/constants.dart';
import 'package:firebase_practice/screens/category.dart';
import 'package:firebase_practice/screens/check.dart';
import 'package:firebase_practice/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login.dart';



class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream chatsStream = FirebaseFirestore.instance.collection('chats').snapshots();

  Stream usersStream = FirebaseFirestore.instance.collection('users').snapshots();


  @override

  Future<String> getUserName() async {					// Function name
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Username']; 					 // Field Name
  }

  Future<String> getEmail() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Email'];
  }

  Future<String> getAge() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Age'];
  }

  Future<String> getPhone() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Phone'];
  }

  Future<String> getAddress() async {
    final CollectionReference users = firestore.collection('users'); 	// collection name
    final String uid = auth.currentUser.uid;
    final result = await users.doc(uid).get();
    return result.data()['Address'];
  }

    var itemPics = [
    "https://driver.pk/wp-content/uploads/2016/08/Yamaha-YBR-125-2017.jpg",
    "https://cdn.pocket-lint.com/r/s/1200x/assets/images/151989-phones-vs-moto-g8-vs-g8-power-vs-g8-plus-whats-the-difference-image1-i14zubfech.jpg",
    "https://5.imimg.com/data5/QR/KO/KS/SELLER-9321582/asus-rog-gaming-laptop-strix-gl503ge-en268t-500x500.jpg",
    "https://www.prodirectcricket.com/productimages/Main/149268.jpg",
    "https://www.morenews.pk/wp-content/uploads/2019/01/United-Bravo.jpg",
    "https://www.wareable.com/media/imager/202011/35179-original.jpg"
  ];

  var itemNames = [
    "Yamaha YBR",
    "Moto G8 PLUS",
    "ASUS GL551JK",
    "New Balance Bat",
    "United Bravo 800CC",
    "Mi Band"
  ];

  var itemReviews = [
    "(14 Reviews)",
    "(28 Reviews)",
    "(02 Reviews)",
    "(39 Reviews)",
    "(04 Reviews)",
    "(21 Reviews)"
  ];


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
      extendBody: true,
      // backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor:  kactiveCardColor,
        brightness: Brightness.dark,
        elevation: 10,

        title:
        Center(
            child: Text("Online Store", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
        ),
        actions: [
          FlatButton(
              padding: EdgeInsets.only(left: 50),
              textColor: Colors.black,
              onPressed: logout,
              child: Icon(Icons.power_settings_new))
        ],
      ),

      drawer: Drawer(

        child:ListView(
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

              title: Text("Profile Details".toUpperCase(),textAlign: TextAlign.center ,style: TextStyle(fontSize: 22.0, color: kBMRactiveCardColor, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: 20,),


            ListTile(
              leading: Icon( FontAwesomeIcons.solidUser, color: kactiveCardColor,),

              title: FBData(function: getUserName(),),

              onTap: () {
                Navigator.pop(context);
              },
            ),
// Divider(height: 0.5 , thickness: 1.0, color: kactiveCardColor,),


            ListTile(
              leading: Icon(Icons.mail, color: kactiveCardColor,),
              title: FBData(function: getEmail(),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

// Divider(height: 0.5,thickness: 1.0, color: kactiveCardColor,),

            ListTile(
              leading: Icon(FontAwesomeIcons.calendarDays, color: kactiveCardColor,),
              title: FBData(function: getAge(),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.phone, color: kactiveCardColor,),
              title: FBData(function: getPhone(),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.locationDot, color: kactiveCardColor,),
              title: FBData(function: getAddress(),),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: 70,),

            Text("Terms of Service | Privacy Policy" , textAlign: TextAlign.center , style: TextStyle(color: Colors.grey, fontSize: 12),),

          ],
        ),


      ),



      body:   ListView(children: [


        
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
                              "https://icms-image.slatic.net/images/ims-web/116f88b2-3799-4e08-95d5-a3a67e630f6d.jpg_1200x1200.jpg"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Furniture",
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
                              "https://icms-image.slatic.net/images/ims-web/acc9ea12-438e-4fb8-84ce-a126c34ca462.jpg"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Foot Wears",
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
                              "https://icms-image.slatic.net/images/ims-web/920f4198-ad1b-4be6-a13e-25ccb8e2127d.jpg"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Snacks",
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
                              "https://icms-image.slatic.net/images/ims-web/0fa6be84-56cb-424b-81e2-7e9558a25ab2.png"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Mobile Accessories ",
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
                              "https://icms-image.slatic.net/images/ims-web/bdeac404-060b-4fe2-82e9-d8d5b9bfeea4.jpg_1200x1200.jpg"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Home & Lifestyle",
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
                              "https://icms-image.slatic.net/images/ims-web/c0e10bdf-0821-45c9-96d4-2215ea39de26.png"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Electronics",
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
                              "https://icms-image.slatic.net/images/ims-web/5a1a48d1-53a3-479f-ade6-d95155cf02d9.jpg"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Computer Accessories",
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
                              "https://icms-image.slatic.net/images/ims-web/dd94c22f-5efd-4d57-b683-ddd14a11ca9c.jpg"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Tour And Trips",
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
                              "https://icms-image.slatic.net/images/ims-web/7793d266-e999-451b-bb0d-0c9eae46d5fe.png"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Washing and Cleanings",
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
            "More Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          trailing: GestureDetector(
              onTap: () {Navigator.pushNamed(context, "/cate");},
              child: Text("View More",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                  ))),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 68,
            child: Row(
              children: [
                // 1st Category
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Fash()));},
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 6),
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[100],
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // position of a shadow
                          )
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.electrical_services,
                          size: 25,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              "Electronics",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text("250 Items"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 2nd Category
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Fash()));},
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 6),
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[100],
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // position of a shadow
                          )
                        ]),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap:(){ } ,
                          child: Icon(
                            FontAwesomeIcons.shirt,
                            size: 20,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              "Fashion",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text("330 Items"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 3rd Category
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Fash()));},
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 6),
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[100],
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // position of a shadow
                          )
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mobile_screen_share,
                          size: 25,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              "Mobiles",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text("456 Items"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 4th Category
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Fash()));},
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 6),
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[100],
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // position of a shadow
                          )
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.electric_bike,
                          size: 25,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              "Bikes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text("68 Items"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 5th Category
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Fash()));},
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 6),
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[100],
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // position of a shadow
                          )
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.pets,
                          size: 25,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              "Pets",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text("48 Items"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 6th Category
                GestureDetector(
                  onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=> Fash()));},
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 6),
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[100],
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // position of a shadow
                          )
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.more_vert,
                          size: 25,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              "Others",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text("279 Items"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ), // MAIN ROW

        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          leading: Text(
            "Popular Items",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          trailing: GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Fash()));},
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
                      color: Colors.green[100],
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



    );




  }
}



