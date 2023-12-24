import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/cart_controller.dart';
import 'package:ecommerce_store/services/firestore_services.dart';
import 'package:ecommerce_store/views/cart_screen/shipping_screen.dart';
import 'package:ecommerce_store/widget_common/loading_indicator.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());

    return Scaffold(
        bottomNavigationBar: ourButton(
            color: redColor,
            onPress: () {
              Get.to(() => const ShippingDetails());
            },
            textColor: whiteColor,
            title: "Thanh toán"),
        backgroundColor: whiteColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: 'Giỏ hàng'
                .text
                .color(darkFontGrey)
                .fontFamily(semibold)
                .make()),
        body: StreamBuilder(
            stream: FirestoreServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                //check dk
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: "Giỏ hàng trống".text.color(darkFontGrey).make(),
                );
              } else {
                // controller
                var data = snapshot.data!.docs;
                controller.calculate(data);
                controller.productSnapshot = data;
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              //listview show sp
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: Image.network(
                                      "${data[index]["img"]}",
                                      width: 120,
                                      fit: BoxFit.fill),
                                  title:
                                      "${data[index]['title']} (x${data[index]['qty']})"
                                          .text
                                          .fontFamily(semibold)
                                          .size(16)
                                          .make(),
                                  subtitle: "${data[index]["tprice"]}"
                                      .numCurrencyWithLocale(locale: "vi-VN")
                                      .text
                                      .color(redColor)
                                      .fontFamily(semibold)
                                      .make(),
                                  trailing: const Icon(
                                    Icons.delete, // xóa sp
                                    color: redColor,
                                  ).onTap(() {
                                    FirestoreServices.deleteDocument(
                                        data[index].id);
                                  }),
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Thành Tiền"
                                .text
                                .color(darkFontGrey)
                                .size(20)
                                .make(),
                            Obx(
                              () => "${controller.totalP.value}"
                                  .numCurrencyWithLocale(locale: "vi-Vn")
                                  .text
                                  .color(darkFontGrey)
                                  .size(20)
                                  .make(),
                            )
                          ],
                        ).box.padding(EdgeInsets.all(12)).make(),
                        // SizedBox(
                        //     width: context.screenWidth - 60,
                        //     child: ourButton(
                        //         color: redColor,
                        //         onPress: () {},
                        //         textColor: whiteColor,
                        //         title: "Thanh toán"))
                      ],
                    ));
              }
            }));
  }
}
