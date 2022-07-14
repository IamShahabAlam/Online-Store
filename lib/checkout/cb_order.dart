import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class CB_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://motorcycleshop.pk/img/cms/360-Red-20-1.png",
          p_price: "275,000",
          p_title: "Honda CB 150F",
          p_total: "275,400",
    );
  }
}