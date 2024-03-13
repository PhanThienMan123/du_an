import 'dart:convert';

List<Food> userFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  String uid;
  final String foodname;
  final String description;
  final int price;
  final String image;

  Food({
    required this.uid,
    required this.foodname,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        uid: json["uid"],
        foodname: json["Foodname"],
        description: json["Description"],
        price: json["Price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "Foodname": foodname,
        "Description": description,
        "Price": price,
        "image": image,
      };
  final Map<String, dynamic> data = new Map<String, dynamic>();
}
