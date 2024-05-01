import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/data/repositories/user_repository.dart';
import 'package:ebuy/features/authentication/models/user_model/user_model.dart';
import 'package:ebuy/features/authentication/screens/login/login.dart';
import 'package:ebuy/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/widgets/network_manager/network_manager.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/popups/full_screen_loaders.dart';
import '../screens/profile/widgets/re_authenticate__user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRespository());

  final hidePassword = false.obs;
  final profileloading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  void onInit(){
    super.onInit();
    fetchUserRecord();
  }
  Future<void> fetchUserRecord() async{
    try{
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
          user(UserModel.empty());
    }finally{
      profileloading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {

      //First update the user and check if user data is already stored. if not store new data
      await fetchUserRecord();

      //if record already stored
      if(user.value.id.isEmpty){
        if (userCredential != null) {
          //Convert the Name to First and Last Name
          final nameparts = UserModel.nameParts(
              userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          //Map user Data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameparts[0],
            lastName: nameparts.length > 1 ? nameparts.sublist(1).join('') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: '',
          );
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      ELoader.warningSnackbar(
          title: 'Data not Saved',
          message: 'Something went wrong while saving your user record',
      );
    }
  }

  void deleteAccountPopUp(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(ESizes.sm),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.blueAccent)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: ESizes.lg),
            child: Text('Delete'),
          ),
      ),
      cancel: OutlinedButton(onPressed: ()=>Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel'),),
    );
  }

  void deleteUserAccount() async{
    try{
      ///re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      if(provider.isNotEmpty){
        //Re verify email
        if(provider == 'google.com'){
          await auth.SignInWIthGoogle();
          await auth.deleteAccount();
          Get.offAll(()=> LoginScreen());
        }else if(provider == 'password'){
            Get.offAll(() => ReAuthLoginForm());
        }
      }
    }
    catch(e){
        ELoader.warningSnackbar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!reAuthFormKey.currentState!.validate()){
        EFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      Get.offAll(()=> LoginScreen());
    }catch(e){
      ELoader.warningSnackbar(title: 'Oh Snap 1', message: e.toString());
    }
  }

  uploadUserProfilePicture() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if(image != null){
        //upload image
        final imageUrl = await userRepository.uploadImage('User/Image/Profile', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture':imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        ELoader.successSnackbar(title: 'Congratulation', message: 'Your Profile Image has been updated');
      }
    }catch(e) {
      ELoader.warningSnackbar(title: 'Oh Snap user controller profile image', message: e.toString());
    }
  }
}

