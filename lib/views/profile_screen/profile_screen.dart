import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/controllers/auth_controller.dart';
import 'package:ecommerce_store/controllers/profile_controller.dart';
import 'package:ecommerce_store/services/firestore_services.dart';
import 'package:ecommerce_store/views/auth_screen/login_screen.dart';
import 'package:ecommerce_store/views/order_screen/order_screen.dart';
import 'package:ecommerce_store/views/profile_screen/components/details_cart.dart';
import 'package:ecommerce_store/views/profile_screen/edit_profile.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
        body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor)));
              } else {
                var data = snapshot.data!.docs[0];
                return SafeArea(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.purple.shade100,
                      child: Column(
                        children: [
                          // Sửa đổi button
                          const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.edit, //edit profile
                                color: Colors.black,
                              )).onTap(() {
                            controller.nameController.text = data['name'];

                            Get.to(() => EditProfileScreen(data: data));
                          }),
                          // Thông tin người dùng
                          Row(
                            children: [
                              data['imageUrl'] == ''
                                  ? Image.asset(imgProfile2,
                                          width: 100, fit: BoxFit.cover)
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(data['imageUrl'],
                                          width: 100, fit: BoxFit.cover)
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              10.widthBox,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}"
                                      .text
                                      .fontFamily(semibold)
                                      .white
                                      .make(),
                                  5.heightBox,
                                  "${data['email']}"
                                      .text
                                      .fontFamily(semibold)
                                      .white
                                      .make(),
                                ],
                              )),
                              OutlinedButton(
                                  // Logout Button
                                  style: OutlinedButton.styleFrom(
                                      side:
                                          const BorderSide(color: whiteColor)),
                                  onPressed: () async {
                                    await Get.put(AuthController())
                                        .signoutMethosd(context);
                                    Get.offAll(() => const LoginScreen());
                                  },
                                  child: logout.text.make())
                            ],
                          ),

                          40.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              detailsCart(
                                  count: data['cart_count'],
                                  title: "Trong giỏ hàng",
                                  width: context.screenWidth / 3.5),
                              detailsCart(
                                  count: data['wishlist_count'],
                                  title: "Trong danh sách yêu thích",
                                  width: context.screenWidth / 3.5),
                              detailsCart(
                                      count: data["order_count"],
                                      title: "Đơn hàng của tôi",
                                      width: context.screenWidth / 3.5)
                                  .onTap(() {
                                Get.to(() => const OrdersScreen());
                              }),
                            ],
                          ),
                          // Text đơn hàng của tôi,....
                          10.heightBox,
                          ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return const Divider(color: lightGrey);
                                  },
                                  itemCount: profileButtonsList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      leading: Image.asset(
                                          profileButtonsicon[index],
                                          width: 22), //Icons
                                      title: profileButtonsList[index]
                                          .text
                                          .fontFamily(semibold)
                                          .make(), //Text
                                    );
                                  })
                              .box
                              .rounded
                              .shadowSm
                              .purple100
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 15))
                              .make()
                        ],
                      )),
                );
              }
            }));
  }
}
