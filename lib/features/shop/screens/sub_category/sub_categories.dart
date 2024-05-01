import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/images/e-rounded_widgets.dart';
import 'package:ebuy/common/widgets/product/product_cards/product_card_horizental.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const EAppBar(title: Text('Sport Shirt'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const ERoundedWidget(imageUrl: EImages.promoBanner1, width: double.infinity, applyImageRadius: true,),
              const SizedBox(height: ESizes.spaceBtwSection,),

              ///Sub-Categories
              Column(
                children: [
                  ///Heading
                  ESectionHeading(title: 'Sport Shirts', onPressed: (){},),
                  const SizedBox(height: ESizes.spaceBtwItems/2,),

                  SizedBox(
                    height: 106.4,
                    child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems,),
                        itemBuilder:(context, index) => const EProductCardHorizental(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
