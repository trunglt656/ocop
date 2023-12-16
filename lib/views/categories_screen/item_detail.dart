import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:flutter/material.dart';

//trang chi tiết sản phẩm
class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: title!.text.color(darkFontGrey).make(), actions: [
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        //Hình ảnh sản phẩm
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
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
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      stepInt: true,
                      size: 25),
                  10.heightBox,
                  "500.000 vnd"
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
                            "Âu Hoàng".text.fontFamily(semibold).size(18).make()
                          ],
                        ),
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded, color: darkFontGrey),
                      )
                    ],
                  )
                      .box
                      .height(75)
                      .padding(const EdgeInsets.symmetric(horizontal: 9))
                      .color(Colors.grey.shade300)
                      .make(),

                  20.heightBox,
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      children: [
                        SizedBox(width: 100, child: "Màu sắc: ".text.make()),
                        Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .color(Vx.randomPrimaryColor)
                                    .make()))
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    //Them hoac bot So luong san pham

                    Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: "Số lượng sản phẩm: ".text.make()),
                        Row(children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                          "0"
                              .text
                              .size(10)
                              .color(darkFontGrey)
                              .fontFamily(semibold)
                              .make(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                          "Còn lại X sản phẩm"
                              .text
                              .color(textfieldGrey)
                              .fontFamily(semibold)
                              .make(),
                        ])
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                    //Giá tiền
                    Row(
                      children: [
                        SizedBox(width: 100, child: "Giá tiền: ".text.make()),
                        "0 Vnd"
                            .text
                            .color(redColor)
                            .size(15)
                            .fontFamily(semibold)
                            .make(),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
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
                  "Sản phẩm đạt chứng nhận Ocop ,.... lorem*75 "
                      .text
                      .color(darkFontGrey)
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
                  productsyoumaylike.text.fontFamily(semibold).size(18).make(),

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
                onPress: () {},
                textColor: whiteColor,
                title: "Thêm Vào Giỏ Hàng"
                // color: redColor,
                ),
          )
        ]));
  }
}
