import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/consts/list.dart';
import 'package:ecommerce_store/controllers/auth_controller.dart';
import 'package:ecommerce_store/views/auth_screen/signup_screen.dart';
import 'package:ecommerce_store/views/home_screen/home.dart';
import 'package:ecommerce_store/widget_common/app_logo_widget.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:ecommerce_store/widget_common/custom_textfield.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                  Obx(
                    () => Column(
                      children: [
                        // Nhập tài khoản + mật khẩu
                        customTextField(
                            hint: emailHint,
                            title: email,
                            isPass: false,
                            controller: controller.emailController),
                        customTextField(
                            hint: passwordHint,
                            title: password,
                            isPass: true,
                            controller: controller.passwordController),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () async {
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(() => const Home());
                                }
                              });
                            },
                            child: forgetPass.text.make(),
                          ),
                        ),
                        5.heightBox,
                        controller.isloading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              )
                            : ourButton(
                                    color: redColor,
                                    title: login,
                                    textColor: whiteColor,
                                    onPress: () async {
                                      controller.isloading(true);

                                      await controller
                                          .loginMethod(context: context)
                                          .then((value) {
                                        if (value != null) {
                                          VxToast.show(context, msg: loggedin);
                                          Get.offAll(
                                              () => const Home()); //đăng nhập
                                        } else {
                                          controller.isloading(false);
                                        }
                                      });
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
                    )
                        .box
                        .white
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .make(),
                  ),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                          color: lightGrey,
                          title: signup,
                          textColor: Colors.blue,
                          onPress: () {
                            Get.to(() => const SignupScreen());
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
