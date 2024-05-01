import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/widgets/product/product_price_text/product_price_text.dart';
import 'package:ebuy/common/widgets/texts/product_title_text.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/chips/choice_chips.dart';
import '../../../../../utils/constants/color.dart';

class EProductAttributes extends StatelessWidget {
  const EProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark  = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute Pricing and Description
        ERoundedContainer(
              padding: const EdgeInsets.all(ESizes.md),
              backgroundColor: dark ? EColors.darkGrey : EColors.grey,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                ///Title, Price and Stock Status
                children: [
                  const ESectionHeading(title: 'Variations', showActionButton: false,),
                  const SizedBox(width: ESizes.spaceBtwItems,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const EProductTitleText(title: 'Price : ', smallSize: true,),

                          ///Actual Price
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),

                          const SizedBox(width: ESizes.spaceBtwItems,),

                          ///Sale Price
                          const EProductPriceText(price: '20 '),
                        ],
                      ),

                      ///Stock
                      Row(
                        children: [
                          const EProductTitleText(title: 'Stock :', smallSize: true,),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                         ],
                      ),
                    ],
                  ),
                 ],
              ),
              const EProductTitleText(
                title: 'This is the description of the product and the price. Here is the price for the product',
                smallSize: true,
                maxlines: 4,
              ),
            ],
          ),
        ),

        const SizedBox(height: ESizes.spaceBtwItems,),

        ///Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: 'Colors', showActionButton: false,),
            const SizedBox(height: ESizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(text: 'Green', selected: true, onSelected: (value){},),
                EChoiceChip(text: 'Blue', selected: false, onSelected: (value){},),
                EChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: 'Size', showActionButton: false,),
            const SizedBox(height: ESizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(text: 'EU 34', selected: true, onSelected: (value){},),
                EChoiceChip(text: 'EU 36', selected: false, onSelected: (value){},),
                EChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},),
              ],
            )
          ],
        ),
      ],
    );
  }
}

