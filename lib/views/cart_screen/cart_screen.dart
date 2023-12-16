import 'package:ecommerce_store/consts/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: "Giỏ hàng trống".text.fontFamily(semibold).makeCentered());
  }
}
