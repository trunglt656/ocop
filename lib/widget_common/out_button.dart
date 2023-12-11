import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget outButton() {
  return ElevatedButton(
      onPressed: () {
        Get.to(const Home());
      },
      child: login.text.blue500.fontFamily(bold).make());
}


// import 'package:ecommerce_store/consts/consts.dart';
// import 'package:flutter/material.dart';

// Widget outButton({onPress, color, textColor, title}) {
//   return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           backgroundColor: color, padding: EdgeInsets.all(12)),
//       onPressed: () {
//         onPress;
//       },
//       child: title.text.color(textColor).fontFamily(bold).make());
// }
