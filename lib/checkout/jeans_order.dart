import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Jeans_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://thumbs.dreamstime.com/b/blue-jeans-isolated-white-34440719.jpg",
          p_price: "1,199",
          p_title: "Denum Jeans",
          p_total: "1,599",
    );
  }
}