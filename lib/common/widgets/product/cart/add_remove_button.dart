import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../icon/e_circular_icon.dart';

class EProductQuantityWithAddAndRemove extends StatelessWidget {
  const EProductQuantityWithAddAndRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ECircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ESizes.md,
          color: EHelperFunction.isDarkMode(context) ? EColors.white : EColors.black,
          backgroundColor: EHelperFunction.isDarkMode(context) ? EColors.darkGrey : EColors.light,
        ),

        const SizedBox(width: ESizes.spaceBtwItems,),
        Text('2', style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: ESizes.spaceBtwItems,),

        const ECircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ESizes.md,
          color: EColors.white,
          backgroundColor: EColors.primaryColor,
        ),
      ],
    );
  }
}