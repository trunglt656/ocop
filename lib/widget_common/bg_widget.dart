import 'package:ecommerce_store/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bdWiget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.fill)),
    child: child,
  );
}
