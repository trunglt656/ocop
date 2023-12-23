import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/cart_controller.dart';
import 'package:ecommerce_store/views/cart_screen/payment_method.dart';
import 'package:ecommerce_store/widget_common/custom_textfield.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          title: "Thông tin thanh toán"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make()),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
            color: redColor,
            onPress: () {
              if (controller.addressController.text.length > 10) {
                Get.to(() => const PaymentMethods());
              } else {
                VxToast.show(context, msg: "Hãy điền đầy đủ thông tin");
              }
            },
            textColor: whiteColor,
            title: "Tiếp tục"),
      ),
      body: Column(
        children: [
          customTextField(
              hint: "Tên Người Nhận",
              isPass: false,
              title: "Địa chỉ",
              controller: controller.addressController),
          customTextField(
              hint: "Số điện thoại",
              isPass: false,
              title: "Điện thoại",
              controller: controller.phoneController),
          customTextField(
              hint: "Tỉnh(Thành phố)/Quân(Huyện)/Phường(Xã)",
              isPass: false,
              title: "Tỉnh/TP",
              controller: controller.cityController),
          customTextField(
              hint: "Đường/Tòa nhà",
              isPass: false,
              title: "Đường",
              controller: controller.stressController),
          customTextField(
              hint: "Thông tin bổ sung",
              isPass: false,
              title: "Bổ sung",
              controller: controller.addController),
        ],
      ),
    );
  }
}
