import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Shoes_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?cs=srgb&dl=pexels-pixabay-267301.jpg&fm=jpg",
          p_price: "1,200",
          p_title: "Casual Shoes",
          p_total: "1,600",
    );
  }
}