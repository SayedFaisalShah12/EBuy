import 'package:ebuy/common/widgets/network_manager/network_manager.dart';
import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/features/authentication/models/user_model/user_model.dart';
import 'package:ebuy/features/authentication/screens/signup/verify_email.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/popups/full_screen_loaders.dart';
import 'package:ebuy/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/user_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();


  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///Sign Up
   void signup() async {
    try {
      //Check Network Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      //Form Validation
      if(!signUpFormKey.currentState!.validate()) return;

      //Privacy Policy
      if(!privacyPolicy.value){
        ELoader.warningSnackbar(
            title: 'Accept Privacy Policy',
            message: 'In Order to create a new account,  you must accept the privacy policy and term of use.'
        );
        return;
      }

      //Register user in the firebase Authentication and save user data in the firebase
   final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

     // Save the user data in the firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
      );

      final userRepository = Get.put(UserRespository());
      await userRepository.saveUserRecord(newUser);

      // //Remove Loader
      EFullScreenLoader.stopLoading();

      //show success message
      ELoader.successSnackbar(title: 'Congratulations', message: 'Your account has been created! verify your email address');

      //Move to verify screen
      Get.to(()=>  VerifyEmailScreen(email: email.text.trim(),));
    }
    catch(e){
      EFullScreenLoader.stopLoading();

      //show some Generic error to the user
      ELoader.errorSnackbar(title: 'Oh Snap', message: e.toString());
    }
  }
}
