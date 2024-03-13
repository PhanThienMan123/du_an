import 'package:du_an/Models/Food.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;
  Calculate(data) {
    totalPrice.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalPrice.value =
          totalPrice.value + int.parse(data[i]['totalprice'].toString());
    }
  }
}
