import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final String uid;
  final String username;
  final String email;
  final String password;
  final String SDT;

  User(
      {required this.uid,
      required this.username,
      required this.email,
      required this.password,
      required this.SDT});

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        SDT: json["SDT"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "password": password,
        "SDT": SDT,
      };
}
