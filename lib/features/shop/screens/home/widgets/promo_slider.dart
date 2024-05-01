import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebuy/features/shop/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/e-rounded_widgets.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';

class EPromoSlider extends StatelessWidget {
  const EPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => ERoundedWidget(imageUrl: url)).toList()
        ),
        const SizedBox(height: ESizes.spaceBtwItems,),
        Center(
          child: Obx(
              () =>  Row(
                mainAxisSize: MainAxisSize.min,
                    children: [
                    for(int i = 0; i <3; i++)
                       ECircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor: controller.carousalCurrentIndex.value == i ? EColors.primaryColor : EColors.grey,),
                      ],
                  ),
           ),
        )
      ],
    );
  }
}