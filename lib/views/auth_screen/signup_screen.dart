import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/auth_controller.dart';
import 'package:ecommerce_store/views/home_screen/home.dart';
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
  var controller = Get.put(AuthController());

  //text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

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
                  Obx(
                    () => Column(
                      children: [
                        customTextField(
                            hint: nameHint,
                            title: name,
                            controller: nameController,
                            isPass: false),
                        customTextField(
                            hint: emailHint,
                            title: email,
                            controller: emailController,
                            isPass: false),
                        customTextField(
                            hint: passwordHint,
                            title: password,
                            controller: passwordController,
                            isPass: true),
                        customTextField(
                            hint: passwordHint,
                            title: retypePassword,
                            controller: passwordRetypeController,
                            isPass: true),
                        Row(
                          children: [
                            Checkbox(
                              //Checkbox ...xo
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
                        controller.isloading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              )
                            : ourButton(
                                    color:
                                        isCheck == true ? redColor : lightGrey,
                                    title: signup,
                                    textColor: Colors.blue,
                                    onPress: () async {
                                      if (isCheck != false) {
                                        controller.isloading(true);
                                        try {
                                          await controller
                                              .signupMethod(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text,
                                          )
                                              .then((value) {
                                            return controller.storeUserData(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text,
                                            );
                                          }).then((value) {
                                            VxToast.show(context,
                                                msg: loggedin);
                                            Get.offAll(() => const Home());
                                          });
                                        } catch (e) {
                                          auth.signOut();
                                          // ignore: use_build_context_synchronously
                                          VxToast.show(context,
                                              msg: e.toString());
                                          controller.isloading(false); 
                                        }
                                      }
                                    }) // check điều khoản - đăng ký
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
                              style:
                                  TextStyle(fontFamily: bold, color: redColor),
                            ),
                          ]),
                        ).onTap(() {
                          Get.back();
                        }),
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .make(),
                  ),
                ],
              ),
            )));
  }
}
