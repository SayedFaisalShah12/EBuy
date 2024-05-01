import 'package:ebuy/features/authentication/controllers/forgot_password/forgot_password.dart';
import 'package:ebuy/features/authentication/screens/login/login.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    final forgotPasswordController = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back, icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
            ///Images
            Image(image: const AssetImage(EImages.animation3), width: EHelperFunction.screenWidth() * 0.6,),
            const SizedBox(height: ESizes.spaceBtwSection,),

            ///Title and Subtitle
            Text(email, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: ESizes.spaceBtwItems,),
            Text(EString.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: ESizes.spaceBtwItems,),

            ///Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: ()=> Get.offAll(()=> LoginScreen()), child: const Text('Done')),
            ),
            const SizedBox(height: ESizes.spaceBtwSection,),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => forgotPasswordController.resendPasswordReset(email), child: const Text(EString.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
