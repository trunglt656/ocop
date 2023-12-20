import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/controllers/auth_controller.dart';
import 'package:ecommerce_store/views/auth_screen/login_screen.dart';
import 'package:ecommerce_store/views/profile_screen/components/details.dart';
import 'package:ecommerce_store/views/profile_screen/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.purple.shade100,
          child: Column(
            children: [
              // Sửa đổi button
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                  )).onTap(() {
                Get.to(() => EditProfileScreen());
              }),
              // Thông tin người dùng
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imgProfile2, width: 130, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Trung Tran".text.fontFamily(semibold).white.make(),
                      5.heightBox,
                      "trungtranbp@gmail.com"
                          .text
                          .fontFamily(semibold)
                          .white
                          .make(),
                    ],
                  )),
                  OutlinedButton(
                      // Logout Button
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: whiteColor)),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethosd(context);
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
                      count: "00 ",
                      title: "Trong giỏ hàng",
                      width: context.screenWidth / 3.5),
                  detailsCart(
                      count: "00 ",
                      title: "Trong danh sách yêu thích",
                      width: context.screenWidth / 3.5),
                  detailsCart(
                      count: "00 ",
                      title: "Đơn hàng của tôi",
                      width: context.screenWidth / 3.5),
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
                          leading: Image.asset(profileButtonsicon[index],
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
                  .padding(const EdgeInsets.symmetric(horizontal: 15))
                  .make()
            ],
          )),
    ));
  }
}
