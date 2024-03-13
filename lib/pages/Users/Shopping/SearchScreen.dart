import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:du_an/pages/Constant/constant.dart';
import 'package:du_an/pages/Users/Shopping/MenuDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MySearchScreen extends StatefulWidget {
  const MySearchScreen({super.key});

  @override
  State<MySearchScreen> createState() => _MySearchScreenState();
}

class _MySearchScreenState extends State<MySearchScreen> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(13),
            child: TextFormField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black)),
                  labelText: "Tìm kiếm",
                  prefixIcon: Icon(Icons.search)),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          Expanded(
              child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: (name != "" && name != null)
                  ? firestore
                      .collection('Food')
                      .where("searchKeyword", arrayContains: name)
                      .snapshots()
                  : firestore.collection('Food').snapshots(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return Container(
                            padding: EdgeInsets.all(15),
                            // margin: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.network(
                                    data['image'],
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text(data['name']),
                                ),
                              ],
                            ),
                          ).box.white.make().onTap(() {
                            Get.to(() => MyMenuDetails(
                                  title: data['name'],
                                  image: data['image'],
                                  description: data['description'],
                                  data: data[index],
                                ));
                          });
                        },
                      );
              },
            ),
          ))
        ],
      )),
    );
  }
}
