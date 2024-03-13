import 'package:flutter/material.dart';

var MenuName = [
  "1 mieng ga Dia Trung Hai",
  "2 ga cuon Bac Kinh",
  "3 mieng ga Dia Trung Hai"
      "Combo ga cuon Bac Kinh",
  "Combo ga cuon Dia Trung Hai A",
  "Combo ga cuon Dia Trung Hai B",
  "Combo ga cuon Dia Trung Hai C",
  "6 mieng ga Dia Trung Hai",
  "2 ga cuon Dia Trung Hai"
];
List<String> menuList = [
  "Uu dai",
  "Mon moi",
  "Combo 1 nguoi",
  "Combo Nhom",
  "Ga quay",
  "Burger",
  "An nhe",
  "Thuc an nhanh",
  "Trang mieng"
];
shownameList(List<String> Ls) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Row(
      children: [
        ...Ls.map((e) {
          return itemshowNameList(e);
        })
      ],
    ),
  );
}

itemshowNameList(String namelist) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30)),
    child: Text(
      namelist,
      style: TextStyle(color: Colors.black),
    ),
  );
}
