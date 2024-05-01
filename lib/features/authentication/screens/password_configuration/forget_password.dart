import 'package:ebuy/features/authentication/controllers/forgot_password/forgot_password.dart';
import 'package:ebuy/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:ebuy/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///Heading
            Text(EString.forgotPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: ESizes.spaceBtwItems,),
            Text(EString.forgotPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: ESizes.spaceBtwItems * 2,),

            ///Text field
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: EValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: EString.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwItems * 2,),
            ///Submit Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.SendPasswordResetEmail(),
                child: const Text(EString.confirmEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
