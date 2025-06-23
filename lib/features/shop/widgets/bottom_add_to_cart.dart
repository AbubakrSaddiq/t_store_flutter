import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'circular_icon.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: StoreSizes.defaultSpace,
          vertical: StoreSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? StoreColors.darkerGrey : StoreColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(StoreSizes.cardRadiusLg),
          topRight: Radius.circular(StoreSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                background: StoreColors.darkerGrey,
                width: 40,
                height: 40,
                color: StoreColors.white,
              ),
              const SizedBox(
                width: StoreSizes.spaceBtwItems,
              ),
              const Text('2'),
              const SizedBox(
                width: StoreSizes.spaceBtwItems,
              ),
              CircularIcon(
                icon: Iconsax.add,
                background: StoreColors.darkerGrey,
                width: 40,
                height: 40,
                color: StoreColors.white,
              ),
            ],
          ),
          ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(StoreSizes.md),
                backgroundColor: StoreColors.black,
                side: const BorderSide(color: StoreColors.black)
              ),
              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
