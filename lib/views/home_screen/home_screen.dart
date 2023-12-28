import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/controllers/home_controllers.dart';
import 'package:ecommerce_store/services/firestore_services.dart';
import 'package:ecommerce_store/views/categories_screen/item_detail.dart';
import 'package:ecommerce_store/views/home_screen/featured_button.dart';
import 'package:ecommerce_store/views/home_screen/search_screen.dart';
import 'package:ecommerce_store/widget_common/home_button.dart';
import 'package:ecommerce_store/widget_common/loading_indicator.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              color: whiteColor,
              child: TextFormField(
                // thanh tim kiem
                controller: controller.searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search).onTap(() {
                    if (controller.searchController.text.isNotEmptyAndNotNull) {
                      Get.to(() => SearchScreen(
                            title: controller.searchController.text,
                          ));
                    }
                  }),
                  fillColor: whiteColor,
                  filled: true,
                  hintText: search,
                ),
              ).box.outerShadowSm.make(),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Slide bar 1
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 170,
                      itemCount: slideList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slideList[index],
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 9))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButtons(
                          width: context.screenWidth / 2.5,
                          height: context.screenHeight * 0.15,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todaysDeal : flashSale,
                        ),
                      ),
                    ),
                    10.heightBox,

                    // Slide bar 2
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 170,
                      itemCount: slideList2.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slideList2[index],
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 9))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => homeButtons(
                          width: context.screenWidth / 3.5,
                          height: context.screenHeight * 0.15,
                          icon: index == 0
                              ? icTopCategories
                              : index == 1
                                  ? icBrands
                                  : icTopSeller,
                          title: index == 0
                              ? topCategories
                              : index == 1
                                  ? brands
                                  : topSeller,
                        ),
                      ),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCate.text // san pham dac sac
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              featuredButton(
                                icon: featuredList1[index],
                                title: freaturedTitles1[index],
                              ),
                              10.heightBox,
                              // featuredButton(
                              //   icon: featuredList2[index],
                              //   title: freaturedTitles2[index],
                              // ),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),

                    // Featured Products
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProducts.text.white
                              .fontFamily(semibold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: FutureBuilder(
                                future: FirestoreServices.getFeaturedProducts(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(child: loadingIndicator());
                                  } else if (snapshot.data!.docs.isEmpty) {
                                    return "Không có sản phẩm đặc sắc"
                                        .text
                                        .makeCentered();
                                  } else {
                                    var featuredData = snapshot.data!.docs;
                                    return Row(
                                      // hien thị san pham dac sac
                                      children: List.generate(
                                        featuredData.length,
                                        (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              featuredData[index]['p_imgs'][0],
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            10.heightBox,
                                            "${featuredData[index]['p_name']}"
                                                .text
                                                .fontFamily(semibold)
                                                .make(),
                                            10.heightBox,
                                            "${featuredData[index]['p_price']}"
                                                .numCurrencyWithLocale(
                                                    locale: "vi-VN")
                                                .text
                                                .fontFamily(semibold)
                                                .color(redColor)
                                                .make()
                                                .onTap(() {
                                              Get.to(() => ItemDetails(
                                                    title:
                                                        "${featuredData[index]['p_name']}",
                                                    data: featuredData[index],
                                                  ));
                                            })
                                          ],
                                        )
                                            .box
                                            .white
                                            .margin(const EdgeInsets.all(5))
                                            .roundedSM
                                            .padding(const EdgeInsets.all(12))
                                            .make(),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,

                    // Slide bar 3
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 170,
                      itemCount: slideList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slideList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 9))
                            .make();
                      },
                    ),

                    // All Products
                    20.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 280),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP3h,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  const Spacer(),
                                  "Ocop products"
                                      .text
                                      .fontFamily(semibold)
                                      .make(),
                                  10.heightBox,
                                  "100.000 VND"
                                      .text
                                      .fontFamily(semibold)
                                      .color(redColor)
                                      .make(),
                                ],
                              ),
                            ),
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM
                            .make()
                            .onTap(() {
                          // Get.to(() => ItemDetails(
                          //       title: "${allproductsdata[index]['p_name']}",
                          //       data: allproductsdata[index],
                          //     ),
                          //     );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
