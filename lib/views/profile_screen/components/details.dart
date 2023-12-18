import "package:ecommerce_store/consts/consts.dart";
import "package:flutter/material.dart";

// Widget tạo box hiển thị trang thái
Widget detailsCart({width, String? count, String? title}) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    "00".text.color(darkFontGrey).size(18).fontFamily(bold).make(),
    5.heightBox,
    title!.text.color(darkFontGrey).center.make()
  ])
      .box
      .white
      .rounded
      .height(80)
      .width(width)
      .padding(const EdgeInsets.all(4))
      .make();
}
