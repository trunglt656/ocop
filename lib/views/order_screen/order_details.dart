import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/views/order_screen/components/order_place_details.dart';
import 'package:ecommerce_store/views/order_screen/components/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: "Chi tiểt đơn hàng".text.fontFamily(semibold).make(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              orderStatus(
                  color: Colors.blue,
                  icon: Icons.shopping_cart,
                  title: "Đã đặt hàng",
                  showDone: data['order_place']),
              orderStatus(
                  color: Colors.orange,
                  icon: Icons.check_circle,
                  title: "Đã xác nhận đơn hàng",
                  showDone: data['order_confirm']),
              orderStatus(
                  color: Colors.yellow,
                  icon: Icons.local_shipping,
                  title: "Đang giao hàng",
                  showDone: data['order_on_deliver']),
              orderStatus(
                  color: Colors.green,
                  icon: Icons.done_all,
                  title: "Đã đã giao hàng",
                  showDone: data['order_deliver']),
              const Divider(),
              10.heightBox,
              orderPlaceDetails(
                d1: data['order_code'],
                d2: data['shipping_method'],
                title1: "Mã Đơn hàng",
                title2: "Phương thức giao hàng",
              ), // chi tiet don hang

              20.heightBox,
              orderPlaceDetails(
                d1: intl.DateFormat()
                    .add_yMd()
                    .format((data['order_day'].toDate())),
                d2: data['payment_method'],
                title1: "Ngày đặt hàng",
                title2: "Phương thức thanh toán",
              ),
              20.heightBox,
              orderPlaceDetails(
                d1: data['order_status'],
                d2: data['order_by_phone'],
                title1: "Trạng thái đơn hàng",
                title2: "Số điện thoại người nhận",
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Địa chỉ người nhận: ".text.fontFamily(semibold).make(),
                      10.heightBox,
                      "${data['order_by_name']}".text.make(),
                      10.heightBox,
                      "${data['order_by_email']}".text.make(),
                      10.heightBox,
                      "${data['order_by_address']}".text.make(),
                      10.heightBox,
                      "${data['order_status']}".text.make(),
                      10.heightBox,
                      "${data['order_by_phone']}".text.make(),
                    ],
                  ),
                  Column(
                    children: [
                      "Tổng số tiền thanh toán".text.fontFamily(bold).make(),
                      "${data['total_amount']}"
                          .numCurrencyWithLocale(locale: 'vi-VN')
                          .text
                          .color(redColor)
                          .size(25)
                          .make()
                    ],
                  )
                ],
              ).box.outerShadowMd.white.make(),
              const Divider(),
              10.heightBox,
              ListView(
                shrinkWrap: true,
                children: List.generate(data['orders'].length, (index) {
                  return orderPlaceDetails(
                      title1: data['orders'][index]['title'],
                      title2: data['orders'][index]['tprice'],
                      d1: "${data['orders'][index]['qty']}x",
                      d2: "Hoàn trả nếu không như mô tả");
                }),
              )
            ],
          ),
        ));
  }
}
