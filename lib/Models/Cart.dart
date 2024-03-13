// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  String uid;
  final String foodname;
  final String price;
  final int quanlity;
  final double totalPrice;
  final String image;

  Cart({
    required this.uid,
    required this.foodname,
    required this.price,
    required this.quanlity,
    required this.totalPrice,
    required this.image,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        uid: json["uid"],
        foodname: json["Foodname"],
        price: json["Price"],
        quanlity: json["Quanlity"] as int,
        totalPrice: json["TotalPrice"] as double,
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "Foodname": foodname,
        "Price": price,
        "Quanlity": quanlity,
        "TotalPrice": totalPrice,
        "image": image,
      };
}
