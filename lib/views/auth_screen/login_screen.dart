import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/views/auth_screen/signup_screen.dart';
import 'package:ecommerce_store/views/home_screen/home.dart';
import 'package:ecommerce_store/widget_common/app_logo_widget.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:ecommerce_store/widget_common/custom_textfield.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bdWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.1).heightBox,
                  appLogoWidget(),
                  10.heightBox,
                  "ĐĂNG NHẬP VÀO $appname"
                      .text
                      .fontFamily(bold)
                      .white
                      .size(20)
                      .make(),
                  10.heightBox,
                  Column(
                    children: [
                      customTextField(hint: emailHint, title: email),
                      customTextField(hint: passwordHint, title: password),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetPass.text.make(),
                        ),
                      ),
                      5.heightBox,
                      ourButton(
                              color: redColor,
                              title: login,
                              textColor: whiteColor,
                              onPress: () {
                                Get.to(() => const Home()); //đăng nhập
                              })
                          .box
                          .width(context.screenWidth - 50)
                          .make()
                          .box
                          .width(context.screenWidth - 50)
                          .make() // outButton Widget để login
                      // outButton(
                      //         color: redColor,
                      //         title: login,
                      //         textColor: whiteColor,
                      //         onPress: () {})
                      //     .box
                      //     .width(context.screenWidth - 70)
                      //     .make()
                    ],
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                          color: lightGrey,
                          title: signup,
                          textColor: Colors.blue,
                          onPress: () {
                            Get.to(SignupScreen());
                          }) //đăng ký
                      .box
                      .width(context.screenWidth - 50)
                      .make()
                      .box
                      .width(context.screenWidth - 50)
                      
                      .make(),
                  10.heightBox,
                  loginWith.text.color(redColor).make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(socialIconList[index], width: 30),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
