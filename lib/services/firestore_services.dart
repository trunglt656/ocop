import 'package:ecommerce_store/consts/consts.dart';

class FirestoreServices {
  // lấy dữ liệu user
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }

  // lấy sản phẩm theo danh mục
  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where("p_category", isEqualTo: category)
        .snapshots();
  }
}
