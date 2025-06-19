import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkipBtn extends StatelessWidget {
  const OnBoardingSkipBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: StoreDeviceUtils.getAppBarHeight(),
        right: StoreSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
