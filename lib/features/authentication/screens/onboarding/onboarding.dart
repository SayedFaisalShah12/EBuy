import 'package:ebuy/features/authentication/controllers/onboarding/onboardingController.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_dot_navigation.dart';
import 'onboarding_next_button.dart';
import 'onboarding_page.dart';
import 'onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal Scrollable Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.UpdatePageIndicator,
            children: const [
              onBaoardingPage(
                images: EImages.OnBoardingImages1,
                title: EString.onBoardingTitle1,
                subTitles: EString.onBoardingSubTitle1,
              ),
              onBaoardingPage(
                images: EImages.OnBoardingImages2,
                title: EString.onBoardingTitle2,
                subTitles: EString.onBoardingSubTitle2,
              ),
              onBaoardingPage(
                images: EImages.OnBoardingImages3,
                title: EString.onBoardingTitle3,
                subTitles: EString.onBoardingSubTitle3,
              ),
            ],
          ),

          //Skip Button
          const OnBoardingSkip(),

          //Dot Navigation SmoothNavigationIndicator
          const OnBoardDotNavigation(),

          //Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}






