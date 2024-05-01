import 'package:ebuy/common/widgets/icon/e_circular_icon.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/color.dart';

class EBottonAddToCart extends StatelessWidget {
  const EBottonAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ESizes.spaceBtwItems , vertical: ESizes.spaceBtwItems),
      decoration: BoxDecoration(
        color: dark ? EColors.darkGrey : EColors.light,
        borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ESizes.cardRadiusLg),
              topRight: Radius.circular(ESizes.cardRadiusLg),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
          children: [
            ECircularIcon(
              icon: Iconsax.minus,
              backgroundColor: EColors.darkGrey,
              width: 40,
              height: 40,
              color: EColors.white,
            ),

            SizedBox(width: ESizes.spaceBtwItems,),
            Text('2', style :Theme.of(context).textTheme.titleSmall),
            SizedBox(width: ESizes.spaceBtwItems,),

            ECircularIcon(
              icon: Iconsax.add,
              backgroundColor: EColors.black,
              width: 40,
              height: 40,
              color: EColors.white,
            ),
          ],
        ),
          ElevatedButton(
            onPressed: (){},
            child: Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(ESizes.md),
              backgroundColor: EColors.black,
              side: BorderSide(color: EColors.black),
            ),
          ),
      ]
      ),
    );
  }
}
