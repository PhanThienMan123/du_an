import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscured;
  final IconData icon;
  const TextInputWidget(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.isObscured,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          labelStyle: TextStyle(fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5), borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide())),
      obscureText: isObscured,
    );
  }
}
