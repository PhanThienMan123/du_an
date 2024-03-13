import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:du_an/Services/firebase_store_service.dart';
import 'package:du_an/Style/Color.dart';
import 'package:du_an/auth/FoodController.dart';
import 'package:du_an/pages/Users/Shopping/MenuDetails.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCatagoryDetails extends StatelessWidget {
  final String? title;
  MyCatagoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db_ref = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                'https://foodkfc-b1e2a-default-rtdb.asia-southeast1.firebasedatabase.app')
        .ref()
        .child('Food');

    String name = "";
    String money = "d";
    var controller = Get.find<FoodController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Menu"),
      ),
      body: StreamBuilder(
        stream: FireStoreService.getCata(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        controller.subcat.length,
                        (index) => "${controller.subcat[index]}"
                            .text
                            .size(12)
                            .color(darkFontGrey)
                            .makeCentered()
                            .box
                            .red100
                            .rounded
                            .size(120, 50)
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .make()),
                  ),
                  10.heightBox,
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            data[index]['image'],
                            width: 170,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          5.heightBox,
                          "${data[index]['name']}"
                              .text
                              .size(13)
                              .color(Colors.black)
                              .make(),
                          10.heightBox,
                          "${data[index]['price']}"
                              .text
                              .color(Colors.black)
                              .make()
                        ],
                      )
                          .box
                          .white
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM
                          .outerShadow
                          .padding(EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                        Get.to(() => MyMenuDetails(
                              title: "${data[index]['name']}",
                              image: "${data[index]['image']}",
                              description: "${data[index]['description']}",
                              data: data[index],
                            ));
                      });
                    },
                  )
                ]),
              ),
            );
          }
        },
      ),
    );
  }
}

// class MyMenu extends StatelessWidget {
//   // final String? title;

//   MyMenu({
//     Key? key,
//     // required this.title,
//   }) : super(key: key);

//   List<String> menuList = [
//     "Uu dai",
//     "Mon moi",
//     "Combo 1 nguoi",
//     "Combo Nhom",
//     "Ga quay",
//     "Burger",
//     "An nhe",
//     "Thuc an nhanh",
//     "Trang mieng"
//   ];

//   final db_ref = FirebaseDatabase.instanceFor(
//           app: Firebase.app(),
//           databaseURL:
//               'https://foodkfc-b1e2a-default-rtdb.asia-southeast1.firebasedatabase.app')
//       .ref()
//       .child('Food');

//   String name = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
            
//           ],
//         ),
//       ),
//       // Cach 2:
//       // body: FirebaseAnimatedList(
//       //   query: db_ref,
//       //   shrinkWrap: true,
//       //   itemBuilder: (context, snapshot, animation, index) {
//       //     Map foodList = snapshot.value as Map;
//       //     foodList['key'] = snapshot.key;
//       //     return ListItem(foodList: foodList)
//       //         .box
//       //         .white
//       //         .roundedSM
//       //         .outerShadow
//       //         .make()
//       //         .onTap(() {
//       //       Get.to(() => MyMenuDetails(
//       //             title: foodList['name'],
//       //             image: foodList['image'],
//       //           ));
//       //     });
//       //   },
//       // )
//     );
//   }

//   shownameList(List<String> Ls) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           ...Ls.map((e) {
//             return itemshowNameList(e);
//           })
//         ],
//       ),
//     );
//   }

//   itemshowNameList(String menuList) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//       decoration: BoxDecoration(
//           color: Colors.blue, borderRadius: BorderRadius.circular(30)),
//       child: Text(
//         menuList,
//         style: TextStyle(color: Colors.black),
//       ),
//     );
//   }
// }
