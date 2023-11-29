import "package:ecommerce_store/consts/consts.dart";
import "package:flutter/material.dart";

Widget homeButtons({width, height, icon, title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icTodaysDeal,
        width: 26,
      ),
      5.heightBox,
      icTodaysDeal.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).make();
}
