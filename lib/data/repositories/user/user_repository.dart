import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_model.dart';
import '../../../utils/exception/firebase_exception.dart';
import '../../../utils/exception/format_exception.dart';
import '../../../utils/exception/platform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Function to save user data to Firestore
  createUser(UserModel user) async {

   await _db.collection("Users").doc(user.id).set(user.toJson()).whenComplete(
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
  Future<UserModel> fetchUserDetails() async {

    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }

  ///function to update user data in firebase
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try{
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }

  ///update any field in specific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }

///function to remove user data from firebase
  Future<void> removeUserRecord(String userId) async {
    try{
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }

///Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));

      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }
}


