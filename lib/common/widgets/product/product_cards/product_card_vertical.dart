import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/styles/shadow.dart';
import 'package:ebuy/common/widgets/images/e-rounded_widgets.dart';
import 'package:ebuy/features/shop/screens/product_details/product_details.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icon/e_circular_icon.dart';
import '../../texts/e_brand_title_text__with_verified_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_price_text/product_price_text.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    ///Container with side, padding, color, edges, radius and shadow.
    return GestureDetector(
      onTap: ()=> Get.to(()=> ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          color: dark ? EColors.darkerGrey : EColors.white,
        ),
        child: Column(
          children: [
            ///Thumbnail, Wishlist and Discount Tag
            ERoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ESizes.sm),
                backgroundColor: dark ? EColors.dark : EColors.white,
              child:  Stack(
                  children: [
                    ///Thumbnail Image
                     const ERoundedWidget(imageUrl: EImages.product3, applyImageRadius: true,),

                    /// Sale Tag
                    Positioned(
                      top: 12,
                      child: ERoundedContainer(
                        radius: ESizes.sm,
                        backgroundColor: EColors.secondaryColor.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
                        child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
                      ),
                    ),

                    ///favorite Icon
                    const Positioned(
                        top: 0,
                        right: 0,
                        child: ECircularIcon(icon: Iconsax.heart5, color: Colors.red,)
                    ),
                    const SizedBox(height: ESizes.spaceBtwItems/2,),
                  ],
              ),
            ),

            ///Details
             const Padding(
              padding: EdgeInsets.only(left: ESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EProductTitleText(title: 'Black Nike Air Shoes', smallSize: true,),
                  SizedBox(height: ESizes.spaceBtwItems/2),
                  EBrandTitleWithVerifiedIcon(title: 'Nike',),
                ],
              ),
            ),
            const Spacer(),

            ///Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                const Padding(
                  padding: EdgeInsets.only(left: ESizes.sm),
                  child: EProductPriceText(price: '35',),
                ),
                ///Add To Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: EColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ESizes.cardRadiusMd),
                      bottomRight: Radius.circular(ESizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: ESizes.iconLg * 1.2,
                      height: ESizes.iconLg * 1.2,
                      child: Icon(Iconsax.add, color: EColors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


