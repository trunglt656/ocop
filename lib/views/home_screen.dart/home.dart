import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/home_controllers.dart';
import 'package:ecommerce_store/views/account/account_screen.dart';
import 'package:ecommerce_store/views/connect_screen/connect_screen.dart';
import 'package:ecommerce_store/views/home_screen.dart/home_screen.dart';
import 'package:ecommerce_store/views/information/information_screen.dart';
import 'package:ecommerce_store/views/supply/supply_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 25), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 25), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 25), label: supply),
      BottomNavigationBarItem(icon: Image.asset(icBell, width: 25), label: inf),
      BottomNavigationBarItem(
          icon: Image.asset(icAppleLogo, width: 25), label: acount),
    ];

    var navBody = [
      const HomeScreen(),
      const ConnectScreen(),
      const SupplyScreen(),
      const Information(),
      const AccountScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedItemColor: redColor,
          unselectedItemColor: Colors.blue,
          items: navBarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}