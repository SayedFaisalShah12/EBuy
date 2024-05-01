import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/brand_card/brand_card.dart';
import 'package:ebuy/common/widgets/layout/grid_layout.dart';
import 'package:ebuy/common/widgets/product/sortable/sortable_products.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/features/shop/screens/brands/brands_products.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(title: Text('Brands'), showBackArrow: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              const ESectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(height: ESizes.spaceBtwItems,),

              ///Brands
              EGridViewLayout(
                  itemCount: 10,
                  mainAxisExtend: 80,
                  itemBuilder: (context, index) =>  EBrandCard(showBorder: true,
                        onTap: ()=> Get.to(()=> const BrandProducts()),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
