import 'package:ebuy/common/widgets/brand_card/brand_show_case.dart';
import 'package:ebuy/common/widgets/layout/grid_layout.dart';
import 'package:ebuy/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ///Brands
                const EBrandShowCase(image: [EImages.product1,EImages.product2,EImages.product3,] ),
                const SizedBox(height: ESizes.spaceBtwItems,),

              ///Products
              ESectionHeading(title: 'You might like', onPressed: (){},),
              const SizedBox(height: ESizes.spaceBtwItems,),

              EGridViewLayout(itemCount: 4, itemBuilder: (_, index) => const EProductCardVertical()),
              const SizedBox(height: ESizes.spaceBtwSection),
            ],
          ),
        ),
      ]
    );
  }
}
