import 'package:du_an/Models/Category.dart';
import 'package:du_an/pages/Constant/constant.dart';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class FoodController extends GetxController {
  var subcat = [];
  var quantity = 0.obs;
  var totalprice = 0.obs;
  getAllCata(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/Services/Catagory.json");
    var decode = categoryFromJson(data);
    var s = decode.catagory.where((element) => element.name == title).toList();
    for (var e in s[0].subCatagory) {
      subcat.add(e);
    }
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calcuTotalPrice(price) {
    totalprice.value = price * quantity.value;
  }

  addtoCart({name, image, totalprice, quantity, context}) async {
    await firestore.collection('cart').doc().set({
      'name': name,
      'image': image,
      'totalprice': totalprice,
      'quantity': quantity,
      'added_by': currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetvalue() {
    totalprice.value = 0;
    quantity.value = 0;
  }
}
