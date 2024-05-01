import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/features/authentication/models/user_model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRespository extends GetxController{
  static UserRespository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Function to save the user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      if (user.id.isNotEmpty) {
        // Use user.id as the document ID
        await _db.collection("Users").doc(user.id).set(user.toJson());
      } else {
        // Use add to let Firestore generate the document ID
        await _db.collection("Users").add(user.toJson());
      }
    } catch (e) {
      throw 'Error saving user record: $e';
    }
  }

  ///Function to save the user data to firestore
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else{
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Error While Fetching data from Database: $e';
    }
  }

  ///Function to update the user data to firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
       await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } catch (e) {
      throw 'Error While Updating the data: $e';
    }
  }

  ///Function to update a specific field in of User
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } catch (e) {
      throw 'Error While Updating specific field in data: $e';
    }
  }

  ///Function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } catch (e) {
      throw 'Error While deleting specific field in data: $e';
    }
  }

  ///Upload any image
  Future<String> uploadImage (String path, XFile image) async{
  try{
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  }catch(e) {
      throw 'Something went wrong while uploading image : user repository : $e';
  }
  }
}

