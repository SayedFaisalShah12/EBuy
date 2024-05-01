import 'dart:async';
import 'package:ebuy/common/widgets/success_screen/success_screen.dart';
import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:ebuy/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class VerifyEmailVerification extends GetxController{
    static VerifyEmailVerification get instance => Get.find();

    ///Send Email whenever verify Screen appear and set Timer for auto redirect
    @override
    void onInit(){
      SendEmailVerification();
      SetTimerForAutoRedirect();
      super.onInit();
    }

    SendEmailVerification() async{
      try{
        await AuthenticationRepository.instance.SendEmailVerification();
        ELoader.successSnackbar(title: 'EmailSent ', message: 'Please check your email inbox');
    }
    catch(e){
        ELoader.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///Timer to automatically redirect on email verification
  SetTimerForAutoRedirect(){
      Timer.periodic(Duration(seconds: 1),(timer){
        FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if(user?.emailVerified?? false){
          timer.cancel();
          Get.off(
              ()=> SuccessScreen(
                  image: EImages.paymentSuccess,
                  title: EString.yourAccountCreatedTitle,
                  subTitle: EString.yourAccountCreatedSubTitle,
                  onPressed: () => AuthenticationRepository.instance.screenRedirect(),
              )
          );
        }
      }
      );
    }

    ///Manually Check if Email Verified
    checkEmailVerificationStatus() {
      final currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser != null && currentUser.emailVerified){
        Get.off(
                ()=> SuccessScreen(
              image: EImages.paymentSuccess,
              title: EString.yourAccountCreatedTitle,
              subTitle: EString.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            )
        );
      }
    }
}