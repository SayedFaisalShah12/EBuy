import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/appbar/tabbar.dart';
import 'package:ebuy/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ebuy/common/widgets/layout/grid_layout.dart';
import 'package:ebuy/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/features/shop/controllers/category_controller.dart';
import 'package:ebuy/features/shop/screens/brands/brands.dart';
import 'package:ebuy/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/brand_card/brand_card.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: EAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            ECartCounterIcon(onPressed: (){}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_,innerBoxIsScrolled){
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: EHelperFunction.isDarkMode(context) ? EColors.black : EColors.white,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ESizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [
                      ///Search Bar
                      const SizedBox(height: ESizes.spaceBtwItems),
                      const ESearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: ESizes.spaceBtwSection),

                      ///Features Brands
                      ESectionHeading(title: 'Features Brands', onPressed: ()=> Get.to(()=> const AllBrandScreen()),),
                      const SizedBox(height: ESizes.spaceBtwItems/1.5,),

                      ///Features Brands
                      EGridViewLayout(
                          itemCount: 4,
                          mainAxisExtend: 80,
                          itemBuilder: (_,index){
                            return const EBrandCard( showBorder: true,);
                          }),
                    ],
                  ),
                ),
                bottom: ETabBar( tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => ECategoryTab(category: category,)).toList(),
          ),
        ),
      ),
    );
  }
}


