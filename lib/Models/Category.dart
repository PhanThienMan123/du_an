// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

class Category {
  final List<Catagory> catagory;

  Category({
    required this.catagory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        catagory: List<Catagory>.from(
            json["catagory"].map((x) => Catagory.fromJson(x))),
      );
}

class Catagory {
  final String name;
  final List<String> subCatagory;

  Catagory({
    required this.name,
    required this.subCatagory,
  });

  factory Catagory.fromJson(Map<String, dynamic> json) => Catagory(
        name: json["name"],
        subCatagory: List<String>.from(json["subCatagory"].map((x) => x)),
      );
}
