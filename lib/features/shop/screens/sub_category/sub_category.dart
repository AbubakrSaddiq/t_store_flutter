import 'package:flutter/material.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/product_card_horizontal.dart';
import '../../widgets/rounded_image.dart';
import '../../widgets/section_heading.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(StoreSizes.defaultSpace),
        child: Column(
          children: [
            ///Banner
            RoundedImage(
              imageUrl: StoreImages.promo3,
              width: double.infinity,
              applyImageRadius: true,
            ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems,
            ),

            ///Sub category
            Column(
              children: [
                const SectionHeading(title: 'Full Meal'),
                const SizedBox(
                  height: StoreSizes.spaceBtwItems / 2,
                ),

                ///Horizontal card
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (_, __) => const ProductCardHorizontal(),
                      separatorBuilder: (_, __) => const SizedBox(
                            width: StoreSizes.spaceBtwItems,
                          ),
                      itemCount: 4),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
