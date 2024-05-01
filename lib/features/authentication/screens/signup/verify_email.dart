import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/features/authentication/controllers/signUp/verify_email_controller.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailVerification());
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.offAll(()=> AuthenticationRepository.instance.logout()), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              children: [
                //Images
                Image(image: const AssetImage(EImages.animation1), width: EHelperFunction.screenWidth() * 0.6,),
                const SizedBox(height: ESizes.spaceBtwSection),

                //Title and Subtitle
                Text(EString.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                const SizedBox(height: ESizes.spaceBtwItems,),
                Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
                const SizedBox(height: ESizes.spaceBtwItems,),
                Text(EString.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                const SizedBox(height: ESizes.spaceBtwSection,),

                //Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Continue'),
                    onPressed: () => controller.checkEmailVerificationStatus(),
                ),
                ),
                const SizedBox(height: ESizes.spaceBtwItems,),

                SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.checkEmailVerificationStatus(), child: const Text("Resend Email"),),),

              ],
            ),
        ),
      ),
    );
  }
}
