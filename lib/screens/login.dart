import 'package:firebase_practice/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import 'register.dart';

class Login extends StatelessWidget {
  @override

  final TextEditingController emailController = TextEditingController(text: "test@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "qwerty");

  Widget build(BuildContext context) {

 
  void login() async { 
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String email = emailController.text;
    final String password = passwordController.text;
    

  try  { 
    final UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
    final DocumentSnapshot snapshot = await db.collection("users").doc(user.user.uid).get();
    final data = snapshot.data();

   

    print("Email :" + email);
   print("User ID:" + user.user.uid);
    print("**** User is Successfully logged In ****");
    
   Navigator.of(context).pushNamed("/home");
   }
  catch (e) {
     print("**** ERROR ****");
  }
    
  }

  final _h = MediaQuery.of(context).size.height ;
  final _w = MediaQuery.of(context).size.width ;


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent , elevation: 0.0, centerTitle: true,
        title: Text("LOG IN" , style: TextStyle( color: kactiveCardColor , fontWeight: FontWeight.bold),),
        actions: [ TextButton(onPressed: (){Navigator.pushNamed(context, "/intro");}, child: Icon(Icons.home_outlined, color: kactiveCardColor,))

        ],

      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10.0),
                  child:  Image.asset("assets/logo.png", height: _h*0.10 , width: _w*0.25, )),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20),
                alignment: Alignment.center,
                child: Text("ONLINE STORE" , style: TextStyle(fontSize: 20.0, color: kactiveCardColor , fontWeight: FontWeight.bold),),
              ),


              InputField(
                hide: false ,
                labelText: "Email",
                keyboardType: TextInputType.emailAddress ,
                prefixicon: Icons.alternate_email,
                controller: emailController ,
              ),

              SizedBox(height: _h*0.02,),

              InputField(
                controller: passwordController ,
                prefixicon: Icons.lock,
                labelText: "Password",
                hide: true,
                keyboardType: TextInputType.visiblePassword,

              ),

              Container( margin: EdgeInsets.only(right: 20.0, bottom: _h*0.05),
                  child: Text("Forgot password?" , textAlign: TextAlign.right ,style: TextStyle(color: kBMRactiveCardColor, fontSize: 18.0, fontWeight: FontWeight.bold),)),

              Container(
                margin: EdgeInsets.only(left: 20 , right: 20 ,bottom: 20.0 ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kactiveCardColor,kBMRactiveCardColor]),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [BoxShadow(blurRadius:5,color: Colors.black45, spreadRadius: 2, offset: Offset(0, 2) )]
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: login,
                    child: Text("Log In",style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.bold),)),
              ),

              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(color: Colors.grey, height: 1.0, width: _w*0.3,) ,

                  Text("or Sign in with", style: TextStyle(color: Colors.grey, fontSize: 14.0),),

                  Container(color: Colors.grey, height: 1.0, width: _w*0.3,) ,

                ],),


// GOOGLE LOGO

              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  GestureDetector(
                    onTap: () => launch("https://accounts.google.com/signin/v2/identifier?hl=en&passive=true&continue=https%3A%2F%2Fwww.google.com%2F&ec=GAZAAQ&flowName=GlifWebSignIn&flowEntry=ServiceLogin"),
                    child: Container( margin: EdgeInsets.only(top: 20, bottom: 20),
                      padding: EdgeInsets.all(5),
                      height: 60, width: 160,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [ BoxShadow(color: Colors.grey, spreadRadius: 0.5 , blurRadius: 0.5 )]

                      ),
                      child: Image.asset('assets/google.png',),
                    ),
                  ),


                  GestureDetector(
                    onTap: () => launch("https://m.facebook.com/"),
                    child: Container( margin: EdgeInsets.only(top: 20, bottom: 20),
                      padding: EdgeInsets.all(12),
                      height: 60, width: 160,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [ BoxShadow(color: Colors.grey, spreadRadius: 0.5 , blurRadius: 0.5 )]

                      ),
                      child: Image.asset('assets/fb.png',),
                    ),
                  ),
                ],
              ),

              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I don't have an account ", style:  TextStyle(color: Colors.grey, fontSize: 16),),

                  GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Register()) );},
                      child: Text("Sign Up", style: TextStyle(color: kBMRactiveCardColor,fontWeight: FontWeight.bold, fontSize: 16.0),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}

class InputField extends StatelessWidget {

  InputField({this.prefixicon, this.keyboardType,this.hide, this.controller, this.labelText});


  final IconData prefixicon;
  final TextInputType keyboardType;
  final bool hide;
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height ;
    final _w = MediaQuery.of(context).size.width ;

    return Container( height: _h*0.1, width: _w*0.67,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: hide ,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 17.0, color: kBMRactiveCardColor.withOpacity(0.4)),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(prefixicon, color: kactiveCardColor,),
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: Colors.transparent )),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: kBMRactiveCardColor))
        ),),);
  }
}


