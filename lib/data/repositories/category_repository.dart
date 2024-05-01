import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy/features/shop/models/category_model.dart';
import 'package:get/get.dart';
import '../services/EFirebase_storage_service/EFirebase_storage_service.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async{
        try{
            final snapshot = await _db.collection('Catgories').get();
            final list = snapshot.docs.map((document) =>CategoryModel.fromSnapshot(document)).toList();
            return list;
        }catch(e){
            throw 'Error in Category_repository';
        }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    try{
      //upload all the categories along their names
      final storage = Get.put(EFirebaseStorageService());

      //loop through the each category
      for(var category in categories){
          //Get imageData link from the last assets
          final file = await storage.getImageDataFromAssets(category.image);

          //upload Image and Gets its URl
          final url = await storage.uploadImageData('Catgories', file as Uint8List, category.name);

          //Assign to category.image attribute
          category.image = url;

          //Store category in Firestore
          await _db.collection("Catgories").doc(category.id).set(category.toJson());
      }
  }catch(e){
        throw 'Error uploading dummy data in category repository';
  }
}
}