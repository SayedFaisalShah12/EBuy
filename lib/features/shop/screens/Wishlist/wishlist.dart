import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/icon/e_circular_icon.dart';
import 'package:ebuy/common/widgets/layout/grid_layout.dart';
import 'package:ebuy/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ebuy/features/shop/screens/home/home.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          ECircularIcon(icon: Iconsax.add, onPressed: () => Get.to(HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              EGridViewLayout(
                  itemCount: 6,
                  itemBuilder: (_,index) => const EProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
