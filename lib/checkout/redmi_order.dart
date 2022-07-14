import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Redmi_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2wz7N2Zelot2NcyYJ9wHI9atHUIXA7zgYJw&usqp=CAU",
          p_price: "20,000",
          p_title: "Redmi 9A",
          p_total: "20,400",
    );
  }
}