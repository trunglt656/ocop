import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/views/dashboard/embed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
            child: Column(children: [
          Container(
            height: 50,
            color: whiteColor,
            child: TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                fillColor: whiteColor,
                filled: true,
                hintText: search,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const MyWebView());
              },
              child: const Text("DashBoard"),
            ),
          )
        ])));
  }
}
