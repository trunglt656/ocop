import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/product_controller.dart';
import 'package:ecommerce_store/services/firestore_services.dart';
import 'package:ecommerce_store/views/categories_screen/item_detail.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:ecommerce_store/widget_common/loading_indicator.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return bdWidget(
      child: Scaffold(
          appBar: AppBar(title: title!.text.fontFamily(semibold).white.make()),
          body: StreamBuilder(
              stream: FirestoreServices.getProducts(title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: loadingIndicator(),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: "Không tìm thấy sản phẩm"
                        .text
                        .color(darkFontGrey)
                        .make(),
                  );
                } else {
                  var data = snapshot.data!.docs;

                  return Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List.generate(
                                    controller.subcat.length,
                                    (index) => "${controller.subcat[index]}"
                                        .text
                                        .fontFamily(semibold)
                                        .makeCentered()
                                        .box
                                        .white
                                        .roundedSM
                                        .size(150, 60)
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .make())),
                          ),
                          20.heightBox,

                          //item
                          Expanded(
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 250,
                                        mainAxisSpacing: 8),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        data[index]["p_imgs"][0],
                                        height: 170,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ).box.make(),
                                      10.heightBox,
                                      const Spacer(),
                                      "${data[index]['p_name']}"
                                          .text
                                          .fontFamily(semibold)
                                          .make(),
                                      10.heightBox,
                                      "${data[index]['p_price']}"
                                          .numCurrencyWithLocale(
                                              locale: "vi-VN")
                                          .text
                                          .fontFamily(semibold)
                                          .color(redColor)
                                          .make(),
                                    ],
                                  )
                                      .box
                                      .white
                                      .roundedSM
                                      .margin(const EdgeInsets.all(4))
                                      .make()
                                      .onTap(() {
                                    Get.to(() => ItemDetails(
                                        //đến trang thông tin chi tiết sản phẩm
                                        title: "${data[index]['p_name']}",
                                        data: data[index]));
                                  });
                                }),
                          ),
                        ]),
                  );
                }
              })),
    );
  }
}
