import 'package:ebuy/features/shop/screens/cart/cart.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';

class ECartCounterIcon extends StatelessWidget {
  const ECartCounterIcon({
    super.key,
     this.iconColor,
    required this.onPressed,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final dark =  EHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: ()=> Get.to(()=> const CartScreen()), icon:  Icon(Iconsax.shopping_bag, color: dark ? EColors.white : EColors.black, )),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ?  EColors.white :  EColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: dark ? EColors.black : EColors.white, fontSizeFactor: 0.8),
                )
            ),
          ),
        ),
      ],
    );
  }
}
