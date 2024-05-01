import 'package:flutter/material.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class EVerticalImageText extends StatelessWidget {
  const EVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textcolor = EColors.white,
    this.onTap,
    this.backgroundColor,
  });

  final String image, title;
  final Color textcolor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark  = EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ESizes.sm),
        child: Column(
          children: [
            ///Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(ESizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? EColors.white : EColors.dark) ,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(image: AssetImage(image), fit: BoxFit.cover, color: dark ? EColors.dark : EColors.white,),
            ),

            const SizedBox(height: ESizes.spaceBtwItems/2,),

            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? EColors.white : EColors.dark),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
