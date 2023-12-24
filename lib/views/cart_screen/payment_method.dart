import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/controllers/cart_controller.dart';
import 'package:ecommerce_store/views/home_screen/home.dart';
import 'package:ecommerce_store/widget_common/loading_indicator.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Obx(
      () => Scaffold(
          backgroundColor: whiteColor,
          bottomNavigationBar: SizedBox(
            height: 60,
            child: controller.placingOrder.value
                ? Center(
                    child: loadingIndicator(),
                  )
                : ourButton(
                    onPress: () async {
                      await controller.placeMyOrder(
                          orderPaymentMethod:
                              paymentMethod[controller.paymentIndex.value],
                          totalAmount: controller.totalP.value);
                      await controller.clearCart();
                      VxToast.show(context, msg: "Đặt hàng thành công");
                      
                      Get.offAll(const Home());
                    },
                    color: redColor,
                    textColor: whiteColor,
                    title: "Đặt hàng"),
          ),
          appBar: AppBar(
            title: 'Chọn phương thức thanh toán'
                .text
                .fontFamily(semibold)
                .color(darkFontGrey)
                .make(),
          ),
          body: Obx(
            () => Column(
              children: List.generate(paymentMethodList.length, (index) {
                return GestureDetector(
                  // select paymentMethod
                  onTap: () {
                    controller.changePaymentMethod(index);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: controller.paymentIndex.value == index
                                ? redColor
                                : Colors.transparent,
                            width: 2)),
                    margin: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Image.asset(paymentMethodList[index],
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover),
                        controller.paymentIndex.value ==
                                index //toan tu 3 ngoi select paymentmethod
                            ? Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                value: true,
                                onChanged: (value) {})
                            : Container(),
                        paymentMethod[index].text.make()
                      ],
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }
}
