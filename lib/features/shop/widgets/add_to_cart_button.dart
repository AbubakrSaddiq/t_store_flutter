import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: StoreColors.dark,
        borderRadius: BorderRadius.only(
            topLeft:
            Radius.circular(StoreSizes.cardRadiusMd),
            bottomRight:
            Radius.circular(StoreSizes.cardRadiusMd)),
      ),
      child: const SizedBox(
          width: StoreSizes.iconLg * 1,
          height: StoreSizes.iconLg * 1,
          child: Icon(
            Iconsax.add,
            color: StoreColors.white,
          )),
    );
  }
}
