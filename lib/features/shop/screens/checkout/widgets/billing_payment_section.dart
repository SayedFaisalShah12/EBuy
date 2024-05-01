import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        ESectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        const SizedBox(height: ESizes.spaceBtwItems /2,),
        Row(
          children: [
            ERoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? EColors.light : EColors.white,
              child: Image(image: AssetImage(EImages.payPal), fit: BoxFit.contain,),
            ),
            SizedBox(width: ESizes.spaceBtwItems/2,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
      ],
    );
  }
}
