import 'package:du_an/auth/FoodController.dart';
import 'package:du_an/pages/Constant/Pictures.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Constant/title.dart';
import 'package:du_an/pages/Users/Account/Profile_screenb.dart';
import 'package:du_an/pages/Users/Shopping/Cart_screen.dart';
import 'package:du_an/pages/Users/Shopping/CatalogyDetails.dart';
import 'package:du_an/pages/Users/Shopping/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCatagory extends StatefulWidget {
  const MyCatagory({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCatagory> createState() => _MyCatagoryState();
}

class _MyCatagoryState extends State<MyCatagory> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FoodController());
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "images/LogoKFC.png",
                      fit: BoxFit.contain,
                      height: 20,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myhomepage()));
                    },
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, "/Login");
                  //     },
                  //     icon: const Icon(
                  //       Icons.account_circle,
                  //       size: 30,
                  //       color: Colors.black,
                  //     )),
                  MaterialButton(
                    onPressed: () async {
                      authController.signOut(context);
                    },
                    color: Colors.blueGrey,
                    child: Text("Dang Xuat"),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      catalogyImage[index],
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    titleCata[index].text.color(Colors.black).make()
                  ],
                )
                    .box
                    .white
                    .rounded
                    .clip(Clip.antiAlias)
                    .outerShadow
                    .make()
                    .onTap(() {
                  controller.getAllCata(titleCata[index]);
                  Get.to(() => MyCatagoryDetails(title: titleCata[index]));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
