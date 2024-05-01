
import 'package:ebuy/features/shop/controllers/category_controller.dart';
import 'package:ebuy/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/Image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class EHomeCategory extends StatelessWidget {
  const EHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(()
      {
        if(categoryController.featuredCategories.isEmpty){
            return Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),);
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(_, index){
              final category = categoryController.featuredCategories[index];
              return EVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: ()=> Get.to(() => const SubCategoriesScreen()),
              );
            }
        ),
      );
      }
    );
  }
}