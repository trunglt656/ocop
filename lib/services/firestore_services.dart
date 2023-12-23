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

  //lấy dữ liệu cho giỏ hàng
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  //xóa sp cart
  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }
}
