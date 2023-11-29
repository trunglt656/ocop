import 'package:ecommerce_store/consts/consts.dart';
import 'package:flutter/material.dart';

Widget appLogoWidget() {
  // using velcoity X here
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
