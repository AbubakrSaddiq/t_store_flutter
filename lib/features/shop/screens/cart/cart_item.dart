import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../widgets/rounded_image.dart';
import '../../widgets/text/brand_text_with_verified_icon.dart';
import '../../widgets/text/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(imageUrl: StoreImages.prod12,
          backgroundColor: dark ? StoreColors.darkerGrey : StoreColors.light,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(StoreSizes.sm),
        ),
        const SizedBox(width: StoreSizes.spaceBtwItems,),
        ///title, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTextWithVerifiedIcon(title: 'Veritas'),
              const Flexible(child: ProductTitleText(title: 'Swade Casual', maxLine: 1,)),
              ///attribute
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color: ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Brown ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size: ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 38', style: Theme.of(context).textTheme.bodyLarge),

                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
