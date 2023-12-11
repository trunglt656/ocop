import 'package:ecommerce_store/consts/consts.dart';
import 'package:flutter/material.dart';

//trang chi tiết sản phẩm
class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(title: title!.text.color(darkFontGrey).make(), actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ]),
        body: Container());
  }
}
