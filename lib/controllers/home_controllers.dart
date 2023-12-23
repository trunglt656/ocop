import 'package:ecommerce_store/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUserName();
    // TODO: implement onInit
    super.onInit();
  }

  var currentNavIndex = 0.obs;

  var username = '';

  getUserName() async {
    var n = await firestore
        .collection(usersCollection)
        .where("id", isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        return value.docs.single['Name'];
      }
    });
    username = n;
  }
}
