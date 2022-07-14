import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Ball_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://cdn.shopify.com/s/files/1/0554/7176/7611/products/image_8e2aa6fb-c285-4476-b146-650a8d481e90_1445x.jpg?v=1642419080",
          p_price: "80",
          p_title: "Tennis Ball",
          p_total: "480",
    );
  }
}