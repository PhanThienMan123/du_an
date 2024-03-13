// ignore: file_names

import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Account/ForgotPassword.dart';
import 'package:du_an/pages/Users/Shopping/my_home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ishidePassword = true;
  final formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
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
              Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text(
                            "Dang nhap",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                wordSpacing: 10),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                  hintText: "",
                                  labelText: "Nhap Email cua ban"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui long nhap email';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                              obscureText: ishidePassword,
                              controller: _password,
                              decoration: InputDecoration(
                                  hintText: "",
                                  labelText: "Nhap password cua ban",
                                  suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(ishidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ban chua nhap Password';
                                }
                                // if (value.length > 7) {
                                //   return 'Mot ky tu trong password phai lon hon 7 ki tu';
                                // }
                                return null;
                              }),
                          // SizedBox(
                          //   height: 5.0,
                          // ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ForgotPasswordPage();
                        }));
                      },
                      child: Text(
                        "Ban quen mat khau",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            final isvalidform =
                                formkey.currentState!.validate();
                            if (isvalidform) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        content:
                                            Text("Ban da dang nhap thanh cong"),
                                      ));
                              authController.LoginUser(
                                  _email.text, _password.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 100),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Text(
                            "Dang Nhap Ngay",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                // decoration: BoxDecoration(color: Colors.red),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Hoac dang nhap voi",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0)),
                                child: GestureDetector(
                                  child: Image.asset(
                                    "images/Facebook-icon-1.png",
                                    width: 60,
                                  ),
                                  onTap: () {},
                                )),
                          ),
                        ),
                        Expanded(
                            flex: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0)),
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "images/apple2.png",
                                      width: 60,
                                    ),
                                    onTap: () {},
                                  )),
                            )),
                        Expanded(
                            flex: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0)),
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "images/Google.png",
                                      width: 60,
                                    ),
                                    onTap: () {},
                                  )),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ban chua co tai khoan?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/Sigup");
                          },
                          child: Text(
                            "Dang ky",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    // if (ishidePassword == true) {
    //   ishidePassword = false;
    // } else {
    //   ishidePassword = true;
    // }
    setState(() {
      ishidePassword = !ishidePassword;
    });
  }
}
