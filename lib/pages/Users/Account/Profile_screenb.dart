import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:du_an/Services/firebase_store_service.dart';
import 'package:du_an/Style/Color.dart';
import 'package:du_an/auth/ProfileController.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Account/UpdateUser.dart';
import 'package:du_an/pages/Users/Shopping/HistoryCart.dart';
import 'package:du_an/pages/Users/Shopping/my_home_page.dart';
import 'package:du_an/widget/bg_Widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
        stream: FireStoreService.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return Scaffold(
                body: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
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
                      MaterialButton(
                        onPressed: () async {
                          authController.signOut(context);
                        },
                        color: Colors.blueGrey,
                        child: Text("Dang Xuat"),
                      )
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      height: 500,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Chao mung ban da tro lai,  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20),
                            child: "${data['username']}"
                                .text
                                .black
                                .size(30)
                                .fontWeight(FontWeight.w700)
                                .make(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   height: 30,
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //       // color: Colors.red,
                              //       border: Border(
                              //           bottom: BorderSide(
                              //               width: 2, color: Colors.black),
                              //           right: BorderSide(
                              //               width: 2, color: Colors.black))),
                              // ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2, color: Colors.black))),
                                alignment: Alignment.topCenter,
                                child: Text("Cap nhat tai khoan")
                                    .box
                                    .white
                                    .make()
                                    .onTap(() {
                                  controller.usernameController.text =
                                      data['username'];
                                  controller.emailController.text =
                                      data['email'];
                                  controller.passwordController.text =
                                      data['password'];
                                  controller.numberphoneController.text =
                                      data['SDT'];
                                  Get.to(() => MyUpdateUser(
                                        data: data,
                                      ));
                                }),
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2, color: Colors.black))),
                                alignment: Alignment.topLeft,
                                child: Text("Lich su mua hang")
                                    .box
                                    .white
                                    .make()
                                    .onTap(() {
                                  Get.to(() => MyHistory());
                                }),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ));
          }
        },
      )),
    );
  }
}
