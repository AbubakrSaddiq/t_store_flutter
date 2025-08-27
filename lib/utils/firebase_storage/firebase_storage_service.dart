
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StoreFirebaseStorageService extends GetxController{
  static StoreFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  ///upload local assets from IDE
///returns a Uint8List containing image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try{
      final byteData = await rootBundle.load(path);
      final ImageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return ImageData;
    }catch (e){
      throw 'Error loading image data: $e';
    }
  }
///upload image using ImageData on cloud Firebase Storage
///Return the download url of the upload image
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try{
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    }catch (e){
    //   handle exceptions
      if(e is FirebaseException){
        throw 'Firebase Exception: ${e.message}';
      }else if (e is SocketException){
        throw 'Network Error: ${e.message}';
      }else if (e is PlatformException){
        throw 'Platform Exception: ${e.message}';
      }else{
        throw 'Something went wrong!';
      }
    }
  }
///upload image on cloud firebase storage
///returns the download url of the upload image
  Future<String> uploadImageFile(String path, XFile image) async {
    try{
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }catch (e){
      //   handle exceptions
      if(e is FirebaseException){
        throw 'Firebase Exception: ${e.message}';
      }else if (e is SocketException){
        throw 'Network Error: ${e.message}';
      }else if (e is PlatformException){
        throw 'Platform Exception: ${e.message}';
      }else{
        throw 'Something went wrong!';
      }
    }
  }

}