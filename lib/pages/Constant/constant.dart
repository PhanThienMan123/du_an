import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:du_an/auth/AuthController.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

var firebase_auth = FirebaseAuth.instance;
var firebase_Storage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//Controller
User? currentUser = firebase_auth.currentUser;
var authController = AuthController.instance;
const productsCollection = "Food";
// Constant String:
const appname = "eMart";
const appversion = "Version 1.0.0";
const credits = "@KFC-ManPhan";
const privacy = "Chinh sach hoat dong ";
const term = "Chinh sach bao mat thong tin cua KFC";
const menu = "Menu";
const logout = "Dang Xuat";
const login = "Dang nhap";
