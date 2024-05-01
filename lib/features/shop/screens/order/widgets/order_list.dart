import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/color.dart';

class EOrderListItem extends  StatelessWidget {
  const EOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, index) => const SizedBox(height: ESizes.spaceBtwItems,),
      itemBuilder: (_,index) => ERoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(ESizes.md),
        backgroundColor: dark ? EColors.darkGrey : EColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Row-1
            Row(
              children: [
                ///Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: ESizes.spaceBtwItems/2,),

                ///status and Date
                Expanded(
                  child: Column(
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: EColors.primaryColor, fontWeightDelta: 1)),
                      Text('07 Nov 2023', style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3, size: ESizes.iconSm,)),
              ],
            ),

            SizedBox(height: ESizes.lg,),

            ///Row-2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: ESizes.spaceBtwItems/2,),

                      ///status and Date
                      Expanded(
                        child: Column(
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('#9723462', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      ///Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: ESizes.spaceBtwItems/2,),

                      ///status and Date
                      Expanded(
                        child: Column(
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2023', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
