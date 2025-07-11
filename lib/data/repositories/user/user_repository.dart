import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Function to save user data to Firestore

  createUser(UserModel user) async {
   await _db.collection("Users").add(user.toJson()).whenComplete(
          () => Get.snackbar(
            "Success",
            "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.greenAccent,
            colorText: Colors.green,
          )
        ).catchError((error ){
          Get.snackbar("Error", "Something went wrong. Try Again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.red,
          );
          print(error.toString());
    });
  }

  ///function to fetch user details based on user id
  ///function to update user data in firebase
  ///update any field in specific users collection
}
