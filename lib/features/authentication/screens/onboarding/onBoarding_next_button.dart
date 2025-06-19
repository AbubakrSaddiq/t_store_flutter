import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Positioned(
        right: StoreSizes.defaultSpace,
        bottom: StoreDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape: const CircleBorder(),
              backgroundColor: dark ? StoreColors.primary : StoreColors.dark,
              side: const BorderSide(color: StoreColors.black)
          ),
          child: const Icon(Iconsax.arrow_right_3,),
        ));
  }
}
