import 'package:appUp_one/products/ac.dart';
import 'package:appUp_one/products/archi.dart';
import 'package:appUp_one/products/ball.dart';
import 'package:appUp_one/products/bat.dart';
import 'package:appUp_one/products/blend.dart';
import 'package:appUp_one/products/bowl.dart';
import 'package:appUp_one/products/cap.dart';
import 'package:appUp_one/products/cat1.dart';
import 'package:appUp_one/products/cat2.dart';
import 'package:appUp_one/products/cb.dart';
import 'package:appUp_one/products/collar.dart';
import 'package:appUp_one/products/food.dart';
import 'package:appUp_one/products/gun.dart';
import 'package:appUp_one/products/jeans.dart';
import 'package:appUp_one/products/moto1.dart';
import 'package:appUp_one/products/motog8.dart';
import 'package:appUp_one/products/mouse.dart';
import 'package:appUp_one/products/nokia.dart';
import 'package:appUp_one/products/pen.dart';
import 'package:appUp_one/products/pridor.dart';
import 'package:appUp_one/products/redmi.dart';
import 'package:appUp_one/products/ref.dart';
import 'package:appUp_one/products/sham.dart';
import 'package:appUp_one/products/shirt.dart';
import 'package:appUp_one/products/shoes.dart';
import 'package:appUp_one/products/socks.dart';
import 'package:appUp_one/products/suit.dart';
import 'package:appUp_one/products/tv.dart';
import 'package:appUp_one/products/vac.dart';
import 'package:appUp_one/products/washing.dart';
import 'package:appUp_one/products/watch.dart';
import 'package:appUp_one/products/xz1.dart';
import 'package:appUp_one/products/xz3.dart';
import 'package:appUp_one/products/ybr.dart';
import 'package:appUp_one/products/ybrg.dart';
import 'package:appUp_one/products/zxm.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {

@override
State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
		actions: [
		IconButton(
			onPressed: () {
			// method to show the search bar
			showSearch(
				context: context,
				// delegate to customize the search bar
				delegate: CustomSearchDelegate()
			);
			},
			icon: const Icon(Icons.search_sharp, size: 35 , color: Colors.black,)
		)
		],
	),
	);
}
}
class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Yamaha YBR",
    "Yamaha YBR G",
    "Honda Pridor",
    "Honda CB 150F",
    "SP Archi 150",
    "Zxmco Cruise 200",
    "Haier Inverter AC",
    "Orient LED TV",
    "Haier Refrigerator",
    "Dawlence Machine",
    "Westpoint Blender",
    "WP Vaccuum Cleaner",
    "Polo Shirt",
    "Wristwatch",
    "Shoes",
    "Denum Jeans",
    "Cap",
    "Suit",
    "Sony Xperia XZ1",
    "Moto One Power",
    "Moto G8 Plus",
    "Nokia 6.4",
    "Redmi 9A",
    "Sony Xperia XZ3"
    "Dollar Mypencil",
    "Tennis Ball",
    "Redragon Mouse",
    "Nike Socks",
    "CA Bat",
    "Artemis SR1000s"
    "Persian Cat White",
    "Perisan Cat Orange",
    "Bioline Cat Shampoo",
    "Me O Catfood",
    "Cat Collars",
    "Catfood Bowl"
  ];
     
 dynamic itemPages = [
    YBR(),
    Ybrg(),
    Pridor(),
    CB(),
    Archi(),
    ZXM(),
    AC(),
    TV(),
    Ref(),
    Washing(),
    Blend(),
    Vac(),
    Shirt(),
    Watch(),
    Shoe(),
    Jeans(),
    Cap(),
    Suit(),
    XZ1(),
    Moto1(),
    Motog8(),
    Nokia(),
    Redmi(),
    XZ3(),
    Pen(),
    Ball(),
    Mouse(),
    Socks(),
    Bat(),
    Gun(),
    Cat1(),
    Cat2(),
    Sham(),
    Food(),
    Collar(),
    Bowl(),
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear, color: Colors.black,),
      ),
    ];
  }
 

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back, color: Colors.black,),
    );
  }
 

  @override
  Widget buildResults(BuildContext context) {
    List <String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
           onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => itemPages[index]));},    
          title: Text(result),
        );
      },
    );
  }
 
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        // return ListTile(
          
        //   title: Text(result),
        // );
      },
    );
  }
}

