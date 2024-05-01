import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ELoginHeader extends StatelessWidget {
  const ELoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
            height: 100,
            image: AssetImage(dark ? EImages.darkAndroidLogo: EImages.lightAndroidLogo)
        ),
        Text(EString.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: ESizes.defaultSpace,),
        Text(EString.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}