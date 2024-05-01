  import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/icon/e_circular_icon.dart';
import '../../../../../common/widgets/images/e-rounded_widgets.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ECurvedEdgedWidget(
      child: Container(
        color: dark ? EColors.darkGrey : EColors.white,
        child:  Stack(
          children: [
            ///Main Large Image
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(ESizes.productImageRadius),
                  child: Center(
                      child: Image(image: AssetImage(EImages.product3),
                      )
                  ),
                )
            ),

            ///Image Slider
            Positioned(
              right: 10,
              bottom: 30,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_,__)=> const SizedBox(width: ESizes.spaceBtwItems,),
                  itemBuilder:(_,index) => ERoundedWidget(
                    width: 80,
                    backgroundColor: dark ? EColors.dark : EColors.white,
                    border: Border.all(color: EColors.primaryColor),
                    padding: const EdgeInsets.all(ESizes.sm),
                    imageUrl: EImages.product3,
                  ),
                ),
              ),
            ),

            ///AppBar Icon
            const EAppBar(
              showBackArrow: true,
              actions: [
                ECircularIcon(icon: Iconsax.heart, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
