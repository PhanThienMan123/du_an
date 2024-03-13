import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:du_an/pages/Constant/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var numberphoneController = TextEditingController();

  updateProfile({username, password, email, sdt}) async {
    var store = firestore.collection('users').doc(currentUser!.uid);
    await store.set({
      'username': username,
      'email': email,
      'password': password,
      'SDT': sdt
    }, SetOptions(merge: true));
  }
}
