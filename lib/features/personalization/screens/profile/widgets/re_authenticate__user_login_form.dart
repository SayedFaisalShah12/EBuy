import 'package:ebuy/features/personalization/controller/user_controller.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/text_strings.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: EValidator.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: EString.email,
                  ),
                ),
                SizedBox(height: ESizes.spaceBtwInputField,),

                Obx(
                  ()=> TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => EValidator.validateEmptyText('Password', value),
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: EString.password,
                      suffixIcon: IconButton(
                          onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value ,
                          icon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: ESizes.spaceBtwInputField,),
                ///Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=> controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('Verify'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
