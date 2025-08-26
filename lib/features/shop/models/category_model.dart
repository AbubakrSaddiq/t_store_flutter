import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,

  });

  ///Empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  ///convert model to json structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'isFeatured': isFeatured
    };
  }

  ///map json oriented document snapshot from firebase to userModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data();
      //   map json record to the model
      return CategoryModel(id: document.id,
          name: data?['Name'] ?? '',
          image: data?['Image'] ?? '',
          isFeatured: data?['isFeatured'] ?? false,
          parentId: data?['ParentId'] ?? ''
      );
    }else {
      return CategoryModel.empty();
    }
  }
}