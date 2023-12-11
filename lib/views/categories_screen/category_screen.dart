import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/views/categories_screen/category_details.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bdWidget(
      child: Scaffold(
          appBar: AppBar(title: categories.text.make()),
          body: Container(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(categoriesImages[index],
                        height: 150, width: 200, fit: BoxFit.cover),
                    10.heightBox,
                    "${categoriesList[index]}"
                        .text
                        .fontFamily(semibold)
                        .align(TextAlign.center)
                        .make()
                  ],
                ).box.white.roundedSM.clip(Clip.antiAlias).make().onTap(
                  () {
                    Get.to(() => CategoryDetails(title: categoriesList[index]));
                  },
                );
              },
            ),
          )),
    );
  }
}
