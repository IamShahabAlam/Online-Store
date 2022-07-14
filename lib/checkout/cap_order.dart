import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Cap_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://image.shutterstock.com/image-photo/baseball-cap-isolated-on-white-260nw-610601909.jpg",
          p_price: "450",
          p_title: "Cap",
          p_total: "950",
    );
  }
}