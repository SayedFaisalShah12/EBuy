import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ebuy/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/network_manager/network_manager.dart';
import '../../../../utils/popups/full_screen_loaders.dart';

class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  ///Send Reset Password
  SendPasswordResetEmail() async{
    try{
      //start Loading
      // EFullScreenLoader.openLoadingDialog('Logging in......',EImages.OnBoardingImages1 );

      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!forgotPasswordFormKey.currentState!.validate()){
        EFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.SendPasswordResetEmail(email.text.trim());

      //Remove the loaders
      EFullScreenLoader.stopLoading();

      //Show success Screen
      ELoader.successSnackbar(title: 'Email Sent', message: 'Email Link sent to Reset your password'.tr);

      //Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    }
    catch(e){
            throw 'Error while directing the user to reset your password';
    }
  }
  resendPasswordReset (String email) async {
    try{
      //start Loading
      // EFullScreenLoader.openLoadingDialog('Logging in......',EImages.OnBoardingImages1 );

      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.SendPasswordResetEmail(email);

      //Remove the loaders
      EFullScreenLoader.stopLoading();

      //Show success Screen
      ELoader.successSnackbar(title: 'Email Sent', message: 'A New Email Link sent to Reset your password'.tr);

    }
    catch(e){
      throw 'Error while new directing the user to reset your password';
    }
  }
}

