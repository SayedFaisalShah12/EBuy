import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/widgets/product/rating/rating_indicator.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/color.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context){
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EImages.Review3)),
                const SizedBox(width: ESizes.spaceBtwItems,),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: ESizes.spaceBtwItems,),
        Row(
          children: [
            const ERatingBarIndicator(rating: 4),
            const SizedBox(width: ESizes.spaceBtwItems,),
            Text('01 Nov 2023', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: ESizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the aoo is quite attractive. i was able to navigate and purchase seamlessly. Great job!',
          trimLines: 2  ,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show More',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primaryColor),
        ),
        SizedBox(height: ESizes.spaceBtwItems),

        ERoundedContainer(
          backgroundColor: dark ? EColors.primaryColor : EColors.grey,
          child: Padding(
            padding: EdgeInsets.all(ESizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Replies", style: Theme.of(context).textTheme.bodyLarge,),
                    Text("02 Nov 2023", style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the aoo is quite attractive. i was able to navigate and purchase seamlessly. Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show More',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primaryColor),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: ESizes.spaceBtwSection,),
      ],
    );
  }
}
