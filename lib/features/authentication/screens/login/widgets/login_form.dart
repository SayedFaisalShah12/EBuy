import 'package:ebuy/features/authentication/controllers/login/login_controller.dart';
import 'package:ebuy/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ebuy/features/authentication/screens/signup/signup.dart';
import 'package:ebuy/navigation_menu.dart';
import 'package:ebuy/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class EloginForm extends StatelessWidget {
  const EloginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
        child: Padding(
          padding:  const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSection),
          child: Column(
            children: [

              //Email
              TextFormField(
                controller: controller.email,
                validator: (value) => EValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: EString.email,
                ),
              ),

              const SizedBox(height: ESizes.spaceBtwInputField,),

              //Password
              Obx(
                    ()=> TextFormField(
                  controller: controller.password,
                  validator: (value) => EValidator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  expands: false,
                  decoration:  InputDecoration(
                    labelText: EString.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                        icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                    ),
                  ),
                ),
              ),

              const SizedBox(height: ESizes.spaceBtwInputField/2,),

              //Remember Me and Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Remember me
                  Row(
                    children: [
                      Obx(()=>  Checkbox(value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =  !controller.rememberMe.value)),
                      const Text(EString.rememberMe),
                    ],
                  ),

                  //Forgot Password
                  TextButton(onPressed: ()=> Get.to(()=> ForgotPassword()), child: const Text(EString.forgotPassword))
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwSection,),

              //SignIn Button
              SizedBox(width: double.infinity,
                  child: ElevatedButton(onPressed: ()=> controller.emailandPasswordSignIn(), child: const Text(EString.signIn))),
              const SizedBox(height: ESizes.spaceBtwSection,),

              //SignUp Button
              SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(()=> const SignupScreen()), child: const Text(EString.createAccount))),
              const SizedBox(height: ESizes.sm),
            ],
          ),
        )
    );
  }
}
