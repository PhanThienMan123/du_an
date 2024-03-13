import 'package:du_an/Style/Color.dart';
import 'package:du_an/auth/AuthController.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Shopping/my_home_page.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class MyRegistry extends StatefulWidget {
  const MyRegistry({Key? key}) : super(key: key);

  @override
  State<MyRegistry> createState() => _MyRegistryState();
}

class _MyRegistryState extends State<MyRegistry> {
  bool ishidePassword = true;
  final formkey = GlobalKey<FormState>();
  bool? ischecked = false;
  final username = TextEditingController();
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final numberphone = TextEditingController();
  var controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "images/LogoKFC.png",
                      fit: BoxFit.contain,
                      height: 20,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myhomepage()));
                    },
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_circle,
                        size: 30,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Text(
                "TAO TAI KHOAN",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            Form(
                key: formkey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  // decoration: BoxDecoration(color: Colors.red),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 19, right: 19),
                        child: TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                                labelText: "Ho va ten",
                                hintText: "Nhap ho va ten"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui long nhap du lieu";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 19, right: 19),
                        child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                                labelText: "Email", hintText: "Nhap email"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui long nhap du lieu";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 19, right: 19),
                        child: TextFormField(
                            controller: _pass,
                            obscureText: ishidePassword,
                            decoration: InputDecoration(
                                labelText: "Mat khau",
                                hintText: "Nhap mat khau",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _togglePasswordView();
                                    },
                                    icon: Icon(ishidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui long nhap du lieu";
                              }
                            }),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 19, right: 19),
                      //   child: TextFormField(
                      //       controller: confirmpassword,
                      //       obscureText: ishidePassword,
                      //       decoration: InputDecoration(
                      //           labelText: "Mat khau",
                      //           hintText: "Nhap mat khau",
                      //           suffixIcon: IconButton(
                      //               onPressed: () {
                      //                 _togglePasswordView();
                      //               },
                      //               icon: Icon(ishidePassword
                      //                   ? Icons.visibility
                      //                   : Icons.visibility_off))),
                      //       validator: (value) {
                      //         if (value == null || value.isEmpty) {
                      //           return "Vui long nhap du lieu";
                      //         }
                      //       }),
                      // ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 19, right: 19),
                        child: TextFormField(
                            controller: numberphone,
                            decoration: InputDecoration(
                              labelText: "SDT",
                              hintText: "Nhap so dien thoai",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui long nhap du lieu";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Checkbox(
                              checkColor: Colors.black,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white.withOpacity(.32);
                                }
                                return Colors.white;
                              }),
                              value: ischecked,
                              onChanged: (value) {
                                setState(() {
                                  ischecked = value;
                                });
                              },
                            ),
                          ),
                          // 5.widthBox,
                          Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                child: RichText(
                                    text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Toi da doc va dong y voi cac ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17)),
                                    TextSpan(
                                        text: privacy,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            decoration:
                                                TextDecoration.underline)),
                                    TextSpan(
                                        text: " & ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        )),
                                    TextSpan(
                                        text: term,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            decoration:
                                                TextDecoration.underline))
                                  ],
                                )),
                              ))
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final isvalidform =
                                formkey.currentState!.validate();
                            if (ischecked == true && isvalidform) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        content:
                                            Text("Ban da dang ky thanh cong"),
                                      ));
                              authController.registerUser(username.text,
                                  _email.text, _pass.text, numberphone.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                          child: Text("Dang Ky")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Ban da co tai khoan?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/Login");
                            },
                            child: Text(
                              "Dang Nhap",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      ishidePassword = !ishidePassword;
    });
  }
}
