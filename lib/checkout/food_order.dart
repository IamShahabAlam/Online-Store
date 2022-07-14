import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Food_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://www.petcity.pk/wp-content/uploads/2019/06/me-o-tin.jpg",
          p_price: "900",
          p_title: "Me O Catfood",
          p_total: "1,300",
    );
  }
}