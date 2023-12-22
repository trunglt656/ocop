import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';

//thoat ưng dung (back)
Widget exitDialog() {
  return Dialog(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      "Xác nhận".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
      Divider(),
      10.heightBox,
      "Bạn chắc chắn muốn thoát".text.color(darkFontGrey).size(16).make(),
      10.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ourButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Có"),
          ourButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Không"),
        ],
      )
    ],
  ).box.color(lightGrey).roundedFull.make());
}
