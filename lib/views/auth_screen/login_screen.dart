import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/widget_common/app_logo_widget.dart';
import 'package:ecommerce_store/widget_common/bg_widget.dart';
import 'package:ecommerce_store/widget_common/custom_textfield.dart';
import 'package:ecommerce_store/widget_common/out_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bdWiget(
        child: Scaffold(
            body: Center(
      child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          appLogoWidget(),
          10.heightBox,
          "Dang nhap vao $appname".text.fontFamily(bold).white.size(20).make(),
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
              outButton().box.width(context.screenWidth - 50).make()
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
        ],
      ),
    )));
  }
}