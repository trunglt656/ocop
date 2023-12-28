import 'package:ecommerce_store/consts/consts.dart';
import 'package:ecommerce_store/model/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var totalPrice = 0.obs;
  var subcat = [];

  getSubCategories(title) async {
    subcat.clear();

    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    if (s.isNotEmpty) {
      for (var e in s[0].subcategory) {
        subcat.add(e);
      }
    } else {
      print('Không tìm thấy danh mục có tiêu đề là $title');
    }
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  caculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart({title, img, sellername, qty, tprice, context}) async {
    // vendorID
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'qty': qty,
      // 'vendor_id': vendorID,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    quantity.value = 0;
  }
}
