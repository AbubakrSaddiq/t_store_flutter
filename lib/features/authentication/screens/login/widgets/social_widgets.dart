import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class socialButtons extends StatelessWidget {
  const socialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: StoreColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
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
