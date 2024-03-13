import 'package:du_an/pages/Constant/constant.dart';

class FireStoreService {
  static getUser(uid) {
    return firestore
        .collection('users')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  //get Products:
  // static getProducts(name) {
  //   return firestore
  //       .collection(productsCollection)
  //       .where('name', isEqualTo: name)
  //       .snapshots();
  // }
  static getCata(catagory) {
    return firestore
        .collection('Food')
        .where('catagory', isEqualTo: catagory)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection('cart')
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  static deleteCart(docId) {
    return firestore.collection('cart').doc(docId).delete();
  }
}
