import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/widget_common/app_logo_widget.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:ecommerce_store/widget_common/custom_textfield.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

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
                  "ĐĂNG KÝ TÀI KHOẢN $appname"
                      .text
                      .fontFamily(bold)
                      .white
                      .size(20)
                      .make(),
                  10.heightBox,
                  Column(
                    children: [
                      customTextField(hint: nameHint, title: name),
                      customTextField(hint: emailHint, title: email),
                      customTextField(
                          hint: passwordHint, title: retypePassword),
                      customTextField(hint: passwordHint, title: password),
                      Row(
                        children: [
                          Checkbox(
                            //Checkbox
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                            value: isCheck,
                            checkColor: redColor,
                          ),
                          10.widthBox,
                          Expanded(
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                text: "Tôi đồng ý với các ",
                                style: TextStyle(
                                    fontFamily: bold, color: fontGrey),
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                    fontFamily: bold, color: redColor),
                              ),
                            ])),
                          )
                        ],
                      ),
                      5.heightBox,
                      ourButton(
                              color: isCheck == true ? redColor
                               : lightGrey,
                              title: signup,
                              textColor: Colors.blue,
                              onPress: () {})
                          .box
                          .width(context.screenWidth - 50)
                          .make()
                          .box
                          .width(context.screenWidth - 50)
                          .make(),
                      10.heightBox,
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: alreadyHaveAccount,
                            style: TextStyle(
                                fontFamily: bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: login, // quay lai dang nhap
                            style: TextStyle(fontFamily: bold, color: redColor),
                          ),
                        ]),
                      ).onTap(() {
                        Get.back();
                      }),
                    ],
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).make(),
                ],
              ),
            )));
  }
}
