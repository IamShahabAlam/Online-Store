import 'package:appUp_one/components/constants.dart';
import 'package:appUp_one/components/navBar.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {

  // Rating
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double _rating;

  double _initialRating = 3.0;

  final formKey = GlobalKey<FormState>();

  final TextEditingController commentController = TextEditingController();

  List filedata = [

  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  // padding: EdgeInsets.all(5.0),
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(data[i]['pic'] + "$i") ,backgroundColor: Colors.green, ),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
              ),
              subtitle: Text(data[i]['message'],style: TextStyle(fontSize: 13.0),),
            ),
          )
      ],
    );
  }

  @override

  // Rating
  void initState() {
    super.initState();
    _rating = _initialRating;
  }

  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ButtCheek(
                  height: 30,
                  child: Image.asset("assets/cover.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,),
                ),

                Positioned( top: 60, left: _w*0.38 ,
                    child: Container( height: 100.0, width: 100.0,
                        child: Image.asset("assets/logo.png" , fit: BoxFit.contain,))),

                Positioned( top: 30.0 , left: 10.0,
                  child: Container(height: 50, width: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: CircleBorder()
                        ),
                        onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => BNB(), ));},
                        child: Icon(Icons.arrow_back_ios, size: 28.0, color: kBMRactiveCardColor,)),
                  ),
                ),


              ],
            ),
// =============================================================================================

            Container( margin: EdgeInsets.symmetric(vertical: 20.0),
                child:
                Text("RATING", style: TextStyle(fontSize: 30, color: kBMRactiveCardColor, fontWeight: FontWeight.bold),)),

// Rating
            RatingBar.builder(
              itemSize: 30.0,
              updateOnDrag: true,
              glowColor: Colors.yellow,
              glowRadius: 0.05,
              initialRating: _initialRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star, size: 15.0,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),

            SizedBox(height: 10.0),
            Text(
              'Rating: $_rating',
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0),
            ),



// =============================================================================================


            Container( margin: EdgeInsets.symmetric(vertical: 20.0),
                child:
                Text("FEEDBACK", style: TextStyle(fontSize: 30, color: kBMRactiveCardColor, fontWeight: FontWeight.bold),)),


// Feedback
            SingleChildScrollView(
              child: Container(
                height: _h*0.3,
                width: _w*1,
                child: CommentBox(
                  userImage:
                  "https://e7.pngegg.com/pngimages/726/872/png-clipart-shopping-cart-with-food-products-illustration-shopping-cart-objects-shopping-carts.png" ,
                  child: commentChild(filedata),
                  labelText: 'Give a Feedback...',
                  withBorder: false,
                  errorText: 'Feedback cannot be blank',
                  sendButtonMethod: () {
                    if (formKey.currentState.validate()) {
                      print(commentController.text);
                      setState(() {
                        var value = {
                          'name': 'User',
                          'pic':
                          'https://e7.pngegg.com/pngimages/726/872/png-clipart-shopping-cart-with-food-products-illustration-shopping-cart-objects-shopping-carts.png',
                          'message': commentController.text
                        };
                        filedata.insert(0, value);
                      });
                      commentController.clear();
                      FocusScope.of(context).unfocus();
                    } else {
                      print("Not validated");
                    }
                  },
                  formKey: formKey,
                  commentController: commentController,
                  backgroundColor: kactiveCardColor.withOpacity(0.3),
                  textColor: Colors.black,
                  sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
