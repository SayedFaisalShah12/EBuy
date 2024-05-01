import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class onBaoardingPage extends StatelessWidget {
  const onBaoardingPage({
    super.key, required this.images, required this.title, required this.subTitles,
  });

  final String images, title, subTitles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(ESizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: EHelperFunction.screenWidth() * 0.8,
            height: EHelperFunction.screenHeight() * 0.6,
            image: AssetImage(images),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox( height: ESizes.spaceBtwItems,),
          Text(
            subTitles,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}