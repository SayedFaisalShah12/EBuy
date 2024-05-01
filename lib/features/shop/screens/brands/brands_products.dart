import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/brand_card/brand_card.dart';
import 'package:ebuy/common/widgets/product/sortable/sortable_products.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Details
              EBrandCard(showBorder: true),
              SizedBox(height: ESizes.spaceBtwSection,),

              ESortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
