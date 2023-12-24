import 'package:ecommerce_store/consts/consts.dart';

Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          "$title1 ".text.fontFamily(semibold).size(15).make(),
          "$d1".text.color(redColor).size(15).make(),
        ],
      ),
      Column(
        children: [
          "$title2".text.size(15).fontFamily(semibold).make(),
          "$d2".text.size(15).color(redColor).make(),
        ],
      ),
    ],
  );
}
