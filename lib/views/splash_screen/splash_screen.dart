import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/views/auth_screen/login_screen.dart';
import 'package:ecommerce_store/widget_common/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//
class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // using getx
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BGsplash,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(icSplashBg, width: 300),
              ),
              20.heightBox,
              appLogoWidget(), // widget common folder - component
              30.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              5.heightBox,
              appversion.text.white.make(),
              const Spacer(),
              credits.text.white.size(15).make(),
              25.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
