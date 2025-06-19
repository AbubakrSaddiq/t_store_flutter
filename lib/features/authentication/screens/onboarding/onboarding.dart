import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/texts.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import 'onBoarding_dot_navigation.dart';
import 'onBoarding_next_button.dart';
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
          ///horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              //page 1
              OnBoardingPage(
                title: StoreTexts.onBoardingTitle1,
                image: StoreImages.onBoardingImage4,
                subTitle: StoreTexts.onBoardingSubTitle1,
              ),
              //page 2
              OnBoardingPage(
                title: StoreTexts.onBoardingTitle2,
                image: StoreImages.onBoardingImage3,
                subTitle: StoreTexts.onBoardingSubTitle2,
              ),
              //page 3
              OnBoardingPage(
                title: StoreTexts.onBoardingTitle3,
                image: StoreImages.onBoardingImage5,
                subTitle: StoreTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///skip button
          const OnBoardingSkipBtn(),

          ///dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          ///next circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

