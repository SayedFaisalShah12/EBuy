import 'package:ebuy/features/authentication/screens/login/widgets/login_divider.dart';
import 'package:ebuy/features/authentication/screens/login/widgets/login_socialMedia.dart';
import 'package:ebuy/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context){
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              //Title
              Text(EString.signUpTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: ESizes.spaceBtwSection,),
              //Form
              const ESignUpForm(),
              //Divider
              const SizedBox(height: ESizes.spaceBtwSection,),
              const EFormDivider(dividerText: EString.orSignUpWith),
              const SizedBox(height: ESizes.spaceBtwItems,),

              //Sign up Using social media
              const ESocialMediaButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


