import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Home.dart';
import 'package:du_an/pages/Users/Account/Login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:du_an/Models/Users.dart' as models;
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  // @override
  // void Onready() {
  //   super.onReady();
  //   _user = Rx<User?>(firebase_auth.currentUser);
  //   _user.bindStream(firebase_auth.authStateChanges());
  //   ever(_user, _setInitialScreen);
  // }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     Get.offAll(() => Login());
  //   } else {
  //     Get.offAll(() => HomeScreen());
  //   }
  // }

  void registerUser(
      String username, String email, String password, String SDT) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          SDT.isNotEmpty) {
        UserCredential cred = await firebase_auth
            .createUserWithEmailAndPassword(email: email, password: password);
        models.User user = models.User(
          username: username,
          email: email,
          password: password,
          SDT: SDT,
          uid: cred.user!.uid,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        Get.offAll(() => HomeScreen());
      } else {
        Get.snackbar("Error Creating", "Pls");
      }
    } catch (e) {
      firebase_auth.signOut();
      Get.snackbar("Error", e.toString());
    }
  }

  void LoginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebase_auth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.to(() => HomeScreen());
      }
    } catch (e) {
      Get.snackbar("ERRORRR", e.toString());
    }
  }

  void signOut(context) async {
    try {
      await firebase_auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
