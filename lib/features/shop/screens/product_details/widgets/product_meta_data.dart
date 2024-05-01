import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/widgets/images/e_circular_images/e_circular_images.dart';
import 'package:ebuy/common/widgets/product/product_price_text/product_price_text.dart';
import 'package:ebuy/common/widgets/texts/e_brand_title_text__with_verified_icon.dart';
import 'package:ebuy/common/widgets/texts/product_title_text.dart';
import 'package:ebuy/utils/constants/enums.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';

class EProductMetaData extends StatelessWidget {
  const EProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and Sale Tags
        Row(
          children: [
            ///sales and Tags
            ERoundedContainer(
              radius: ESizes.sm,
              backgroundColor: EColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: darkMode ? EColors.darkGrey : EColors.darkGrey),),

            ),

            const SizedBox(width: ESizes.spaceBtwItems,),

            ///Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: ESizes.spaceBtwItems,),
            const EProductPriceText(price: '175',),
          ],
        ),

        const SizedBox(height: ESizes.spaceBtwItems/2,),

        ///Titles
        EProductTitleText(title: 'Green Nike Sports Shirts'),
        const SizedBox(height: ESizes.spaceBtwItems/2,),

        ///Stock status
        Row(
          children: [
            const EProductTitleText(title: 'Status'),
            const SizedBox(width: ESizes.spaceBtwItems,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(width: ESizes.spaceBtwItems/1.5),

        ///Brand
        Row(
          children: [
            ECircularImages(
                image: EImages.shoe,
                width: 32,
                height: 32,
                overlayColor: darkMode ? EColors.white : EColors.black ,
            ),
            const EBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
