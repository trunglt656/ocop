import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/services/firestore_services.dart';
import 'package:ecommerce_store/views/order_screen/order_details.dart';
import 'package:ecommerce_store/widget_common/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(title: "Đơn hàng của tôi".text.make()),
        body: StreamBuilder(
            stream: FirestoreServices.getAllOrders(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: loadingIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return "Bạn không có đơn hàng nào"
                    .text
                    .color(darkFontGrey)
                    .makeCentered();
              } else {
                var data = snapshot.data!.docs;

                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: "${index + 1}"
                            .text
                            .fontFamily(bold)
                            .color(darkFontGrey)
                            .xl
                            .make(),
                        title: data[index]['order_code']
                            .toString()
                            .text
                            .color(redColor)
                            .fontFamily(semibold)
                            .make(),
                        subtitle: data[index]['total_amount']
                            .toString()
                            .numCurrencyWithLocale(locale: 'vi-VN')
                            .text
                            .fontFamily(semibold)
                            .make(),
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            Get.to(() => OrdersDetails(
                                  // thong tin don hang
                                  data: data[index],
                                ));
                          },
                        ),
                      );
                    });
              }
            }));
  }
}
