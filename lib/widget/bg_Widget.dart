import 'package:du_an/Style/Images.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    width: 500,
    height: 500,
    decoration: BoxDecoration(color: Colors.red),
    child: child,
  );
}
