import 'package:du_an/auth/AuthController.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Account/Login_screen.dart';
import 'package:du_an/pages/Users/Account/Profile_screenb.dart';
import 'package:du_an/pages/Users/Account/Registry.dart';
import 'package:du_an/pages/Users/Shopping/my_home_page.dart';
import 'package:du_an/pages/Users/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MySplash(),
      title: appname,
      debugShowCheckedModeBanner: false,
      routes: {
        "/Myhomepage": (context) => Myhomepage(),
        "/Login": (p0) => Login(),
        "/Sigup": (p0) => MyRegistry(),
        "/Mybar": (p0) => MyProfile(),
      },
    );
  }
}
