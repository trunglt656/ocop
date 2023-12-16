import 'package:ecommerce_store/consts/consts.dart';
import 'package:flutter/material.dart';

// Widget ourButton() {
//   return ElevatedButton(
//       onPressed: () {
//         Get.to(const Home());
//       },
//       child: login.text.blue500.fontFamily(bold).make());
// }

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: const EdgeInsets.all(12)),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}
