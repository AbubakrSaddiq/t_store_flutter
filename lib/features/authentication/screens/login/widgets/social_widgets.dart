import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class socialButtons extends StatelessWidget {
  const socialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///google icon
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: StoreColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: Image(
              width: StoreSizes.iconMd,
              height: StoreSizes.iconMd,
              image: AssetImage(StoreImages.google),
            ),
          ),
        ),
        const SizedBox(width: StoreSizes.spaceBtwSections,),
        ///facebook icon
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: StoreColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              width: StoreSizes.iconMd,
              height: StoreSizes.iconMd,
              image: AssetImage(StoreImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
