import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:ebuy/common/widgets/icon/e_circular_icon.dart';
import 'package:ebuy/common/widgets/images/e-rounded_widgets.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ebuy/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ebuy/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ebuy/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ebuy/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:ebuy/features/shop/screens/products_review/products_review.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: EBottonAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. Product Image Slider
            EProductImageSlider(),

            /// 2. Product Details
            Padding(
              padding: const EdgeInsets.only(right: ESizes.defaultSpace, left: ESizes.defaultSpace, bottom: ESizes.defaultSpace,),
              child: Column(
                children: [
                  ///Rating and Share
                  const ERatingAndShare(),

                  ///Price, Title, Stock, Brand
                  const EProductMetaData(),

                  ///Attributes
                  const EProductAttributes(),
                  const SizedBox(height: ESizes.spaceBtwItems,),

                  ///Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox(height: ESizes.spaceBtwSection,),

                  ///Description
                  const ESectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  const ReadMoreText(
                    'This product is designed to be used with the following precautions and rules.This product is designed to be used with the following precautions and rules',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                  ),

                  ///Reviews
                  const Divider(),
                  const SizedBox(height: ESizes.spaceBtwItems),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ESectionHeading(title: 'Reviews(122)', showActionButton: false,),
                      IconButton(onPressed: ()=> Get.to(()=> const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}

