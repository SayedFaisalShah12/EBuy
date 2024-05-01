import 'package:ebuy/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ebuy/features/personalization/controller/user_controller.dart';
import 'package:ebuy/features/shop/screens/all_products/all_products.dart';
import 'package:ebuy/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ebuy/features/shop/screens/home/widgets/home_category.dart';
import 'package:ebuy/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            const EPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///AppBar
                  EHomeAppBar(),
                  SizedBox(height: ESizes.spaceBtwSection,),

                  ///SearchBar
                  ESearchContainer(text: "Search in Store", icon: Iconsax.search_normal,),
                  SizedBox(height: ESizes.spaceBtwSection,),

                  ///Categories Main Title
                  Padding(
                    padding: EdgeInsets.only(left: ESizes.spaceBtwItems),
                    child: Column(
                      children: [
                        ///Heading
                        ESectionHeading(title: 'Popular Categories', showActionButton: false, textColor: EColors.white,),
                        SizedBox(height: ESizes.spaceBtwItems,),

                        ///Categories
                        EHomeCategory(),
                      ],
                    ),
                  ),
                  SizedBox(height: ESizes.spaceBtwSection,),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  ///Promo Sliders
                  const EPromoSlider(banners: [EImages.promoBanner1,EImages.promoBanner2,EImages.promoBanner3,],),
                  const SizedBox(height: ESizes.spaceBtwSection,),

                  ///Heading title
                  ESectionHeading(title: 'Popular Products', onPressed: ()=> Get.to(()=>const AllProducts())),
                  const SizedBox(height: ESizes.spaceBtwItems,),

                  ///Propular Products
                  EGridViewLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const EProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}














