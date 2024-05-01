import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EFirebaseStorageService extends GetxController{
  static EFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  ///Upload local asset from IDE
  ///Return a Unit8List containing image data

  Future<Uint8ClampedList>getImageDataFromAssets(String path) async{
          try{
            final byteData = await rootBundle.load(path);
            final imageData = byteData.buffer.asUint8ClampedList(byteData.offsetInBytes, byteData.lengthInBytes);
            return imageData;
          }catch(e){
            throw 'Error while getting image from assets in services: $e';
          }
  }

  ///upload Image using ImageData on Cloud Firestore Storage
  ///Return the download URL of the image.

  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      throw 'Error while uploading image to image in services';
    }
  }

  ///upload Image on cloud Firestore Storage
  ///Return the download URL of the image.

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }catch(e) {
        throw 'Error while uploading image in services';
    }
  }
}