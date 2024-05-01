import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/widgets/icon/e_circular_icon.dart';
import 'package:ebuy/common/widgets/images/e-rounded_widgets.dart';
import 'package:ebuy/common/widgets/product/product_price_text/product_price_text.dart';
import 'package:ebuy/common/widgets/texts/e_brand_title_text__with_verified_icon.dart';
import 'package:ebuy/common/widgets/texts/product_title_text.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../styles/shadow.dart';

class EProductCardHorizental extends StatelessWidget {
  const EProductCardHorizental({super.key});

  @override
  Widget build(BuildContext context){
    final dark = EHelperFunction.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [EShadowStyle.verticalProductShadow],
        color: dark ? EColors.darkerGrey : EColors.white,
      ),
      child: Row(
        children: [
          ///Thumbnail
          ERoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ESizes.sm),
            backgroundColor: dark ? EColors.dark : EColors.white,
            child:  Stack(
              children: [
                ///Thumbnail Image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: ERoundedWidget(imageUrl: EImages.product1, applyImageRadius: true),
                ),

                ///sale Tag
                Positioned(
                  top: 12,
                  child: ERoundedContainer(
                    radius: ESizes.sm,
                    backgroundColor: EColors.secondaryColor.withOpacity(0.8),
                    child: Text('25%', style: Theme.of(context).textTheme.labelSmall!.apply(color: EColors.black),
                    ),
                  ),
                ),

                ///Favorite Icon
                const Positioned(
                  top: 0,
                  right: 0,
                    child: ECircularIcon(icon: Iconsax.heart5, color: Colors.red)
                ),
              ],
            ),
          ),

          ///Details
           SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: ESizes.sm, left: ESizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EProductTitleText(title: 'Green Nike Half Sleeve Shirts', smallSize: true,),
                      SizedBox(height: ESizes.spaceBtwItems/2,),
                      EBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                   ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ///Pricing
                     const EProductPriceText(price: '245.0'),

                     ///Add to Cart
                     Container(
                     decoration: const BoxDecoration(
                       color: EColors.dark,
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(ESizes.cardRadiusMd),
                         bottomRight: Radius.circular(ESizes.productImageRadius)
                           ),
                        ),
                       child: const SizedBox(
                         width: ESizes.iconLg * 1.2,
                         height: ESizes.iconLg * 1.2,
                         child: Center(child: Icon(Iconsax.add, color: EColors.white,),),
                       ),
                     ),
                   ],
                 ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
