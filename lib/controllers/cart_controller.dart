import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/controllers/home_controllers.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  //text controller cho shipping cart
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var cityController = TextEditingController();
  var stressController = TextEditingController();
  var addController = TextEditingController();

  var paymentIndex = 0.obs;
  late dynamic productSnapshot;
  var products = [];

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentMethod(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({orderPaymentMethod, totalAmount}) async {
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      //ordersCollection
      'order_code': '123456789',
      'order_day': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      // 'order_by_name': Get.find<HomeController>().username,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'shipping_method': fast_shipping,
      'payment_method': orderPaymentMethod,
      'order_place': true,
      'order_confirm': false,
      'order_deliver': false,
      'order_on_deliver': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products)
    });
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'img': productSnapshot[i]['img'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title']
      });
    }
  }
}
