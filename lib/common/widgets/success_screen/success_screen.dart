import 'package:ebuy/common/styles/spacing_style.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //Images
              Image(image: AssetImage(image), width: EHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: ESizes.spaceBtwSection),

              //Title and Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwItems,),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwSection,),

              //buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text("Continue"),),),
            ],
          ),
        ),
      ),
    );
  }
}
