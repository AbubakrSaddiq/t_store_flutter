import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_model.dart';

import '../../../utils/exception/firebase_exception.dart';
import '../../../utils/exception/format_exception.dart';
import '../../../utils/exception/platform_exception.dart';
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("User").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw StoreFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw StoreFormatException();
    } on PlatformException catch (e){
      throw StorePlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  ///function to fetch user details based on user id
  ///function to update user data in firebase
  ///update any field in specific users collection
}
