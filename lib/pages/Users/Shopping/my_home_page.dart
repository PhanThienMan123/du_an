import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:du_an/Services/firebase_store_service.dart';
import 'package:du_an/Style/Color.dart';
import 'package:du_an/Style/Images.dart';
import 'package:du_an/auth/AuthController.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Home.dart';
import 'package:du_an/pages/Users/Shopping/MenuDetails.dart';
import 'package:du_an/pages/Users/Shopping/SearchScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Myhomepage extends StatefulWidget {
  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  final Myitems = [
    Image.asset("images/KFC1.jpg"),
    Image.asset("images/KFC2.jpg"),
    Image.asset("images/KFC3.jpg"),
    Image.asset("images/KFC4.jpg"),
    Image.asset("images/KFC5.jpg")
  ];
  int mycurrentindex = 0;
  int currentIndex = 0;

  final CarouselController controller = CarouselController();
  final db_ref = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://foodkfc-b1e2a-default-rtdb.asia-southeast1.firebasedatabase.app')
      .ref()
      .child('Food');
  @override
  Widget build(BuildContext context) {
    var controllerr = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
          stream: db_ref.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              Map<dynamic, dynamic> map =
                  snapshot.data!.snapshot.value as dynamic;
              List<dynamic> list = [];
              list.clear();
              list = map.values.toList();
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
                    Container(
                      color: Colors.black,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: const Text(
                                  "Dat hang",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: const Icon(
                                  Icons.motorcycle,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Giao hang",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_bag,
                                      size: 30,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                "Mang ve",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2, color: Colors.black),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 140),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  "Dat hang ngay",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(13),
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black)),
                            labelText: "Tìm kiếm",
                            prefixIcon: Icon(Icons.search)),
                        onTap: () {
                          Get.to(() => MySearchScreen());
                        },
                      ),
                    ),
                    StreamBuilder(
                        stream: FireStoreService.getUser(currentUser!.uid),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            var data = snapshot.data!.docs[0];
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                // decoration: BoxDecoration(color: Colors.red),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      margin: EdgeInsets.only(left: 3),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                          IcAppLogo,
                                        ),
                                        radius: 50.0,
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 2, color: Colors.black)),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          // decoration:
                                          //     BoxDecoration(color: Colors.red),
                                          margin:
                                              EdgeInsets.only(top: 65, left: 3),
                                          child: const Text(
                                            "Chao mung ban quay tro lai",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(right: 100),
                                          child: "${data['username']}"
                                              .text
                                              .black
                                              .size(30)
                                              .fontWeight(FontWeight.w700)
                                              .make(),
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          }
                        }),
                    Stack(
                      children: <Widget>[
                        CarouselSlider(
                          items: Myitems,
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            initialPage: 0,
                            viewportFraction: 1,
                            // enlargeStrategy: CenterPageEnlargeStrategy.height,
                            height: 300,
                            aspectRatio: 16 / 9,
                            onPageChanged: (index, reason) {
                              mycurrentindex = index;
                            },
                          ),
                          carouselController: controller,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: Opacity(
                                opacity: 0.7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  width: 60,
                                  height: 60,
                                  margin: EdgeInsets.only(top: 110),
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                      onPressed: () {
                                        controller.previousPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Opacity(
                                  opacity: 0.7,
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.black),
                                    margin:
                                        EdgeInsets.only(top: 110, left: 270),
                                    alignment: Alignment.centerRight,
                                    width: 60,
                                    height: 60,
                                    child: IconButton(
                                        onPressed: () {
                                          controller.nextPage();
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        )),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60, left: 5),
                      child: const Column(
                        children: [
                          Text(
                            "DANH MUC MON AN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                wordSpacing: 2,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w900,
                                fontSize: 21,
                                fontFamily: "Times New Roman"),
                          ),
                          Divider(
                            height: 20,
                            thickness: 5,
                            indent: 20,
                            endIndent: 5,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: const Row(
                        children: [
                          Icon(
                            Icons.house,
                            size: 20,
                            color: Colors.black,
                          ),
                          Text(
                            "Danh muc mon an dac biet hom nay",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // width: 300,
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.snapshot.children.length,
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Image.network(
                                  list[index]['image'],
                                  width: 300,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(list[index]['name']),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[index]['price']),
                                    Text(
                                      "d",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(list[index]['description']),
                              ),
                            ],
                          ).box.white.roundedSM.outerShadow.make().onTap(() {
                            Get.to(() => MyMenuDetails(
                                  title: list[index]['name'],
                                  image: list[index]['image'],
                                  description: list[index]['description'],
                                  data: list[index],
                                ));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
