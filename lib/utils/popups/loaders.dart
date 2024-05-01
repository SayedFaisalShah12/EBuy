import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/color.dart';

class ELoader{
  static hideSnackbar()=> ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}){
      ScaffoldMessenger.of(Get.context!).showSnackBar(
       SnackBar(
          elevation: 0,
          duration: const Duration(seconds: 3),
           backgroundColor: Colors.transparent,
           content: Container(
             padding: const EdgeInsets.all(12),
             margin: const EdgeInsets.symmetric(horizontal: 30),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: EHelperFunction.isDarkMode(Get.context!) ? EColors.darkGrey.withOpacity(0.9) : EColors.grey.withOpacity(0.9),
             ),
             child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge,)),
           ),
       ),
      );
    }

  static successSnackbar({required title, message = '', durantion = 3}){
  Get.snackbar(
  title,
  message,
  isDismissible: true,
  shouldIconPulse: true,
  colorText: Colors.white,
  backgroundColor: Colors.greenAccent,
  snackPosition: SnackPosition.BOTTOM,
  duration: Duration(seconds: durantion),
  margin: const EdgeInsets.all(10),
  icon: const Icon(Iconsax.check, color: EColors.white,)
  );
  }

  static warningSnackbar({required title, message = ''}){
  Get.snackbar(
  title,
  message,
  isDismissible: true,
  shouldIconPulse: true,
  backgroundColor: Colors.red.shade600,
  colorText: Colors.white,
  snackPosition: SnackPosition.BOTTOM,
  duration: const Duration(seconds: 3),
  margin: const EdgeInsets.all(20),
  icon: const Icon(Iconsax.warning_2, color: EColors.white,)
  );
  }

  static errorSnackbar({required title, message = ''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: EColors.white,)
    );
  }
}