import 'package:du_an/Style/Color.dart';
import 'package:du_an/auth/HomeController.dart';
import 'package:du_an/pages/Constant/Pictures.dart';
import 'package:du_an/pages/Constant/title.dart';
import 'package:du_an/pages/Users/Shopping/Cart_screen.dart';
import 'package:du_an/pages/Users/Shopping/Catagory_Screen.dart';
import 'package:du_an/pages/Users/Account/Profile_screenb.dart';
import 'package:du_an/pages/Users/Shopping/my_home_page.dart';
import 'package:du_an/widget/exit_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var Getcontroller = Get.put(HomeController());
    var navbarItems = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 35,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.cartShopping,
            size: 35,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.drumstickBite,
            size: 35,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.bars,
            size: 35,
          ),
          label: ""),
    ];
    var navBody = [
      Myhomepage(),
      MyCart(),
      MyCatagory(),
      MyProfile(),
    ];
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
        return false;
      },
      child: Scaffold(
          body: Column(
            children: [
              Obx(() => Expanded(
                  child:
                      navBody.elementAt(Getcontroller.currentNavIndex.value)))
            ],
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                currentIndex: Getcontroller.currentNavIndex.value,
                selectedItemColor: redColor,
                type: BottomNavigationBarType.fixed,
                backgroundColor: whiteColor,
                items: navbarItems,
                onTap: (value) {
                  Getcontroller.currentNavIndex.value = value;
                },
              ))),
    );
  }
}
