import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CategoryModel{
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  /// Empty Helper function
  static CategoryModel empty() =>CategoryModel(id: '', name: '', image: '', isFeatured:false);

  ///Convert model to json structure so that you can store data in firestore
  Map<String, dynamic> toJson(){
      return {
        'Name': name,
        'Image': image,
        'ParentId': parentId,
        'IsFeatured': isFeatured
      };
  }

  ///Map the Json oriented document snapshot from firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
      if(document.data() != null){
        final data = document.data();

        //Map Json Record to the Model
        return CategoryModel(
            id: document.id,
            name: data?['Name'] ?? '',
            image: data?['Image']?? '',
            isFeatured: data?['IsFeatured']?? '',
        );
      }
      else {
        return CategoryModel.empty();
      }
  }
}