import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:du_an/Services/firebase_store_service.dart';
import 'package:du_an/Style/Color.dart';
import 'package:du_an/auth/CartController.dart';
import 'package:du_an/auth/FoodController.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Shopping/Catagory_Screen.dart';
import 'package:du_an/pages/Users/Shopping/CatalogyDetails.dart';
import 'package:du_an/pages/Users/Shopping/MenuDetails.dart';
import 'package:du_an/pages/Users/Shopping/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    var controller2 = Get.put(FoodController());
    return WillPopScope(
      onWillPop: () async {
        controller2.resetvalue();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                controller2.resetvalue();
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
              StreamBuilder(
                stream: FireStoreService.getCart(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(13),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Text(
                              "GIO HANG CUA TOI",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(13),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 240)),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "GIO HANG CUA BAN DANG TRONG. HAY DAT \nMON NGAY!",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => MyCatagory());
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: Colors.red),
                                      child: Text(
                                        "Bat dau dat mon",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    var data = snapshot.data!.docs;
                    controller.Calculate(data);
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  // decoration: BoxDecoration(color: Colors.red),
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: Image.network(
                                            "${data[index]['image']}"),
                                        title:
                                            "${data[index]['name']} \nSo luong: ${data[index]['quantity']}"
                                                .text
                                                .make(),
                                        subtitle: "${data[index]['totalprice']}"
                                            .numCurrency
                                            .text
                                            .color(redColor)
                                            .make(),
                                        trailing: IconButton(
                                            onPressed: () {
                                              FireStoreService.deleteCart(
                                                  data[index].id);
                                            },
                                            icon: Icon(Icons.delete)),
                                      );
                                    },
                                  ),
                                ),
                                5.heightBox,
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 255, 255, 240)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "Tong tien".text.size(17).make(),
                                      Obx(() => "${controller.totalPrice.value}"
                                          .numCurrency
                                          .text
                                          .color(redColor)
                                          .size(17)
                                          .make())
                                    ],
                                  )
                                      .box
                                      .padding(EdgeInsets.all(12))
                                      .color(lightGrey)
                                      .make(),
                                ),
                                5.heightBox,
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 120)),
                                    child: Text("Thanh toan")),
                                5.heightBox,
                              ],
                            ),
                          )),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
