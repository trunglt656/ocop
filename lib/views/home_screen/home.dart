import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/home_controllers.dart';
import 'package:ecommerce_store/views/profile_screen/profile_screen.dart';
import 'package:ecommerce_store/views/cart_screen/cart_screen.dart';
import 'package:ecommerce_store/views/categories_screen/category_screen.dart';
import 'package:ecommerce_store/views/home_screen/home_screen.dart';
import 'package:ecommerce_store/views/information/information_screen.dart';
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
      const CategoryScreen(),
      const CartScreen(),
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
