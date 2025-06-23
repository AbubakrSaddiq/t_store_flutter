import 'package:flutter/material.dart';
import 'package:t_store/features/shop/widgets/product_price_tag.dart';
import 'package:t_store/features/shop/widgets/rounded_container.dart';
import 'package:t_store/features/shop/widgets/text/brand_text_with_verified_icon.dart';
import 'package:t_store/features/shop/widgets/text/product_title_text.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'circular_image.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///price and sale price
        Row(
          children: [
            ///price
            Text(
              'N250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: StoreSizes.spaceBtwItems,
            ),
            const ProductPriceTag(
              price: '140',
              isLarge: true,
            ),
            const SizedBox(
              width: StoreSizes.spaceBtwItems,
            ),

            ///sale tag
            RoundedContainer(
              radius: StoreSizes.sm,
              backgroundColor: StoreColors.secondary.withOpacity(0.7),
              padding: const EdgeInsets.symmetric(
                  horizontal: StoreSizes.sm, vertical: StoreSizes.xs),
              child: Text(
                '24%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: StoreColors.black),
              ),
            ),
            const SizedBox(
              width: StoreSizes.spaceBtwItems,
            ),
          ],
        ),
        const SizedBox(
          width: StoreSizes.spaceBtwItems,
        ),

        ///product title
        const Row(
          children: [
            ProductTitleText(title: 'Complete office set'),
          ],
        ),
        const SizedBox(
          width: StoreSizes.spaceBtwItems,
        ),

        ///stock and status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(
              width: StoreSizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          width: StoreSizes.spaceBtwItems,
        ),

        ///brand
        Row(
          children: [
            CircularImage(
              image: StoreImages.deviceIcon,
              width: 38,
              height: 38,
              overlayColor: StoreHelperFunction.isDarkMode(context)
                  ? StoreColors.white
                  : StoreColors.black,
            ),
            const BrandTextWithVerifiedIcon(
              title: 'Apple',
            ),
          ],
        ),

      ],
    );
  }
}
