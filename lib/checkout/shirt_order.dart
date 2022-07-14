import 'package:appUp_one/components/mycart.dart';
import 'package:flutter/material.dart';

class Shirt_Order extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {

    return Order(
          p_link: "https://cdn.edenrobe.com/media/catalog/product/cache/4fa8627ad3552d906aaca1ac84f49d9c/0/n/0n9a2777-emtps22-020.jpg",
          p_price: "900",
          p_title: "Polo Shirt",
          p_total: "1,300",
    );
  }
}