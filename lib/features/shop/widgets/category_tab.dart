import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/widgets/product_card_vertical.dart';
import 'package:t_store/features/shop/widgets/section_heading.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_showcase.dart';
import 'layout/grid_layout.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key, required this.category,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              ///brands
              BrandShowcase(
                images: [StoreImages.prod11, StoreImages.prod10, StoreImages.prod8],
              ),
              const SizedBox(height: StoreSizes.spaceBtwItems / 2,),
              ///products
              SectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(height: StoreSizes.spaceBtwItems,),
              GridLayout(itemCount: 4, itemBuilder: (_ , index )  => const ProductCardVertical(),),
            ],
          ),
        ),
      ],
    );
  }
}
