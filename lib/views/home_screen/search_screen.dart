import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/services/firestore_services.dart';
import 'package:ecommerce_store/views/categories_screen/item_detail.dart';
import 'package:ecommerce_store/widget_common/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchScreen extends StatelessWidget {
  final String? title;
  const SearchScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(title: title!.text.color(darkFontGrey).make()),
      body: FutureBuilder(
        future: FirestoreServices.searchProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "Không tìm thấy sản".text.makeCentered();
          } else {
            var data = snapshot.data!.docs;
            var filtered = data
                .where(
                  (element) => element['p_name']
                      .toString()
                      .toLowerCase()
                      .contains(title!.toLowerCase()),
                )
                .toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 280),
                children: filtered
                    .mapIndexed(
                      (currentValue, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            filtered[index]['p_imgs'][0],
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          10.heightBox,
                          const Spacer(),
                          "${filtered[index]['p_name']}"
                              .text
                              .fontFamily(semibold)
                              .make(),
                          10.heightBox,
                          "${filtered[index]['p_price']}"
                              .numCurrencyWithLocale(locale: 'vi-Vn')
                              .text
                              .fontFamily(semibold)
                              .color(redColor)
                              .make(),
                        ],
                      )
                          .box
                          .white
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM
                          .make()
                          .onTap(() {
                        Get.to(
                          () => ItemDetails(
                            title: "${filtered[index]['p_name']}",
                            data: filtered[index],
                          ),
                        );
                      }),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
