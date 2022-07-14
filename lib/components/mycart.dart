import 'package:appUp_one/screens/last.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {

  Order({ this.p_link, this.p_title, this.p_price, this.p_total  });
  
  final String p_link, p_title, p_price, p_total;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {

  final _h = MediaQuery.of(context).size.height;
  final _w = MediaQuery.of(context).size.width;


//================================Appbar====================================================

    return Scaffold(
      backgroundColor: Color(0xffedf0ee),
       appBar: AppBar(
        centerTitle: true,
          backgroundColor: Colors.green,
          brightness: Brightness.dark,
          elevation: 10,

          title:     
              Text(            
            "My Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),),

//=================================First=box===================================================

        body: Stack(
          children: [
            Container(
            width: double.infinity
          ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                height: _h * 0.28,
                width: _w * 0.96,
               
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(25.0),
                
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: 3,
        blurRadius: 8,
        offset: Offset(0,5), // changes position of shadow
      ),
    ],     ),
                
              ),
            ),
//====================================================================================

       Positioned(
       bottom: 387,
       left: 20,
            child: ClipRRect(      
  borderRadius: BorderRadius.circular(20), // Image border
  child: SizedBox.fromSize(
    size: Size.fromRadius(75), // Image radius
    child: Image.network(widget.p_link,
     fit: BoxFit.cover)  , ),
      )      ),

//====================================================================================

  Positioned(
        bottom: 520,
        right: 147,
        child: 
      Container(
        child: Text("Product", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
      )),

//==============================================================================================
  Positioned(
        bottom: 465,
        left: _w*0.5,
        child: 
      Container(
        child: Text(widget.p_title , textAlign: TextAlign.left ,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black87),),
      )),

//====================================================================================

    Positioned(
        bottom: 430,
        right: 71,
        child: 
      Container(
        child: Text("Rs. ${widget.p_price}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.green),),
      )),

//====================================Second=box================================================

            Positioned(
              top: 200,
              left: 8,
              child: Container(
                height: _h * 0.35,
                width: _w * 0.96,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(25.0),
                
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 8,
        offset: Offset(0,5), // changes position of shadow
      ),
    ],     ),
              ),
            ),


//====================================================================================

  Positioned(
        bottom: 325,
        right: 120,
        child: 
      Container(
        child: Text("Order Summary", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
      )),

//==============================================================================================

 Container(
  margin: EdgeInsets.only(left: 30),
   child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
      SizedBox(height: _h*0.405),
        Text("Order",textAlign:TextAlign.left ,style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
        Text("Delivery", textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
        Text("Taxes", textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
        SizedBox(height: _h*0.05),
        Text("Total", textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),),
       
     ],
   ),
 ),


//====================================================================================

 Container(
  margin: EdgeInsets.only(left: 240),
   child: Column( crossAxisAlignment: CrossAxisAlignment.end,
     children: [
      SizedBox(height: _h*0.403),
        Text("Rs. ${widget.p_price}",textAlign:TextAlign.left ,style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
        Text("Rs. 400", textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
        Text("Rs. 00", textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black54),),
        SizedBox(height: _h*0.05),
        Text("Rs. ${widget.p_total}", textAlign:TextAlign.left, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black),),
       
     ],
   ),
 ),

//====================================================================================

 Positioned(
  left: 20,
  bottom: 170,
   child: Container(
    height: _h * 0.003,
    width: _w*0.90,
    color: Colors.grey,

   ),
 ),

//====================================================================================

Positioned(
        bottom: 50,
        right: 75,
        child: 
      Container(
        height: 43,
         child: ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Last()));},
                  child: Text("Buy Now", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  ),
                ),
      )),


//====================================================================================


          ],
       
         ),
    );
  }
}