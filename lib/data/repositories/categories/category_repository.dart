import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/exception/platform_exception.dart' show StorePlatformException;

import '../../../features/shop/models/category_model.dart';
import '../../../utils/exception/firebase_exception.dart';
import '../../../utils/exception/format_exception.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  ///variables
  final _db = FirebaseFirestore.instance;
///get all categories
Future<List<CategoryModel>> getAllCategories() async {
  try{
    final snapshot = await _db.collection('Categories').get();
    final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
    return list;
  }on FirebaseException catch (e) {
    throw StoreFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw StorePlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again...';
  }
}
///get sub categories
///upload categories to cloud firebase
}