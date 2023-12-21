import 'package:ecommerce_store/consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }
}
