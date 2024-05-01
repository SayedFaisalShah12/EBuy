import 'package:ebuy/data/repositories/user_repository.dart';
import 'package:ebuy/features/personalization/controller/user_controller.dart';
import 'package:ebuy/features/personalization/screens/profile/profile.dart';
import 'package:ebuy/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/network_manager/network_manager.dart';
import '../../../../utils/popups/full_screen_loaders.dart';

///Controller to manage the user-related functionality
class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final userController = UserController.instance;
  final userRespository = Get.put(UserRespository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  ///init user data when Home Screen appears
  void onInit(){
    initalizedName();
    super.onInit();
  }

  ///Fetch user record
  Future<void> initalizedName() async {
      firstname.text = userController.user.value.firstName;
      lastname.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        EFullScreenLoader.stopLoading();
        return;
      }

      //update the user first name and last name in firestore
      Map<String, dynamic> name = {'FirstName': firstname.text.trim(), 'LastName': lastname.text.trim()};
      await userRespository.updateSingleField(name);

      //update the Rx user value
      userController.user.value.firstName = firstname.text.trim();
      userController.user.value.lastName = lastname.text.trim();

      //show success message
      ELoader.successSnackbar(title: 'Congratulations', message: 'Your Name has been updated');

      //Move to the previous screen
      Get.off(() => const ProfileScreen());
    }
    catch(e){
      ELoader.errorSnackbar(title: 'Oh Snap', message: e.toString());
    }

  }
}