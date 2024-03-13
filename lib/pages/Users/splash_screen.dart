import 'package:du_an/Style/Color.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Home.dart';
import 'package:du_an/pages/Users/Account/Login_screen.dart';
import 'package:du_an/widget/AppLogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  ChangeSCreen() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.to(() => Login());
      firebase_auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => Login());
        } else {
          Get.to(() => HomeScreen());
        }
      });
    });
  }

  @override
  void initState() {
    ChangeSCreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 300),
              alignment: Alignment.center,
              child: appLogoWidget(),
            ),
            5.heightBox,
            appname.text.size(22).black.make(),
            5.heightBox,
            appversion.text.size(15).black.make(),
            Spacer(),
            credits.text.white.make()
          ],
        ),
      ),
    );
  }
}
