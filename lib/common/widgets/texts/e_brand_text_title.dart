import 'package:ebuy/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class EBrandTitleText extends StatelessWidget {
  const EBrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLine = 1,
    this.textAlign,
    this.brandTextSizes = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLine;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        style: brandTextSizes == TextSizes.small
             ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
             : brandTextSizes == TextSizes.medium
               ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
               : brandTextSizes == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color)

    );
  }
}