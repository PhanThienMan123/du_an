import 'package:du_an/Style/Images.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appLogoWidget() {
  return Image.asset(IcAppLogo)
      .box
      .white
      .size(100, 100)
      .padding(EdgeInsets.all(8))
      .rounded
      .make();
}
