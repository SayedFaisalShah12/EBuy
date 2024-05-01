import 'package:ebuy/common/widgets/network_manager/network_manager.dart';
import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/features/personalization/controller/user_controller.dart';
import 'package:ebuy/utils/popups/full_screen_loaders.dart';
import 'package:ebuy/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  ///variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localstorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  onInit(){

}
  Future<void> emailandPasswordSignIn() async{
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
            if(!loginFormKey.currentState!.validate()){
                EFullScreenLoader.stopLoading();
                return;
            }

            //save data if RememberMe is selected
            if(rememberMe.value){
              localstorage.write('REMEMBER_ME_EMAIL', email.text.trim());
              localstorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
            }

            //login user using email and password authentication
            final userCredentials = AuthenticationRepository.instance.loginWIthEmailAndPassword(email.text.trim(), password.text.trim());

            //Remove Loader
            EFullScreenLoader.stopLoading();

            //Redirect
            AuthenticationRepository.instance.screenRedirect();
          }
          catch(e){
            EFullScreenLoader.stopLoading();
            ELoader.errorSnackbar(title: 'Oh Snap!', message: e.toString());
          }
  }

  Future<void> GoogleSignIn() async{
    try{
      //start Loading
      // EFullScreenLoader.openLoadingDialog('Logging in......',EImages.OnBoardingImages1 );

      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials = await AuthenticationRepository.instance.SignInWIthGoogle();

      //save user Records
      userController.saveUserRecord(userCredentials);

      //Remove Loader
       EFullScreenLoader.stopLoading();
    }
    catch(e){
          EFullScreenLoader.stopLoading();
          ELoader.errorSnackbar(
              title: 'Oh Snap',
              message: e.toString(),
          );
    }
  }
}