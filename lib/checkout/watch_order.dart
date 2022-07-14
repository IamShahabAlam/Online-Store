import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Watch_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://images.pexels.com/photos/280250/pexels-photo-280250.jpeg?cs=srgb&dl=pexels-pixabay-280250.jpg&fm=jpg",
          p_price: "1,400",
          p_title: "Wristwatch",
          p_total: "1,800",
    );
  }
}