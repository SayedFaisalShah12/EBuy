import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EBillingAddressSection extends StatelessWidget {
  const EBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Sayed Faisal Shah', style: Theme.of(context).textTheme.bodyLarge,),

        Row(
          children: [
              Icon(Icons.phone, color: Colors.grey, size: 16,),
              SizedBox(width: ESizes.spaceBtwItems,),
              Text('092-34-34325325', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: ESizes.spaceBtwItems/2,),

        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16,),
            SizedBox(width: ESizes.spaceBtwItems,),
            Text('south liana, Maine 4234234, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,),
          ],
        ),
      ],
    );
  }
}
