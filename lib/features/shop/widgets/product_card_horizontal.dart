import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/widgets/product_price_tag.dart';
import 'package:t_store/features/shop/widgets/rounded_container.dart';
import 'package:t_store/features/shop/widgets/rounded_image.dart';
import 'package:t_store/features/shop/widgets/text/brand_text_with_verified_icon.dart';
import 'package:t_store/features/shop/widgets/text/product_title_text.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'add_to_cart_button.dart';
import 'circular_icon.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StoreSizes.productImageRadius),
        color: dark ? StoreColors.darkerGrey : StoreColors.lightContainer,
      ),
      child: Row(
        children: [
          ///thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(StoreSizes.sm),
            backgroundColor: dark ? StoreColors.dark : StoreColors.light,
            child: Stack(
              children: [
                ///thumbnail image
                SizedBox(
                    height: 120,
                    width: 120,
                    child: RoundedImage(
                      imageUrl: StoreImages.prod5,
                      applyImageRadius: true,
                    )),

                ///sale tag
                Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: StoreSizes.sm,
                      backgroundColor: StoreColors.secondary.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(
                          horizontal: StoreSizes.sm, vertical: StoreSizes.xs),
                      child: Text(
                        '12%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: StoreColors.black),
                      ),
                    )),

                ///favorite icon
                const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.redAccent,
                    ))
              ],
            ),
          ),

          ///details
          const SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: StoreSizes.sm,left: StoreSizes.sm),
              child: Column(
                children: [
                  ///title and brand name
                   Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitleText(title: 'Drone with resolution camera', smallSize: true,),
                          SizedBox(height: StoreSizes.spaceBtwItems / 2,),
                          BrandTextWithVerifiedIcon(title: 'Samsung')
                        ],
                      ),
                  Spacer(),
                  ///price and add to cart btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///price
                      Flexible(child: ProductPriceTag(price: '130,000')),
                      AddToCartButton()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
