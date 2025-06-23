import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/widgets/product_detail.dart';
import 'package:t_store/features/shop/widgets/product_price_tag.dart';
import 'package:t_store/features/shop/widgets/rounded_container.dart';
import 'package:t_store/features/shop/widgets/rounded_image.dart';
import 'package:t_store/features/shop/widgets/text/brand_text_with_verified_icon.dart';
import 'package:t_store/features/shop/widgets/text/product_title_text.dart';

import '../../../common/styles/shadow.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'add_to_cart_button.dart';
import 'icons/product_favorite_icon.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);

    ///container with side padding, color, edges, radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(StoreSizes.productImageRadius),
          color: dark ? StoreColors.darkerGrey : StoreColors.white,
        ),
        child: Column(
          children: [
            ///thumbnail, wishlist, discount
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(StoreSizes.sm),
              backgroundColor: dark ? StoreColors.dark : StoreColors.light,
              child: Stack(
                children: [
                  ///thumbnail image
                  RoundedImage(
                    imageUrl: StoreImages.prod1,
                    applyImageRadius: true,
                  ),

                  ///sale tag
                  Positioned(
                    top: 5,
                    left: 5,
                    child: RoundedContainer(
                      radius: StoreSizes.sm,
                      backgroundColor: StoreColors.saleTag.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: StoreSizes.sm, vertical: StoreSizes.xs),
                      child: Text(
                        '24%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: StoreColors.white),
                      ),
                    ),
                  ),

                  ///favorite icon button
                  const Positioned(
                      top: 1,
                      right: 1,
                      child: ProductFavoriteIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems / 2,
            ),

            ///product details
            const Padding(
              padding: EdgeInsets.only(left: StoreSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///product title
                  ProductTitleText(
                    title: 'Full Meal Platter',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: StoreSizes.spaceBtwItems / 2,
                  ),
                  BrandTextWithVerifiedIcon(title: 'Main Course',),
                //ToDo: paste code here
                ],
              ),
            ),

            //ToDo: Add Spacer() to keep the height of each box the same.
            //ToDo: Remove Spacer() and put 'price, add to cart' padding into 'product details' padding
            const Spacer(),
            ///price, add to cart
            const Padding(
              padding: EdgeInsets.all(StoreSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductPriceTag(
                    price: '70,000',
                  ),

                  ///add to cart
                  AddToCartButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


