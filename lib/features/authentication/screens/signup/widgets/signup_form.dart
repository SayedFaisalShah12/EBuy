  import 'package:ebuy/features/authentication/controllers/signUp/signUp.dart';
import 'package:ebuy/features/authentication/screens/signup/verify_email.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:ebuy/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ESignUpForm extends StatelessWidget {
  const ESignUpForm({super.key,});

  @override
  Widget build(BuildContext context) {
    final dark  = EHelperFunction.isDarkMode(context);
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              //firstname
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => EValidator.validateEmptyText('Firstname', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: EString.firstname, prefixIcon: Icon(Iconsax.user),),
                ),
              ),
              const SizedBox(width: ESizes.spaceBtwInputField),

              //lastname
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => EValidator.validateEmptyText('Lastname', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: EString.lastname, prefixIcon: Icon(Iconsax.user),),
                ),
              ),
            ],
          ),
          const SizedBox(height: ESizes.spaceBtwInputField,),

          //Username
          TextFormField(
            controller: controller.username,
            validator: (value) => EValidator.validateEmptyText('Username', value),
            expands: false,
            decoration:  const InputDecoration(labelText: EString.username, prefixIcon: Icon(Iconsax.user_edit),),
          ),
          const SizedBox(height: ESizes.spaceBtwInputField,),

          //Email
          TextFormField(
            controller: controller.email,
            validator: (value) => EValidator.validateEmail(value),
            expands: false,
            decoration:  const InputDecoration(labelText: EString.email, prefixIcon: Icon(Iconsax.direct),),
          ),

          //PhoneNumber
          const SizedBox(height: ESizes.spaceBtwInputField,),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => EValidator.validatePhoneNumber(value),
            expands: false,
            decoration:  const InputDecoration(labelText: EString.phoneNumber, prefixIcon: Icon(Iconsax.call),),
          ),
          const SizedBox(height: ESizes.spaceBtwInputField,),

          //Password
          Obx(
              ()=> TextFormField(
              controller: controller.password,
              validator: (value) => EValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration:  InputDecoration(
                  labelText: EString.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                      icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                  ),
              ),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputField,),

          //Term & Conditions
          Row(
            children: [
              //checkBox
              SizedBox(
                width: 24,
                height: 24,
                child: Obx(
                ()=> Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                  ),
                ),
              ),
              const SizedBox(width: 2),

              //Terms Text
              Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: '${EString.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '${EString.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? EColors.white : EColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? EColors.white : EColors.primaryColor,
                      )),
                      TextSpan(text: '${EString.and} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '${EString.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? EColors.white : EColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? EColors.white : EColors.primaryColor,
                      ))
                    ]
                ),
              ),
            ],
          ),
          const SizedBox(height: ESizes.spaceBtwSection,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:()=> controller.signup(),
              child: const Text(EString.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}