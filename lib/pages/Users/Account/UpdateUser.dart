import 'dart:ffi';

import 'package:du_an/Style/Images.dart';
import 'package:du_an/auth/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:du_an/pages/Users/Account/Profile_screenb.dart';
import 'package:velocity_x/velocity_x.dart';

class MyUpdateUser extends StatefulWidget {
  final dynamic data;
  MyUpdateUser({Key? key, this.data}) : super(key: key);

  @override
  State<MyUpdateUser> createState() => _MyUpdateUserState();
}

class _MyUpdateUserState extends State<MyUpdateUser> {
  final _formkey = GlobalKey<FormState>();

  bool ishidePassword = true;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cap nhat tai khoan cua ban"),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    IcAppLogo,
                    width: 100,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(13),
                  child: TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                        labelText: "Username", hintText: "Nhap username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui long nhap username";
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(13),
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        labelText: "Email", hintText: "Nhap Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui long nhap email";
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(13),
                  child: TextFormField(
                    controller: controller.passwordController,
                    obscureText: ishidePassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Nhap password",
                        suffixIcon: InkWell(
                          onTap: toggelpassword,
                          child: Icon(ishidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui long nhap password";
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(13),
                  child: TextFormField(
                    controller: controller.numberphoneController,
                    decoration: InputDecoration(
                        labelText: "So dien thoai",
                        hintText: "Nhap so dien thoai"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui long nhap so dien thoai";
                      }
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await controller.updateProfile(
                          username: controller.usernameController.text,
                          email: controller.emailController.text,
                          password: controller.passwordController.text,
                          sdt: controller.numberphoneController.text);
                      VxToast.show(context, msg: "Update Successfully");
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 150)),
                    child: Text("Cap nhat"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggelpassword() {
    setState(() {
      ishidePassword = !ishidePassword;
    });
  }
}
