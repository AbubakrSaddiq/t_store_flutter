import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/features/shop/widgets/product_image_slider.dart';
import 'package:t_store/features/shop/widgets/product_reviews.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/bottom_add_to_cart.dart';
import '../../widgets/product_attribute.dart';
import '../../widgets/product_meta_data.dart';
import '../../widgets/rating_share.dart';
import '../../widgets/section_heading.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///product image slider
            const ProductImageSlider(),

            ///product details
            Padding(
              padding: const EdgeInsets.only(
                  right: StoreSizes.defaultSpace,
                  left: StoreSizes.defaultSpace,
                  bottom: StoreSizes.defaultSpace),
              child: Column(
                children: [
                  ///ratings and share button
                  const RatingAndShare(),

                  ///price, title, stock, brand
                  const ProductMetaData(),

                  ///attribute
                  const ProductAttributes(),
                  const SizedBox(
                    height: StoreSizes.spaceBtwItems,
                  ),

                  ///checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: StoreSizes.spaceBtwSections,
                  ),

                  ///description
                  const SectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(
                    height: StoreSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley'
                        ' of type and scrambled it to make a type specimen book. '
                        'It has survived not only five centuries, but also the leap into electronic typesetting, '
                        'remaining essentially unchanged. It was popularised in the 1960s with the release of '
                        'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
                        'software like Aldus PageMaker including versions of Lorem Ipsum.',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' show more',
                    trimExpandedText: ' show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: StoreColors.primary),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: StoreColors.primary),

                  ),

                  ///reviews
                  const Divider(),
                  const SizedBox(height: StoreSizes.spaceBtwItems,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHeading(title: "Review (56)", showActionButton: false,),
                    IconButton(onPressed: () => Get.to(() => ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right))
                  ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
