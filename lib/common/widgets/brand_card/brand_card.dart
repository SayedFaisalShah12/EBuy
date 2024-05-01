import 'package:flutter/material.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../styles/rounded_container.dart';
import '../images/e_circular_images/e_circular_images.dart';
import '../texts/e_brand_title_text__with_verified_icon.dart';

class EBrandCard extends StatelessWidget {
  const EBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isDark  = EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      ///Container Design
      child: ERoundedContainer(
        padding: const EdgeInsets.all(ESizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///Icon
            Flexible(
              child: ECircularImages(
                isNetworkImage: false,
                image: EImages.cloth,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? EColors.white : EColors.dark,
              ),
            ),
            const SizedBox(width: ESizes.spaceBtwItems/2,),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.large,),
                  Text(
                    '256 Products',
                    overflow:  TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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