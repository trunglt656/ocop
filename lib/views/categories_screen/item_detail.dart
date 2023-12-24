import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/controllers/product_controller.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:get/get.dart';

//trang chi tiết sản phẩm
class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({super.key, this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    // ignore: deprecated_member_use
    return WillPopScope(
      // reset so luong sp
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  controller.resetValues();
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: title!.text.color(darkFontGrey).make(),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
              ]),
          body: Column(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        itemCount: data['p_imgs'].length,
                        itemBuilder: (context, index) {
                          //Hình ảnh sản phẩm
                          return Image.network(
                            data["p_imgs"][index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }).box.make(),
                    10.heightBox,
                    // Thông tin sản phẩm
                    title!.text
                        .size(20)
                        .color(Colors.black)
                        .fontFamily(bold)
                        .make(),
                    10.heightBox,
                    //Đánh  giá sao
                    VxRating(
                        isSelectable: false,
                        value: double.parse(data['p_rating']),
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        maxRating: 5,
                        size: 25),
                    10.heightBox,
                    "${data['p_price']}"
                        .numCurrencyWithLocale(locale: "vi-VN") // data money
                        .text
                        .color(redColor)
                        .fontFamily(semibold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Liên hệ người bán"
                                  .text
                                  .fontFamily(semibold)
                                  .size(18)
                                  .color(Colors.grey.shade600)
                                  .make(),
                              5.heightBox,
                              "${data['p_seller']}"
                                  .text
                                  .fontFamily(semibold)
                                  .size(18)
                                  .make()
                            ],
                          ),
                        )),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.message_rounded, color: darkFontGrey),
                        )
                      ],
                    )
                        .box
                        .height(75)
                        .padding(const EdgeInsets.symmetric(horizontal: 9))
                        .color(Colors.grey.shade300)
                        .make(),

                    20.heightBox,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //     SizedBox(width: 100, child: "Màu sắc: ".text.make()),
                          //     Row(
                          //         children: List.generate(
                          //             3,
                          //             (index) => VxBox()
                          //                 .size(40, 40)
                          //                 .roundedFull
                          //                 .margin(const EdgeInsets.symmetric(
                          //                     horizontal: 4))
                          //                 .color(Vx.randomPrimaryColor)
                          //                 .make()))
                          //   ],
                          // ).box.padding(const EdgeInsets.all(8)).make(),

                          //Them hoac bot So luong san pham

                          Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: "Số lượng sản phẩm: ".text.make()),
                              Obx(
                                () => Row(children: [
                                  IconButton(
                                    //giam Sl sp
                                    onPressed: () {
                                      controller.decreaseQuantity();
                                      controller.caculateTotalPrice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  controller.quantity.value.text
                                      .size(10)
                                      .color(darkFontGrey)
                                      .fontFamily(semibold)
                                      .make(),
                                  IconButton(
                                    // tang sl sp
                                    onPressed: () {
                                      controller.increaseQuantity(
                                          int.parse(data['p_quantity']));
                                      controller.caculateTotalPrice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                  "Còn ${data['p_quantity']} sản phẩm" // so san phan con lai
                                      .text
                                      .color(textfieldGrey)
                                      .fontFamily(semibold)
                                      .make(),
                                ]),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          //Giá tiền
                          Obx(
                            () => Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    child: "Giá tiền: ".text.make()),
                                "${controller.totalPrice.value}"
                                    .numCurrencyWithLocale(locale: 'vi-VN')
                                    .text
                                    .color(redColor)
                                    .size(15)
                                    .fontFamily(semibold)
                                    .make(),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                          ),
                        ]).box.white.shadowSm.make(),
                    //Mô tả chi tiết về sản phẩm
                    10.heightBox,
                    "Chi tiết về sản phẩm "
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .size(18)
                        .make(),

                    10.heightBox,
                    "${data['p_desc']}"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .size(22)
                        .make(),

                    //Button
                    ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                            itemDetailButtonList.length,
                            (index) => ListTile(
                                title: itemDetailButtonList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward)))),
                    20.heightBox,
                    //Sản phẩm liên quan
                    productsyoumaylike.text
                        .fontFamily(semibold)
                        .size(18)
                        .make(),

                    10.heightBox,
                    // Các sản phẩm liên quan
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          6,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP4h,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              "Ocop products".text.fontFamily(semibold).make(),
                              10.heightBox,
                              "100.000 VND"
                                  .text
                                  .fontFamily(semibold)
                                  .color(redColor)
                                  .make(),
                            ],
                          )
                              .box
                              .white
                              .margin(const EdgeInsets.all(5))
                              .roundedSM
                              .padding(const EdgeInsets.all(12))
                              .make(),
                        ),
                      ),
                    ),
                  ], //end body
                )),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ourButton(
                  color: redColor,
                  onPress: () {
                    controller.addToCart(
                      context: context,
                      // vendorID: data['vendor_id'],
                      img: data['p_imgs'][0],
                      qty: controller.quantity.value,
                      sellername: data['p_seller'],
                      title: data['p_name'],
                      tprice: controller.totalPrice.value,
                    );

                    VxToast.show(context, msg: "Đã thêm vào giỏ hàng");
                  },
                  textColor: whiteColor,
                  title: "Thêm Vào Giỏ Hàng"),
            )
          ])),
    );
  }
}
