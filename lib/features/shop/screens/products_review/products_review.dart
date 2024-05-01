import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/features/shop/screens/products_review/widgets/progress_indicator_and_rating.dart';
import 'package:ebuy/features/shop/screens/products_review/widgets/rating_progress_indicator.dart';
import 'package:ebuy/features/shop/screens/products_review/widgets/user_review_card.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/product/rating/rating_indicator.dart';
import '../../../../utils/constants/color.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      ///AppBar
      appBar:  EAppBar(title: Text('Review and Rating' ), showBackArrow: true,),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Rating and review are verified and are from people who use the same type of device tat you use."),
              const SizedBox(height: ESizes.spaceBtwItems,),

              ///Overall Products
              const EOverallProductRating(),
              const ERatingBarIndicator( rating: 3.5,),
              Text("12,611", style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(height: ESizes.spaceBtwItems),

              ///User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}





