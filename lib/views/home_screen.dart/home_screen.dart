import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/widget_common/home_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
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

          //slide bar
          VxSwiper.builder(
            aspectRatio: 16 / 9,
            autoPlay: true,
            height: 150,
            enlargeCenterPage: true,
            itemCount: slideList.length,
            itemBuilder: (context, index) {
              return Image.asset(slideList[index], fit: BoxFit.fitWidth)
                  .box
                  .rounded
                  .clip(Clip.antiAlias)
                  .margin(const EdgeInsets.symmetric(horizontal: 9))
                  .make();
            },
          ),
          10.heightBox,
          Row(
            children: List.generate(
                2,
                (index) => homeButtons(
                      height: context.screenHeight * 0.2,
                      width: context.screenWidth / 2.5,
                      icon: index == 0 ? icTodaysDeal : icFlashDeal,
                      title: "ttt",
                    )),
          )
        ],
      )),
    );
  }
}
