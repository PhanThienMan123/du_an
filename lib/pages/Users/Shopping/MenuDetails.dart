import 'package:du_an/Style/Color.dart';
import 'package:du_an/auth/FoodController.dart';
import 'package:du_an/pages/Users/Shopping/Cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MyMenuDetails extends StatelessWidget {
  final String? title;
  final String? image;
  final String? description;
  final dynamic data;
  MyMenuDetails(
      {Key? key,
      required this.title,
      required this.image,
      required this.description,
      this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<FoodController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetvalue();
        return false;
      },
      child: Scaffold(
          backgroundColor: lightGrey,
          appBar: AppBar(
            title: title!.text.white.make(),
            leading: IconButton(
                onPressed: () {
                  controller.resetvalue();
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Image.network(image.toString())),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1, color: Colors.black))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          "Mon an moi  > ",
                          style: TextStyle(fontSize: 18),
                        ),
                        title!.text.size(18).make()
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        title!.text.size(30).fontWeight(FontWeight.w600).make(),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: description!.text.size(18).make(),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "${data['price']}"
                        .numCurrency
                        .text
                        .color(redColor)
                        .size(13)
                        .make(),
                  ),
                  10.heightBox,
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity".text.color(darkFontGrey).make(),
                        ),
                        Obx(() => Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      controller.decreaseQuantity();
                                      controller.calcuTotalPrice(
                                          int.parse(data['price']));
                                    },
                                    icon: Icon(Icons.remove)),
                                controller.quantity.value.text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .make(),
                                IconButton(
                                    onPressed: () {
                                      controller.increaseQuantity(
                                          int.parse(data['quantity']));
                                      controller.calcuTotalPrice(
                                          int.parse(data['price']));
                                    },
                                    icon: Icon(Icons.add)),
                                10.widthBox,
                                "(${data['quantity']} avalable)"
                                    .text
                                    .color(darkFontGrey)
                                    .make()
                              ],
                            ))
                      ],
                    ).box.make(),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Tong tien:".text.color(darkFontGrey).make(),
                        ),
                        Obx(() => "${controller.totalprice.value}"
                            .numCurrency
                            .text
                            .color(redColor)
                            .make())
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.addtoCart(
                            name: data['name'],
                            image: data['image'],
                            context: context,
                            quantity: controller.quantity.value,
                            totalprice: controller.totalprice.value);
                        VxToast.show(context, msg: "Add to cart");
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 120)),
                      child: Text("Them vao gio hang"))
                ],
              ))),
    );
  }
}
