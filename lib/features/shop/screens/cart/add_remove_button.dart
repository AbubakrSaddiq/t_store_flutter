import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../widgets/circular_icon.dart';

class ProductQtyAddRemoveButton extends StatelessWidget {
  const ProductQtyAddRemoveButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          background: dark ? StoreColors.darkerGrey : StoreColors.light,
          color: dark ? StoreColors.white : StoreColors.black,
          size: StoreSizes.md,
        ),
        const SizedBox(width: StoreSizes.spaceBtwItems,),
        Text('2', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(width: StoreSizes.spaceBtwItems,),
        CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          background: StoreColors.primary,
          color: StoreColors.white ,
          size: StoreSizes.md,
        ),

      ],
    );
  }
}
