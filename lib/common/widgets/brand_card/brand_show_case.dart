import 'package:flutter/material.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../styles/rounded_container.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({
    super.key,
    required this.image,
  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      showBorder: true,
      borderColor: EColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ESizes.md),
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Column(
        children: [

          ///Brand with Products Count
          const EBrandCard(showBorder: false,),

          ///Brands Top 3 Products Image
          Row(children: image.map((image) =>
                brandTopProductImageWidget(image, context)).toList(),),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: ERoundedContainer(
          height: 100,
          padding: const EdgeInsets.all(ESizes.sm),
          margin: const EdgeInsets.only(right: ESizes.sm),
          backgroundColor: EHelperFunction.isDarkMode(context) ? EColors
              .darkerGrey : EColors.light,
          child: Image(fit: BoxFit.contain, image: AssetImage(image),),
        )
    );
  }
}

