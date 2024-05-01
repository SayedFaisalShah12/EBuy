import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/styles/rounded_container.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress({
    super.key,
    required this.SelectedAddress});

  final bool SelectedAddress;
  @override

  Widget build(BuildContext context){
    final dark = EHelperFunction.isDarkMode(context);
    return ERoundedContainer(
      padding: EdgeInsets.all(ESizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: SelectedAddress ? EColors.primaryColor.withOpacity(0.5) : Colors.transparent,
      borderColor: SelectedAddress
          ? Colors.transparent
          : dark
          ? EColors.darkGrey
          : EColors.grey,
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 0,
            child: Icon(
                SelectedAddress ? Iconsax.tick_circle5 : null,
                color: SelectedAddress
                    ? dark
                    ? EColors.light
                    : EColors.dark.withOpacity(0.2)
                    : null
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'John Doe',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: ESizes.sm/2,),
              Text('(+232)-234-2356', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: ESizes.sm/2,),
              Text('437134, Timmy Coves, South Liava, Main 32352, USA', maxLines: 2, softWrap: true,),
            ],
          )
        ],
      ),
    );
  }
}
