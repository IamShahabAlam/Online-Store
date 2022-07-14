

import 'package:appUp_one/components/constants.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pimp_my_button/pimp_my_button.dart';

class Profile extends StatefulWidget {
 @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // Rating
  double _rating;
  double _initialRating = 3.0;

  // Feedback
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

    return Scaffold( backgroundColor: Colors.grey[300],
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(child: Text("PROFILE TO BE SET......", textAlign: TextAlign.center,)),
              ),

// Rating
              RatingBar.builder(
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
              Icons.star,
              color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
              ),

              SizedBox(height: 20.0),
              Text(
                'Rating: $_rating',
                style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0),
              ),

// Feedback
              SingleChildScrollView(
                child: Container(
                  height: _h*0.4,
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

              SizedBox(height: 50,),


// Favorite Button
              PimpedButton(
                particle: DemoParticle(),
                pimpedWidgetBuilder: (context, controller) {
                  return TextButton(style:  ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                    onPressed: () {
                      controller.forward(from: 0.0);
                    } ,
                    child: FavoriteButton(
                      iconSize: 40.0,
                      valueChanged: (_isFavorite) {
                        print('Is Favorite $_isFavorite)');

                      },
                    ),
                  );
                },
              ),

              SizedBox(height: 50,),

              FavoriteButton(
                iconSize: 40.0,

                valueChanged: (_isFavorite) {
                  print('Is Favorite $_isFavorite)');

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
