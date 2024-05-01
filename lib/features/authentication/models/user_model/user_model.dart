import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy/utils/formatter/formatters.dart';

  ///Model class representing user data
  class UserModel{
  final String id;
  late final String firstName;
  late final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  String profilePicture;

  ///Constructor for user model
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///Helper functions
  String get fullName => '$firstName $lastName';

  String get FormattedPhoneNo => EFormatters.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(' ');

  ///static function to generate a username from the name
  static String generateUsername(fullName){
    List<String> nameParts = fullName.split(' ');
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : " ";

    String camelCaseUsername = "$firstname$lastname";
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

 ///static function to create  a empty model
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '',
  );

  ///convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }


  ///factory method to create a a userModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    }
    else{
      return empty();
    }
  }

  }
