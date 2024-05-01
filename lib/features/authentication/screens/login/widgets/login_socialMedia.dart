import 'package:ebuy/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ESocialMediaButtons extends StatelessWidget {
  const ESocialMediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color:EColors.borderSecondary), borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed:  ()=> controller.GoogleSignIn(),
            icon: const Image(
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: ESizes.spaceBtwSection,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color:EColors.borderSecondary), borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.facebookLogo),
            ),
          ),
        ),
      ],
    );
  }
}