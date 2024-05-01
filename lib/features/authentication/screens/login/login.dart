import 'package:ebuy/common/styles/spacing_style.dart';
import 'package:ebuy/features/authentication/screens/login/widgets/login_divider.dart';
import 'package:ebuy/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ebuy/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ebuy/features/authentication/screens/login/widgets/login_socialMedia.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header of Page
              ELoginHeader(dark: dark),

              //Email And Password
              const EloginForm(),

              // Authentication Buttons
              EFormDivider(dividerText: EString.orSignInWith.capitalize!,),

              const SizedBox(height: ESizes.spaceBtwSection,),
              //Social Media
              const ESocialMediaButtons(),
            ],
          ),
        ),
      ),
    );
  }
}






