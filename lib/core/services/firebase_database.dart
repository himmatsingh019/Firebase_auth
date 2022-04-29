import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseDatabase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> addUser(String name, String phoneNumber) async {
    try {
      users.add(
        {
          'name': name,
          'phone': '+91-$phoneNumber',
        },
      );
      Fluttertoast.showToast(msg: 'User Added');
      return true;
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }
}
