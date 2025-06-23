import 'package:flutter/material.dart';
import 'package:t_store/features/shop/widgets/rounded_container.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);

    return RoundedContainer(
      showBorder: true,
      borderColor: StoreColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(StoreSizes.md),
      margin: const EdgeInsets.only(bottom: StoreSizes.spaceBtwItems),
      child: Column(
        children: [
          ///brand with products count
          const BrandCard(showBorder: false),
          const SizedBox(height: StoreSizes.spaceBtwItems,),
          ///brand top 3 product images
          Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context){
    return Expanded(child: RoundedContainer(
      height: 120,
      padding: const EdgeInsets.all(StoreSizes.md),
      margin: const EdgeInsets.only(right: StoreSizes.sm),
      backgroundColor: StoreHelperFunction.isDarkMode(context) ? StoreColors.grey : StoreColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image),),
    ));
  }
}
