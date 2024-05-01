import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/color.dart';

class EFormDivider extends StatelessWidget {
  const EFormDivider({super.key, required this.dividerText,
  });

  final String dividerText;
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? EColors.darkGrey: EColors.grey,  thickness: 0.5 , indent: 40, endIndent: 5,),),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark ? EColors.darkGrey: EColors.grey,  thickness: 0.5 , indent: 5, endIndent: 40,),),
      ],
    );
  }
}