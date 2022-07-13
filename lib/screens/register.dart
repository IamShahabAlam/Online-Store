import 'package:appUp_one/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Register extends StatelessWidget {
  @override


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Widget build(BuildContext context) {


    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      // final FirebaseUser user = await auth.currentUser();
      final User users = auth.currentUser;
      final uid = users.uid;

      final String username = usernameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String age = ageController.text;
      final String phone = phoneController.text;
      final String address = addressController.text;

      try  {
        final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
        await db.collection("users").doc(user.user.uid).set({"Email": email, "Username": username, "Age": age , "Phone" : phone, "Address" : address,});

        print("Email :" + email);
        print("Username :" + username);
        print("Age :" + age);
        print("**** User is Successfully Registered ****");
        Navigator.of(context).pushNamed("/nav");

      }
      catch(e){
        print("**** ERROR ****");
        print(e);
      }

    }

    final _h = MediaQuery.of(context).size.height ;
    final _w = MediaQuery.of(context).size.width ;



    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.transparent , elevation: 0.0, centerTitle: true,
      leading: TextButton(onPressed: (){Navigator.pushNamed(context, "/intro");}, child: Icon(Icons.home_outlined, color: kactiveCardColor,)),
      title: Text("REGISTERATION" , style: TextStyle( color: kactiveCardColor , fontWeight: FontWeight.bold),),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.0),
                  child:  Image.asset("assets/logo.png", height: _h*0.13 , width: _w*0.29, )),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20),
                alignment: Alignment.center,
                child: Text("ONLINE STORE" , style: TextStyle( letterSpacing:  1.8 ,fontSize: 24.0, color: kactiveCardColor , fontWeight: FontWeight.bold),),
              ),


// Email
              InputField(
                hide: false ,
                labelText: "Email",
                keyboardType: TextInputType.emailAddress ,
                prefixicon: Icons.alternate_email,
                controller: emailController ,
              ),

// Username
              InputField(
                hide: false ,
                labelText: "Username",
                keyboardType: TextInputType.name ,
                prefixicon: FontAwesomeIcons.user,
                controller: usernameController ,
              ),

// Password
              InputField(
                prefixicon: Icons.lock,
                labelText: "Password",
                hide: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController ,

              ),

// Age
              InputField(
                controller: ageController ,
                prefixicon: FontAwesomeIcons.calendarDays,
                labelText: "Age",
                hide: false,
                keyboardType: TextInputType.number,

              ),


// Phone no
              InputField(
                controller: phoneController ,
                keyboardType: TextInputType.number,
                labelText: "Phone",
                hide: false,
                prefixicon: FontAwesomeIcons.phone,
              ),

 // Address
              InputField(
                controller: addressController,
                keyboardType: TextInputType.streetAddress,
                prefixicon: FontAwesomeIcons.addressBook,
                hide: false,
                labelText: "Address",
              ),



              // SizedBox(height: _h*0.02,),





              Row( mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Already have an account? ", style: TextStyle(color: Colors.grey),),
                  GestureDetector(
                    onTap:  (){Navigator.of(context).pushNamed("/login");},
                    child: Container(margin: EdgeInsets.only(right: 20.0,),
                        child: Text("Sign In" , textAlign: TextAlign.right ,style: TextStyle(color: kactiveCardColor, fontSize: 15.0, fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(left: 20 , right: 20 ,bottom: 20.0 , top: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kactiveCardColor, kBMRactiveCardColor]),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [BoxShadow(blurRadius:5,color: Colors.black45, spreadRadius: 2, offset: Offset(0, 2) )]
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: register,
                    child: Text("REGISTER",style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.bold),)),
              ),
            ],),
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

    return Container( height: _h*0.06, width: _w*0.67,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 05),
      child: TextField(
        controller: controller,
        obscureText: hide ,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 16.0, color: kBMRactiveCardColor.withOpacity(0.4) ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(prefixicon, color: kactiveCardColor, size: 18.0,),
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: Colors.transparent )),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: kBMRactiveCardColor))
        ),),);
  }
}



