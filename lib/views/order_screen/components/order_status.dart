import 'package:ecommerce_store/consts/consts.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Icon(icon, color: color)
        .box
        .border(color: color)
        .roundedSM
        .padding(const EdgeInsets.all(5))
        .make(),
    trailing: SizedBox(
      height: 120,
      width: 250,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        "$title".text.color(darkFontGrey).size(18).make(),
        showDone
            ? const Icon(
                Icons.done,
                color: redColor,
              )
            : Container()
      ]),
    ),
  );
}
